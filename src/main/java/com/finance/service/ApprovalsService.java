package com.finance.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.AlreadyApprovedException;
import com.finance.exception.DateExpiredException;
import com.finance.exception.FirstApprovalCannotbeSameException;
import com.finance.model.ChitsEmiDetail;
import com.finance.model.ChitsModel;
import com.finance.model.ExpensesModel;
import com.finance.model.FinanceModel;
import com.finance.model.LoanEmiDetail;
import com.finance.model.MemberModel;
import com.finance.model.RevenueModel;
import com.finance.model.SettingsModel;
import com.finance.repository.ChitsEmiDetailRepository;
import com.finance.repository.ChitsRepository;
import com.finance.repository.ExpensesRepository;
import com.finance.repository.FinanceRepository;
import com.finance.repository.RevenueRepository;
import com.finance.user.MemberDetails;

import jakarta.servlet.http.HttpServletRequest;





/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Service
public class ApprovalsService {

	
	@Autowired
    private RevenueRepository revenueRepository;
	
	@Autowired
    private ChitsRepository chitsRepository;
	
	@Autowired
    private ChitsEmiDetailRepository chitsEmiDetailRepository;
	
	@Autowired
    private ExpensesRepository expensesRepository;
	
	@Autowired
    private FinanceRepository financeRepository;
	
	@Autowired
	private RevenueService revenueService;
	
	@Autowired
	private ExpensesService expensesService;
	
	@Autowired
	private ChitsService chitsService;
	
	@Autowired
	private SettingsService settingsService;
	
	
	public void revewnueAndExpensesList(Model model, LocalDate givenDate,MemberModel currentUser) {
		
		//Fetching Revenue List	START--
		List<RevenueModel> nonApprovedRevenueList = revenueService.getRevenueFromMondayToGivenDate(givenDate,currentUser);
		if(null != nonApprovedRevenueList && nonApprovedRevenueList.size() == 0) {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_REVENUE_LIST, null);
		}else {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_REVENUE_LIST, nonApprovedRevenueList);
		}
		//Fetching Revenue List	END--
		
		//Fetching Expenses List	START--
		List<ExpensesModel> nonApprovedExpensesList = expensesService.getExpensesFromMondayToGivenDate(givenDate,currentUser);
		if(null != nonApprovedExpensesList && nonApprovedExpensesList.size() == 0) {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_EXPENSES_LIST, null);
		}else {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_EXPENSES_LIST, nonApprovedExpensesList);
		}
		//Fetching Expenses List	END--
		
		
		//Fetching Chits List which is not started	START--
		List<ChitsModel> notApprovedChits =  chitsService.getAllChitsNotApproved(currentUser);
		 if(null != notApprovedChits && notApprovedChits.size() == 0) {
				model.addAttribute(ChunksFinanceConstants.NON_APPROVED_CHITS_LIST, null);
			}else {
				model.addAttribute(ChunksFinanceConstants.NON_APPROVED_CHITS_LIST, notApprovedChits);
		 }
		//Fetching Chits List which is not started	END--
		 
		
		//Fetching Chits EMI List  EMI Which is RUNNING------START
		 List<LoanEmiDetail.CurrentStatus> statusList = List.of(LoanEmiDetail.CurrentStatus.INPROGRESS, LoanEmiDetail.CurrentStatus.INITIAL_APPROVAL);
		 LocalDate startDate = givenDate.with(DayOfWeek.MONDAY).minusWeeks(1);
		 LocalDate nextSunday = givenDate.with(DayOfWeek.SUNDAY);
	        if (!nextSunday.isAfter(givenDate)) {
	            nextSunday = nextSunday.plusWeeks(1);
	        }
		 LocalDate endDate = nextSunday.plusWeeks(1);
		 List<ChitsEmiDetail> runningEMIList = chitsService.findPendingApprovals(statusList,currentUser,startDate,endDate);
		 model.addAttribute(ChunksFinanceConstants.NON_APPROVED_CHITS_EMI, runningEMIList);
		//Fetching Chits EMI List  EMI Which is RUNNING------END
		 
		 
		
		model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, givenDate);
	}
	
	
	 	 
	 @Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	 public boolean processApprovels(HttpServletRequest request,MemberDetails currenUser) {
		
		 String currentType =request.getParameter(ChunksFinanceConstants.CURRENT_TYPE);
		 String idNumber =request.getParameter(ChunksFinanceConstants.CURRENT_ID);
		 String idEMINumber =request.getParameter(ChunksFinanceConstants.CURRENT_EMI_ID);
		 String status =request.getParameter(ChunksFinanceConstants.STATUS);
		 
		 
		 if(ChunksFinanceConstants.REVENUE.equals(currentType) && null != idNumber) {
			 //  This is for only for processing of Revenue Items START
			 try {
				 	Integer revenueNum = Integer.parseInt(idNumber);
				 	Optional<RevenueModel> revenueOptional = revenueRepository.findById(revenueNum);
	                if (revenueOptional.isPresent()) {
	                    RevenueModel revenueModel = revenueOptional.get();
	                    if(!isBussinessExipredRule(revenueModel.getSpendDate(),ChunksFinanceConstants.REVENUE_STATUS)) {
	                    	throw new DateExpiredException(); 
	                    }
	                    if(revenueModel.getCurrentStatus().equals(RevenueModel.CurrentStatus.COMPLETED)) {
	                    	throw new AlreadyApprovedException();  
	                    }else {
	                    	if(revenueModel.getCurrentStatus().equals(RevenueModel.CurrentStatus.INPROGRESS)) {
	                    		if(currenUser.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
	                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
		                    			revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.INITIAL_APPROVAL);
		                    			revenueModel.setSecondapproverName(currenUser.getMember());
		                    			revenueModel.setSecondApprovalTime(LocalDateTime.now());
		                    		}else {
		                    			revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.REJECTED);
		                    			revenueModel.setSecondapproverName(currenUser.getMember());
		                    			revenueModel.setSecondApprovalTime(LocalDateTime.now());
		                    		}
	                    		}else {
	                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
		                    			revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.INITIAL_APPROVAL);
		                    			revenueModel.setFirstapproverName(currenUser.getMember());
		                    			revenueModel.setFirstApprovalTime(LocalDateTime.now());
		                    		}else {
		                    			revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.REJECTED);
		                    			revenueModel.setFirstapproverName(currenUser.getMember());
		                    			revenueModel.setFirstApprovalTime(LocalDateTime.now());
		                    		}
	                    		}
	                    	}else if(revenueModel.getCurrentStatus().equals(RevenueModel.CurrentStatus.INITIAL_APPROVAL)){
	                    		// Below condition is not written with appoved and reject cases...
	                    		if(currenUser.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
	                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
			                    		if(revenueModel.getFirstapproverName().getNo().equals(currenUser.getMember().getNo())) {
			                    			throw new FirstApprovalCannotbeSameException();  
			                    		}else {
			                    			revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.COMPLETED);
				                    		revenueModel.setSecondapproverName(currenUser.getMember());
			                    			revenueModel.setSecondApprovalTime(LocalDateTime.now());
				                    		FinanceModel currentModel = revenueModel.getFinanceType();
			  	                    		if(null != currentModel) {
			  	                    			Double currentBalance = currentModel.getCurrentBalance() + revenueModel.getSpendAmount();
			  	                    			currentModel.setCurrentBalance(currentBalance);
			  	                    			financeRepository.save(currentModel);
			  	                    		}
			                    		}	                    				
	                    				
	                    			}else {
	                    				revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.REJECTED);
		                    			revenueModel.setSecondapproverName(currenUser.getMember());
		                    			revenueModel.setSecondApprovalTime(LocalDateTime.now());
	                    			}

	                    		}else {
		                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
		                    				revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.COMPLETED);
				                    		revenueModel.setFirstapproverName(currenUser.getMember());
			                    			revenueModel.setFirstApprovalTime(LocalDateTime.now());
				                    		FinanceModel currentModel = revenueModel.getFinanceType();
			  	                    		if(null != currentModel) {
			  	                    			Double currentBalance = currentModel.getCurrentBalance() + revenueModel.getSpendAmount();
			  	                    			currentModel.setCurrentBalance(currentBalance);
			  	                    			financeRepository.save(currentModel);
			  	                    		}
		                    			}else {
		                    				revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.REJECTED);
			                    			revenueModel.setFirstapproverName(currenUser.getMember());
			                    			revenueModel.setFirstApprovalTime(LocalDateTime.now());
		                    			}
	                    		}
	                      }
	                   revenueRepository.save(revenueModel);
	                }
	            } 
	           }catch (NumberFormatException exception) {
	                
	           }
			 return true;
			 //  This is for only for processing of Revenue Items END	 
			 
		 }else if(ChunksFinanceConstants.EXPENSES.equals(currentType) && null != idNumber) {
			 //  This is for only for processing of Expenses Items START
			 try {
				 	Integer expensesNum = Integer.parseInt(idNumber);
				 	Optional<ExpensesModel> expensesOptional = expensesRepository.findById(expensesNum);
	                if (expensesOptional.isPresent()) {
	                    ExpensesModel expensesModel = expensesOptional.get();
	                    if(!isBussinessExipredRule(expensesModel.getSpendDate(),ChunksFinanceConstants.EXPENSES_STATUS)) {
	                    	throw new DateExpiredException(); 
	                    }
	                    if(expensesModel.getCurrentStatus().equals(ExpensesModel.CurrentStatus.COMPLETED)) {
	                    	throw new AlreadyApprovedException();  
	                    }else {
	                    	if(expensesModel.getCurrentStatus().equals(ExpensesModel.CurrentStatus.INPROGRESS)) {
	                    		if(currenUser.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
	                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
		                    			expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.INITIAL_APPROVAL);
		                    			expensesModel.setSecondapproverName(currenUser.getMember());
		                    			expensesModel.setSecondApprovalTime(LocalDateTime.now());
		                    		}else {
		                    			expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.REJECTED);
		                    			expensesModel.setSecondapproverName(currenUser.getMember());
		                    			expensesModel.setSecondApprovalTime(LocalDateTime.now());
		                    		}
	                    		}else {
	                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
		                    			expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.INITIAL_APPROVAL);
		                    			expensesModel.setFirstapproverName(currenUser.getMember());
		                    			expensesModel.setFirstApprovalTime(LocalDateTime.now());
		                    		}else {
		                    			expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.REJECTED);
		                    			expensesModel.setFirstapproverName(currenUser.getMember());
		                    			expensesModel.setFirstApprovalTime(LocalDateTime.now());
		                    		}
	                    		}
	                    	}else if(expensesModel.getCurrentStatus().equals(ExpensesModel.CurrentStatus.INITIAL_APPROVAL)){
	                    		// Below condition is not written with appoved and reject cases...
	                    		if(currenUser.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
	                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
			                    		if(expensesModel.getFirstapproverName().getNo().equals(currenUser.getMember().getNo())) {
			                    			throw new FirstApprovalCannotbeSameException();  
			                    		}else {
			                    			expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.COMPLETED);
				                    		expensesModel.setSecondapproverName(currenUser.getMember());
			                    			expensesModel.setSecondApprovalTime(LocalDateTime.now());
				                    		FinanceModel currentModel = expensesModel.getFinanceType();
			  	                    		if(null != currentModel) {
			  	                    			Double currentBalance = currentModel.getCurrentBalance() - expensesModel.getSpendAmount();
			  	                    			currentModel.setCurrentBalance(currentBalance);
			  	                    			financeRepository.save(currentModel);
			  	                    		}
			                    		}	                    				
	                    				
	                    			}else {
	                    				expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.REJECTED);
		                    			expensesModel.setSecondapproverName(currenUser.getMember());
		                    			expensesModel.setSecondApprovalTime(LocalDateTime.now());
	                    			}

	                    		}else {
		                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
		                    				expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.COMPLETED);
				                    		expensesModel.setFirstapproverName(currenUser.getMember());
			                    			expensesModel.setFirstApprovalTime(LocalDateTime.now());
				                    		FinanceModel currentModel = expensesModel.getFinanceType();
			  	                    		if(null != currentModel) {
			  	                    			Double currentBalance = currentModel.getCurrentBalance() - expensesModel.getSpendAmount();
			  	                    			currentModel.setCurrentBalance(currentBalance);
			  	                    			financeRepository.save(currentModel);
			  	                    		}
		                    			}else {
		                    				expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.REJECTED);
			                    			expensesModel.setFirstapproverName(currenUser.getMember());
			                    			expensesModel.setFirstApprovalTime(LocalDateTime.now());
		                    			}
	                    		}
	                      }
	                   expensesRepository.save(expensesModel);
	                }
	            } 
	           }catch (NumberFormatException exception) {
	                
	           }
			 return true;
			 //  This is for only for processing of Expenses Items END	  
		 } else if(ChunksFinanceConstants.CHITS.equals(currentType) && null != idNumber) {
			 
			 if(currenUser.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
				//  This is for only for processing of Chits Items START	  
				 ChitsModel chitsItem = chitsService.getChitByNo(Integer.parseInt(idNumber));
				 if(null != chitsItem) {
					 ChitsModel.CurrentStatus currentStatus = chitsItem.getCurrentStatus();
					 if(null != currentStatus && (currentStatus.equals(ChitsModel.CurrentStatus.REQUESTED))){
						 chitsItem.setCurrentStatus(ChitsModel.CurrentStatus.INITIAL_APPROVAL);
						 List<ChitsEmiDetail> allEmiDetails = chitsItem.getEmiDetails();
						 for (ChitsEmiDetail chitsEmiDetail : allEmiDetails) {
							 chitsEmiDetail.setCurrentStatus(ChitsEmiDetail.CurrentStatus.INITIAL_APPROVAL);
						 }
						 chitsItem.setEmiDetails(allEmiDetails);
						 
					 } else if(null != currentStatus && (currentStatus.equals(ChitsModel.CurrentStatus.INITIAL_APPROVAL))) {
						 chitsItem.setCurrentStatus(ChitsModel.CurrentStatus.INPROGRESS);
						 List<ChitsEmiDetail> allEmiDetails = chitsItem.getEmiDetails();
						 for (ChitsEmiDetail chitsEmiDetail : allEmiDetails) {
							 chitsEmiDetail.setCurrentStatus(ChitsEmiDetail.CurrentStatus.INPROGRESS);
						 }
						 chitsItem.setEmiDetails(allEmiDetails);
					 }
					 chitsItem.setSecondApprovalTime(LocalDateTime.now());
					 chitsItem.setSecondapproverName(currenUser.getMember());
					 chitsRepository.save(chitsItem);
				 }
				//  This is for only for processing of Chits Items END	  
			 }else {
				//  This is for only for processing of Chits Items START	  
				 ChitsModel chitsItem = chitsService.getChitByNo(Integer.parseInt(idNumber));
				 if(null != chitsItem) {
					 ChitsModel.CurrentStatus currentStatus = chitsItem.getCurrentStatus();
					 if(null != currentStatus && (currentStatus.equals(ChitsModel.CurrentStatus.REQUESTED))){
						 chitsItem.setCurrentStatus(ChitsModel.CurrentStatus.INITIAL_APPROVAL);
						 List<ChitsEmiDetail> allEmiDetails = chitsItem.getEmiDetails();
						 for (ChitsEmiDetail chitsEmiDetail : allEmiDetails) {
							 chitsEmiDetail.setCurrentStatus(ChitsEmiDetail.CurrentStatus.INITIAL_APPROVAL);
						 }
						 chitsItem.setEmiDetails(allEmiDetails);
					 } else if(null != currentStatus && (currentStatus.equals(ChitsModel.CurrentStatus.INITIAL_APPROVAL))) {
						 chitsItem.setCurrentStatus(ChitsModel.CurrentStatus.INPROGRESS);
						 List<ChitsEmiDetail> allEmiDetails = chitsItem.getEmiDetails();
						 for (ChitsEmiDetail chitsEmiDetail : allEmiDetails) {
							 chitsEmiDetail.setCurrentStatus(ChitsEmiDetail.CurrentStatus.INPROGRESS);
						 }
						 chitsItem.setEmiDetails(allEmiDetails);
					 }
					 chitsItem.setFirstApprovalTime(LocalDateTime.now());
					 chitsItem.setFirstapproverName(currenUser.getMember());
					 chitsRepository.save(chitsItem);
				 }
				//  This is for only for processing of Chits Items END	  		
			}
			 return true;	 
		 }else if(ChunksFinanceConstants.CHITSEMI.equals(currentType) && null != idNumber) {
				//  This is for only for processing of ChitsEMI Items START	  
			 ChitsModel chitsItem = chitsService.getChitByNo(Integer.parseInt(idNumber));
			 if(null != chitsItem) {
				 List<ChitsEmiDetail> emiDetails = chitsItem.getEmiDetails();
				 for (ChitsEmiDetail emiItem : emiDetails) {
					 if(null != idEMINumber && emiItem.getEmiNumber().equals(Integer.parseInt(idEMINumber))) {
						 ChitsEmiDetail.CurrentStatus currentStatus = emiItem.getCurrentStatus();
						 if(null !=currentStatus && currentStatus.equals(ChitsEmiDetail.CurrentStatus.INPROGRESS)) {
							 if(currenUser.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
								 emiItem.setSecondApprovalTime(LocalDateTime.now());
								 emiItem.setSecondapproverName(currenUser.getMember());
							 }else {
								 emiItem.setFirstApprovalTime(LocalDateTime.now());
								 emiItem.setFirstapproverName(currenUser.getMember());
							 }
							 emiItem.setCurrentStatus(ChitsEmiDetail.CurrentStatus.INITIAL_APPROVAL);
							 
						 }else if(null !=currentStatus && currentStatus.equals(ChitsEmiDetail.CurrentStatus.INITIAL_APPROVAL)) {
							 // Update to the type..
							    emiItem.setCurrentStatus(ChitsEmiDetail.CurrentStatus.PAID);
							 	FinanceModel currentModel = chitsItem.getFinanceType();
							 	Double currentBalance = currentModel.getCurrentBalance() - emiItem.getAmount().doubleValue();
                   				currentModel.setCurrentBalance(currentBalance);
                   				if(currenUser.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
   								 emiItem.setSecondApprovalTime(LocalDateTime.now());
   								 emiItem.setSecondapproverName(currenUser.getMember());
   							 }else {
   								 emiItem.setFirstApprovalTime(LocalDateTime.now());
   								 emiItem.setFirstapproverName(currenUser.getMember());
   							 }
                   				chitsEmiDetailRepository.save(emiItem);
                   				financeRepository.save(currentModel);
						 }
					 }
					
				}
			 }
			 
				//  This is for only for processing of ChitsEMI Items END
			 return true;	 
		 }
		 return false;
	 }
	 
	 private boolean isBussinessExipredRule(LocalDate spendDate,String settingName) {
		 if(null != spendDate) {
			 LocalDate today = LocalDate.now();
             LocalDate lastMonday = today.with(DayOfWeek.MONDAY);
             LocalDate upcomingSunday = today.with(DayOfWeek.SUNDAY);
             SettingsModel settingModelData = settingsService.getSettingByName(settingName);
             if(null != settingModelData) {
            	 String settingsValue = settingModelData.getSettingsValue();
            	 if(settingName.equals(ChunksFinanceConstants.REVENUE_STATUS) && settingsValue.equals(ChunksFinanceConstants.REVENUE_STATUS_YES)) {
            		 return true;
            	 }else if(settingName.equals(ChunksFinanceConstants.EXPENSES_STATUS) && settingsValue.equals(ChunksFinanceConstants.EXPENSES_STATUS_YES)) {
            		 return true;
            	 }
             }
           	 return (spendDate.isEqual(lastMonday) || spendDate.isAfter(lastMonday)) && (spendDate.isEqual(upcomingSunday) || spendDate.isBefore(upcomingSunday));
		 }else {
			 return false;
		 }
	 }
	

}

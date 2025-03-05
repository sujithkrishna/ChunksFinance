package com.finance.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
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
import com.finance.model.MemberModel;
import com.finance.model.RevenueModel;
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
    private ExpensesRepository expensesRepository;
	
	@Autowired
    private FinanceRepository financeRepository;
	
	@Autowired
	private RevenueService revenueService;
	
	@Autowired
	private ExpensesService expensesService;
	
	@Autowired
	private ChitsService chitsService;
	
	
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
		
		List<ChitsModel> notApprovedChits =  chitsService.getAllChitsNotApproved(currentUser.getNo());
		 if(null != notApprovedChits && notApprovedChits.size() == 0) {
				model.addAttribute(ChunksFinanceConstants.NON_APPROVED_CHITS_LIST, null);
			}else {
				model.addAttribute(ChunksFinanceConstants.NON_APPROVED_CHITS_LIST, notApprovedChits);
		 }
		//Fetching Chits List which is not started	END--
		 
		 
		
		//Fetching Chits List  EMI Which is RUNNING------START
		 List<ChitsModel> currentRunningChitsByMyApprovals = chitsService.getChitsByFinanceOwnerAndStatus(currentUser.getNo());
		 System.out.println("--------------------------currentRunningChitsByMyApprovals-------------------------"+currentRunningChitsByMyApprovals);
		// Calculate the current week's Monday and Sunday dates
		 LocalDate startDate = givenDate.with(DayOfWeek.MONDAY);
		 LocalDate endDate = givenDate.plusDays(6); // End date is Sunday of the same week
		 List<ChitsEmiDetail> emiDetailsInCurrentWeek = new ArrayList<ChitsEmiDetail>();

		 for (ChitsModel chit : currentRunningChitsByMyApprovals) {
		     List<ChitsEmiDetail> emiDetails = chit.getEmiDetails();
		     if (emiDetails != null) {
		         for (ChitsEmiDetail emi : emiDetails) {
		             LocalDate emiDate = emi.getEmiDate();
		             if (emiDate != null && !emiDate.isBefore(startDate) && !emiDate.isAfter(endDate)) {
		                 emiDetailsInCurrentWeek.add(emi);
		             }
		         }
		     }
		 }
		 
		 System.out.println("--------------------------emiDetailsInCurrentWeek-------------------------"+emiDetailsInCurrentWeek);

		 if(null != emiDetailsInCurrentWeek && emiDetailsInCurrentWeek.size() == 0) {
				model.addAttribute(ChunksFinanceConstants.NON_APPROVED_CHITS_EMI, null);
			}else {
				model.addAttribute(ChunksFinanceConstants.NON_APPROVED_CHITS_EMI, emiDetailsInCurrentWeek);
		 }
			//Fetching Chits List  EMI Which is RUNNING------END
		 
		 
		
		model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, givenDate);
	}
	
	
	 	 
	 @Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	 public boolean processApprovels(HttpServletRequest request,MemberDetails currenUser) {
		
		 String currentType =request.getParameter(ChunksFinanceConstants.CURRENT_TYPE);
		 String idNumber =request.getParameter(ChunksFinanceConstants.CURRENT_ID);
		 String status =request.getParameter(ChunksFinanceConstants.STATUS);
		 if(ChunksFinanceConstants.REVENUE.equals(currentType) && null != idNumber) {
			 //  This is for only for processing of Revenue Items START
			 try {
				 	Integer revenueNum = Integer.parseInt(idNumber);
				 	Optional<RevenueModel> revenueOptional = revenueRepository.findById(revenueNum);
	                if (revenueOptional.isPresent()) {
	                    RevenueModel revenueModel = revenueOptional.get();
	                    if(!isBussinessExipredRule(revenueModel.getSpendDate())) {
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
	                    if(!isBussinessExipredRule(expensesModel.getSpendDate())) {
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
		 }
		 return false;
	 }
	 
	 private boolean isBussinessExipredRule(LocalDate spendDate) {
		 if(null != spendDate) {
			 LocalDate today = LocalDate.now();
             LocalDate lastMonday = today.with(DayOfWeek.MONDAY);
             LocalDate upcomingSunday = today.with(DayOfWeek.SUNDAY);
             return (spendDate.isEqual(lastMonday) || spendDate.isAfter(lastMonday)) && (spendDate.isEqual(upcomingSunday) || spendDate.isBefore(upcomingSunday));
		 }else {
			 return false;
		 }
	 }
	

}

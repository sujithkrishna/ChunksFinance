package com.finance.service;

import java.math.BigDecimal;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
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
import com.finance.model.AccountTransactionsModel;
import com.finance.model.ChitsEmiDetail;
import com.finance.model.ChitsModel;
import com.finance.model.ExpensesModel;
import com.finance.model.FinanceModel;
import com.finance.model.FinanceTransferModel;
import com.finance.model.LoanEmiDetail;
import com.finance.model.LoanModel;
import com.finance.model.LoanModel.CurrentStatus;
import com.finance.model.MemberModel;
import com.finance.model.RevenueModel;
import com.finance.model.SettingsModel;
import com.finance.repository.AccountTransactionsRepository;
import com.finance.repository.ChitsEmiDetailRepository;
import com.finance.repository.ChitsRepository;
import com.finance.repository.ExpensesRepository;
import com.finance.repository.FinanceRepository;
import com.finance.repository.LoanEmiDetailRepository;
import com.finance.repository.LoanRepository;
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
    private LoanRepository loanRepository;
	
	@Autowired
	private LoanEmiDetailRepository emiDetailRepository;
	
	@Autowired
    private ChitsEmiDetailRepository chitsEmiDetailRepository;
	
	@Autowired
    private ExpensesRepository expensesRepository;
	
	@Autowired
    private FinanceRepository financeRepository;
	
	@Autowired
	private RevenueService revenueService;
	
	@Autowired
	private LoanService loanService;
	
	@Autowired
	private ExpensesService expensesService;
	
	@Autowired
	private ChitsService chitsService;
	
	@Autowired
	private SettingsService settingsService;
	
	@Autowired
	private LoanEmiDetailService emiDetailService;
	
	@Autowired
	private CreateFinanceService createFinanceService;
	
	@Autowired
	private AccountTransactionsService accountTransactionsService;
	
	@Autowired
	private AccountTransactionsRepository accountTransactionsRepository;
	
	@Autowired
	private FinanceTransferService financeTransferService;
	
	public void displayApprovalList(Model model, LocalDate givenDate,MemberModel currentUser) {
		
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
		 
		
		//Fetching All the new Chits created Just now and waiting for Approvals.------START
		 List<LoanModel> bycurrentLoanWaitingforApprovals = loanService.findLoansByStatusAndApprover(LoanModel.CurrentStatus.REQUESTED,currentUser);
		 model.addAttribute(ChunksFinanceConstants.CURRENT_LOAN_WAITFOR_APPROVAL, bycurrentLoanWaitingforApprovals);
		//Fetching All the new Chits created Just now and waiting for Approvals.------END
		 
		// Fetching All paid LOAN EMI for approval process. START
		 List<LoanEmiDetail> paidLoanEmiDetails = emiDetailService.getPaidLoanEmiDetails(currentUser);
		 model.addAttribute(ChunksFinanceConstants.CURRENT_EMI_WAITFOR_APPROVAL, paidLoanEmiDetails);
		// Fetching All paid LOAN EMI for approval process.	 END	 
		 
		 
		 LocalDateTime localDateTimeInIST = ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime();
			LocalDate today = localDateTimeInIST.toLocalDate();
			LocalDate upcomingSunday = null;
			if (today.getDayOfWeek() == DayOfWeek.SUNDAY) {
				upcomingSunday= today;
	        }
			int daysUntilSunday = DayOfWeek.SUNDAY.getValue() - today.getDayOfWeek().getValue();
	        if (daysUntilSunday < 0) {
	            daysUntilSunday += 7; // Move to the next week's Sunday
	        }
	        upcomingSunday= today.plusDays(daysUntilSunday);
		 
		// Fetching All paid Weekly Collection/Primary Accounts for approval process. START
	        if(currentUser.getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
	       	 SettingsModel settingModelData = settingsService.getSettingByName(ChunksFinanceConstants.APPROVAL_PROCESS);
	       	 String approvalProcessStatus = null;
	       	 if(null != settingModelData) {
	       		 approvalProcessStatus = settingModelData.getSettingsValue();
	       	 }
	        if(ChunksFinanceConstants.APPROVAL_PROCESS_SEQUENTIAL.equals(approvalProcessStatus)) {
	        	List<FinanceModel> activePrimaryFinancesWithOwner = createFinanceService.getActivePrimaryFinancesWithOwner(currentUser);
	        	 List<AccountTransactionsModel> listPendingApprovalTransation= new ArrayList<AccountTransactionsModel>();
	    		 for (FinanceModel finItem : activePrimaryFinancesWithOwner) {
	    			 List<AccountTransactionsModel> pendingTransactionsForPrimaryAccount = accountTransactionsService.getPendingTransactionsForPrimaryAccountSequential(finItem,upcomingSunday);
	    			 listPendingApprovalTransation.addAll(pendingTransactionsForPrimaryAccount);
	    		 }
	    		 model.addAttribute(ChunksFinanceConstants.CURRENT_PRIMARY_APPROVAL, listPendingApprovalTransation);	 
	        }else {
	        	List<FinanceModel> activePrimaryFinancesWithOwner = createFinanceService.getActivePrimaryFinancesWithOwner(currentUser);
	        	 List<AccountTransactionsModel> listPendingApprovalTransation= new ArrayList<AccountTransactionsModel>();
	    		 for (FinanceModel finItem : activePrimaryFinancesWithOwner) {
	    			 List<AccountTransactionsModel> pendingTransactionsForPrimaryAccount = accountTransactionsService.getPendingTransactionsForPrimaryAccountParallel(finItem,upcomingSunday);
	    			 listPendingApprovalTransation.addAll(pendingTransactionsForPrimaryAccount);
	    		 }
	    		 model.addAttribute(ChunksFinanceConstants.CURRENT_PRIMARY_APPROVAL, listPendingApprovalTransation);	 
	        }
	        }else {
	       	 // Return
	        	 List<FinanceModel> activePrimaryFinancesWithOwner = createFinanceService.getActivePrimaryFinancesWithOwner(currentUser);
	    		 List<AccountTransactionsModel> listPendingApprovalTransation= new ArrayList<AccountTransactionsModel>();
	    		 for (FinanceModel finItem : activePrimaryFinancesWithOwner) {
	    			 List<AccountTransactionsModel> pendingTransactionsForPrimaryAccount = accountTransactionsService.getPendingTransactionsForPrimaryAccount(finItem,upcomingSunday);
	    			 listPendingApprovalTransation.addAll(pendingTransactionsForPrimaryAccount);
	    		 }
	    		 model.addAttribute(ChunksFinanceConstants.CURRENT_PRIMARY_APPROVAL, listPendingApprovalTransation);	        	
	        }   
		 // Fetching All paid Weekly Collection/Primary Accounts for approval process. END
	        
	        String secondaryApprovalCutDay = settingsService.getSettingByName(ChunksFinanceConstants.SECONDARY_APPROVAL_CUTOFF_DAY).getSettingsValue();
			String secondaryApprovalCutTime = settingsService.getSettingByName(ChunksFinanceConstants.SECONDARY_APPROVAL_CUTOFF_TIME).getSettingsValue();
			
	        LocalDate todaywithZone = ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDate();
	        LocalDateTime localDateTimeIST = ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime();
			
	        DayOfWeek targetDay = DayOfWeek.valueOf(secondaryApprovalCutDay.toUpperCase(Locale.ROOT));
	        LocalTime cutOffTime = LocalTime.parse(secondaryApprovalCutTime, DateTimeFormatter.ofPattern(ChunksFinanceConstants.HH_MM));
	        LocalDate nextTargetDate = todaywithZone.with(TemporalAdjusters.next(targetDay));
	        LocalDateTime secondaryApprovalCutoffDateTime = LocalDateTime.of(nextTargetDate, cutOffTime);
	        LocalDateTime endOfSunday = LocalDateTime.of(nextTargetDate, LocalTime.of(23, 59));
	        System.out.println("-----localDateTimeIST----"+localDateTimeIST);
	        System.out.println("-----secondaryApprovalCutoffDateTime----"+secondaryApprovalCutoffDateTime);
	        System.out.println("-----endOfSunday----"+endOfSunday);
	        boolean timeStatustoDisplay = false;
	        if (localDateTimeIST.isAfter(secondaryApprovalCutoffDateTime) && localDateTimeIST.isBefore(endOfSunday)) {
	        	timeStatustoDisplay = true;
	        } else {
	        	timeStatustoDisplay = false;
	        }
	        
	        // Bypassing here for Testing Remove below line after validation now.
	        timeStatustoDisplay = true;
	        
	       
	     // Fetching All paid Secondary for approval process. START
	        if(currentUser.getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
		       	 SettingsModel settingModelData = settingsService.getSettingByName(ChunksFinanceConstants.APPROVAL_PROCESS);
		       	 String approvalProcessStatus = null;
		       	 if(null != settingModelData) {
		       		 approvalProcessStatus = settingModelData.getSettingsValue();
		       	 }
		       	if(ChunksFinanceConstants.APPROVAL_PROCESS_SEQUENTIAL.equals(approvalProcessStatus)) {
		       		 if(timeStatustoDisplay) {	
		       			 List<AccountTransactionsModel> pendingList = new ArrayList<AccountTransactionsModel>(); 
			    		 List<FinanceModel> activeFinancesSecondary = financeRepository.findActiveSecondaryFinances();
			    		 for (FinanceModel finItem : activeFinancesSecondary) {
			    			   List<AccountTransactionsModel> pendingTransactionsForSecondaryAccount = accountTransactionsService.getPendingTransactionsForSecondayAccountSequential(finItem,upcomingSunday);
			    			   pendingList.addAll(pendingTransactionsForSecondaryAccount);
			    		 }
		       			 model.addAttribute(ChunksFinanceConstants.CURRENT_SECONDARY_APPROVAL, pendingList);
		       		 }
		       	}else {
		       		if(timeStatustoDisplay) {
	       			 List<AccountTransactionsModel> pendingList = new ArrayList<AccountTransactionsModel>(); 
		    		 List<FinanceModel> activeFinancesSecondary = financeRepository.findActiveSecondaryFinances();
		    		 for (FinanceModel finItem : activeFinancesSecondary) {
		    			   List<AccountTransactionsModel> pendingTransactionsForSecondaryAccount = accountTransactionsService.getPendingTransactionsForSecondayAccountParallel(finItem,upcomingSunday);
		    			   pendingList.addAll(pendingTransactionsForSecondaryAccount);
		    		 }
		       		 model.addAttribute(ChunksFinanceConstants.CURRENT_SECONDARY_APPROVAL, pendingList);	 
		       		} 
		       	}
	       }else {
	    	   if(timeStatustoDisplay) {
	    		   List<AccountTransactionsModel> pendingList = new ArrayList<AccountTransactionsModel>(); 
	    		   List<FinanceModel> activeFinancesWithOwner = financeRepository.findActiveFinancesWithOwner(currentUser);
	    		   for (FinanceModel finItem : activeFinancesWithOwner) {
	    			   List<AccountTransactionsModel> pendingTransactionsForSecondaryAccount = accountTransactionsService.getPendingTransactionsForSecondayAccount(finItem,upcomingSunday);
	    			   pendingList.addAll(pendingTransactionsForSecondaryAccount);
	    		   	}
	    		   model.addAttribute(ChunksFinanceConstants.CURRENT_SECONDARY_APPROVAL, pendingList);
	    	   }   
	       }   
	     // Fetching All paid Secondary Accounts for approval process. END    
	        
	        
	        
	        
	        
	        
	      // Fetching All Pre closure request for approval process. START
	        
	        if(currentUser.getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
	        	 SettingsModel settingModelData = settingsService.getSettingByName(ChunksFinanceConstants.APPROVAL_PROCESS);
	        	 String approvalProcessStatus = null;
	        		 if(null != settingModelData) {
	        			 approvalProcessStatus = settingModelData.getSettingsValue();
	        		 }
	        		if(ChunksFinanceConstants.APPROVAL_PROCESS_SEQUENTIAL.equals(approvalProcessStatus)) {
	        			List<LoanModel> allPreclosureLoan = loanService.getAllPreclosureLoanForAdminSequential();
	        	        model.addAttribute(ChunksFinanceConstants.CURRENT_PRECLOSURE_APPROVAL, allPreclosureLoan);	      
	        		}else {
		        		List<LoanModel> allPreclosureLoan = loanService.getAllPreclosureLoanForAdminParallel();
	        	        model.addAttribute(ChunksFinanceConstants.CURRENT_PRECLOSURE_APPROVAL, allPreclosureLoan);	        			
	        		}
	        	}else {
	        		List<LoanModel> allPreclosureLoan = loanService.getAllPreclosureLoanForFinOwner(currentUser);
        	        model.addAttribute(ChunksFinanceConstants.CURRENT_PRECLOSURE_APPROVAL, allPreclosureLoan);	        			
	        	}   
	        // Fetching All Pre closure request for approval process. END
		 
	        // Fetching All Inter transfer Fund request for approval process. START
	        if(currentUser.getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
	        	 SettingsModel settingModelData = settingsService.getSettingByName(ChunksFinanceConstants.APPROVAL_PROCESS);
	        	 String approvalProcessStatus = null;
	        		 if(null != settingModelData) {
	        			 approvalProcessStatus = settingModelData.getSettingsValue();
	        		 }
	        		if(ChunksFinanceConstants.APPROVAL_PROCESS_SEQUENTIAL.equals(approvalProcessStatus)) {
	        			List<FinanceTransferModel> fetchAllFinanceTransfersForFinanceOwner = financeTransferService.fetchAllFinanceTransfersForAdmin(currentUser);
	        	        model.addAttribute(ChunksFinanceConstants.CURRENT_FINANCE_TRANSFER_APPROVAL, fetchAllFinanceTransfersForFinanceOwner);	      
	        		}else {
	        			List<FinanceTransferModel> fetchAllFinanceTransfersForFinanceOwner = financeTransferService.fetchAllFinanceTransfersForAdmin(currentUser);
	        	        model.addAttribute(ChunksFinanceConstants.CURRENT_FINANCE_TRANSFER_APPROVAL, fetchAllFinanceTransfersForFinanceOwner);	        			
	        		}
	        	}else {
	        		List<FinanceTransferModel> fetchAllFinanceTransfersForFinanceOwner = financeTransferService.fetchAllFinanceTransfersForFinanceOwner(currentUser);
	        		model.addAttribute(ChunksFinanceConstants.CURRENT_FINANCE_TRANSFER_APPROVAL, fetchAllFinanceTransfersForFinanceOwner);	        			
	        	}   
	        // Fetching All Inter transfer Fund request for approval process. END
		 
		model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, givenDate);
	}
	
	
	 	 
	 @Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	 public boolean processApprovels(HttpServletRequest request,MemberDetails currentUserModel) {
		
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
	                    		if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
	                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
		                    			revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.INITIAL_APPROVAL);
		                    			revenueModel.setSecondapproverName(currentUserModel.getMember());
		                    			revenueModel.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
		                    		}else {
		                    			revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.REJECTED);
		                    			revenueModel.setSecondapproverName(currentUserModel.getMember());
		                    			revenueModel.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
		                    		}
	                    		}else {
	                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
		                    			revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.INITIAL_APPROVAL);
		                    			revenueModel.setFirstapproverName(currentUserModel.getMember());
		                    			revenueModel.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
		                    		}else {
		                    			revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.REJECTED);
		                    			revenueModel.setFirstapproverName(currentUserModel.getMember());
		                    			revenueModel.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
		                    		}
	                    		}
	                    	}else if(revenueModel.getCurrentStatus().equals(RevenueModel.CurrentStatus.INITIAL_APPROVAL)){
	                    		// Below condition is not written with appoved and reject cases...
	                    		if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
	                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
			                    		if(revenueModel.getFirstapproverName().getNo().equals(currentUserModel.getMember().getNo())) {
			                    			throw new FirstApprovalCannotbeSameException();  
			                    		}else {
			                    			revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.COMPLETED);
				                    		revenueModel.setSecondapproverName(currentUserModel.getMember());
			                    			revenueModel.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
				                    		FinanceModel currentModel = revenueModel.getFinanceType();
			  	                    		if(null != currentModel) {
			  	                    			Double currentBalance = currentModel.getCurrentBalance() + revenueModel.getSpendAmount();
			  	                    			currentModel.setCurrentBalance(currentBalance);
			  	                    			financeRepository.save(currentModel);
			  	                    		}
			                    		}	                    				
	                    				
	                    			}else {
	                    				revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.REJECTED);
		                    			revenueModel.setSecondapproverName(currentUserModel.getMember());
		                    			revenueModel.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
	                    			}

	                    		}else {
		                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
		                    				revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.COMPLETED);
				                    		revenueModel.setFirstapproverName(currentUserModel.getMember());
			                    			revenueModel.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
				                    		FinanceModel currentModel = revenueModel.getFinanceType();
			  	                    		if(null != currentModel) {
			  	                    			Double currentBalance = currentModel.getCurrentBalance() + revenueModel.getSpendAmount();
			  	                    			currentModel.setCurrentBalance(currentBalance);
			  	                    			financeRepository.save(currentModel);
			  	                    		}
		                    			}else {
		                    				revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.REJECTED);
			                    			revenueModel.setFirstapproverName(currentUserModel.getMember());
			                    			revenueModel.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
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
	                    		if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
	                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
		                    			expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.INITIAL_APPROVAL);
		                    			expensesModel.setSecondapproverName(currentUserModel.getMember());
		                    			expensesModel.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
		                    		}else {
		                    			expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.REJECTED);
		                    			expensesModel.setSecondapproverName(currentUserModel.getMember());
		                    			expensesModel.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
		                    		}
	                    		}else {
	                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
		                    			expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.INITIAL_APPROVAL);
		                    			expensesModel.setFirstapproverName(currentUserModel.getMember());
		                    			expensesModel.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
		                    		}else {
		                    			expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.REJECTED);
		                    			expensesModel.setFirstapproverName(currentUserModel.getMember());
		                    			expensesModel.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
		                    		}
	                    		}
	                    	}else if(expensesModel.getCurrentStatus().equals(ExpensesModel.CurrentStatus.INITIAL_APPROVAL)){
	                    		// Below condition is not written with appoved and reject cases...
	                    		if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
	                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
			                    		if(expensesModel.getFirstapproverName().getNo().equals(currentUserModel.getMember().getNo())) {
			                    			throw new FirstApprovalCannotbeSameException();  
			                    		}else {
			                    			expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.COMPLETED);
				                    		expensesModel.setSecondapproverName(currentUserModel.getMember());
			                    			expensesModel.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
				                    		FinanceModel currentModel = expensesModel.getFinanceType();
			  	                    		if(null != currentModel) {
			  	                    			Double currentBalance = currentModel.getCurrentBalance() - expensesModel.getSpendAmount();
			  	                    			currentModel.setCurrentBalance(currentBalance);
			  	                    			financeRepository.save(currentModel);
			  	                    		}
			                    		}	                    				
	                    				
	                    			}else {
	                    				expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.REJECTED);
		                    			expensesModel.setSecondapproverName(currentUserModel.getMember());
		                    			expensesModel.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
	                    			}

	                    		}else {
		                    			if(status.equalsIgnoreCase(ChunksFinanceConstants.APPROVED)) {
		                    				expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.COMPLETED);
				                    		expensesModel.setFirstapproverName(currentUserModel.getMember());
			                    			expensesModel.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
				                    		FinanceModel currentModel = expensesModel.getFinanceType();
			  	                    		if(null != currentModel) {
			  	                    			Double currentBalance = currentModel.getCurrentBalance() - expensesModel.getSpendAmount();
			  	                    			currentModel.setCurrentBalance(currentBalance);
			  	                    			financeRepository.save(currentModel);
			  	                    		}
		                    			}else {
		                    				expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.REJECTED);
			                    			expensesModel.setFirstapproverName(currentUserModel.getMember());
			                    			expensesModel.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
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
			 
			 if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
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
					 chitsItem.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
					 chitsItem.setSecondapproverName(currentUserModel.getMember());
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
					 chitsItem.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
					 chitsItem.setFirstapproverName(currentUserModel.getMember());
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
							 if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
								 emiItem.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
								 emiItem.setSecondapproverName(currentUserModel.getMember());
							 }else {
								 emiItem.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
								 emiItem.setFirstapproverName(currentUserModel.getMember());
							 }
							 emiItem.setCurrentStatus(ChitsEmiDetail.CurrentStatus.INITIAL_APPROVAL);
							 
						 }else if(null !=currentStatus && currentStatus.equals(ChitsEmiDetail.CurrentStatus.INITIAL_APPROVAL)) {
							 // Update to the type..
							    emiItem.setCurrentStatus(ChitsEmiDetail.CurrentStatus.PAID);
							 	FinanceModel currentModel = chitsItem.getFinanceType();
							 	Double currentBalance = currentModel.getCurrentBalance() - emiItem.getAmount().doubleValue();
                   				currentModel.setCurrentBalance(currentBalance);
                   				if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
   								 emiItem.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
   								 emiItem.setSecondapproverName(currentUserModel.getMember());
   							 }else {
   								 emiItem.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
   								 emiItem.setFirstapproverName(currentUserModel.getMember());
   							 }
                   				chitsEmiDetailRepository.save(emiItem);
                   				financeRepository.save(currentModel);
						 }
					 }
					
				}
			 }
			 
				//  This is for only for processing of ChitsEMI Items END
			 return true;	 
		 }else if(ChunksFinanceConstants.LOANS.equals(currentType) && null != idNumber) {
			 	Optional<LoanModel> loanItem = loanRepository.findByLoanNo(Integer.parseInt(idNumber));
			 	if(loanItem.isPresent()) {
			 		if(loanItem.get().getCurrentStatus().equals(CurrentStatus.REQUESTED)) {
			 			if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
			 				loanItem.get().setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
			 				loanItem.get().setSecondapproverName(currentUserModel.getMember());
			 				loanItem.get().setCurrentStatus(CurrentStatus.INITIAL_APPROVAL);
			 				List<LoanEmiDetail> emiDetails = loanItem.get().getEmiDetails();
			 				for (LoanEmiDetail loanEmiItem : emiDetails) {
			 					loanEmiItem.setCurrentStatus(LoanEmiDetail.CurrentStatus.INITIAL_APPROVAL);
			 					loanEmiItem.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
			 					loanEmiItem.setSecondapproverName(currentUserModel.getMember());
			 					emiDetailRepository.save(loanEmiItem);
							}
			 				loanRepository.save(loanItem.get());
			 			}else {
			 				loanItem.get().setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
			 				loanItem.get().setFirstapproverName(currentUserModel.getMember());
			 				loanItem.get().setCurrentStatus(CurrentStatus.INITIAL_APPROVAL);
			 				List<LoanEmiDetail> emiDetails = loanItem.get().getEmiDetails();
			 				for (LoanEmiDetail loanEmiItem : emiDetails) {
			 					loanEmiItem.setCurrentStatus(LoanEmiDetail.CurrentStatus.INITIAL_APPROVAL);
			 					loanEmiItem.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
			 					loanEmiItem.setFirstapproverName(currentUserModel.getMember());
			 					emiDetailRepository.save(loanEmiItem);
							}
			 				loanRepository.save(loanItem.get());
			 			}
			 		}else if(loanItem.get().getCurrentStatus().equals(CurrentStatus.INITIAL_APPROVAL)) {
			 			if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
			 				loanItem.get().setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
			 				loanItem.get().setSecondapproverName(currentUserModel.getMember());
			 				loanItem.get().setCurrentStatus(CurrentStatus.INPROGRESS);
			 				// Update the Finance with current balance should subtract from Disbursement amt
			 				FinanceModel financeItem =  loanItem.get().getFinanceType();
			 				Double currentFinBal = financeItem.getCurrentBalance();
			 				currentFinBal = currentFinBal - loanItem.get().getDisbursementAmount().doubleValue();
			 				financeItem.setCurrentBalance(currentFinBal);
			 				financeRepository.save(financeItem);
			 				
			 				List<LoanEmiDetail> emiDetails = loanItem.get().getEmiDetails();
			 				for (LoanEmiDetail loanEmiItem : emiDetails) {
			 					loanEmiItem.setCurrentStatus(LoanEmiDetail.CurrentStatus.INPROGRESS);
			 					loanEmiItem.setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
			 					loanEmiItem.setSecondapproverName(currentUserModel.getMember());
			 					emiDetailRepository.save(loanEmiItem);
							}
			 				loanRepository.save(loanItem.get());
			 			}else {
			 				loanItem.get().setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
			 				loanItem.get().setFirstapproverName(currentUserModel.getMember());
			 				loanItem.get().setCurrentStatus(CurrentStatus.INPROGRESS);
			 				// Update the Finance with current balance should subtract from Disbursement amt
			 				FinanceModel financeItem =  loanItem.get().getFinanceType();
			 				Double currentFinBal = financeItem.getCurrentBalance();
			 				currentFinBal = currentFinBal - loanItem.get().getDisbursementAmount().doubleValue();
			 				financeItem.setCurrentBalance(currentFinBal);
			 				financeRepository.save(financeItem);
			 				
			 				
			 				List<LoanEmiDetail> emiDetails = loanItem.get().getEmiDetails();
			 				for (LoanEmiDetail loanEmiItem : emiDetails) {
			 					loanEmiItem.setCurrentStatus(LoanEmiDetail.CurrentStatus.INPROGRESS);
			 					loanEmiItem.setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
			 					loanEmiItem.setFirstapproverName(currentUserModel.getMember());
			 					emiDetailRepository.save(loanEmiItem);
							}
			 				loanRepository.save(loanItem.get());
			 			}
			 		}
			 		
			 	}
			return true;	 
		 }else if(ChunksFinanceConstants.LOAN_EMI.equals(currentType) && null != idNumber) {
			 Optional<LoanEmiDetail> emiItem = emiDetailRepository.findById(Integer.parseInt(idEMINumber));
			 if(null != emiItem && emiItem.isPresent()) {
				 if(emiItem.get().getCurrentStatus().equals(LoanEmiDetail.CurrentStatus.PAYMENT_SUBMITTED) && emiItem.get().getEmiAmount().compareTo(emiItem.get().getPaidAmount()) == 0 ) {
					 if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
						 // Check this scenario
						 emiItem.get().setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
						 emiItem.get().setSecondapproverName(currentUserModel.getMember());
						 emiItem.get().setCurrentStatus(LoanEmiDetail.CurrentStatus.PAYMENT_INITIAL_APPROVAL);
						 emiDetailRepository.save(emiItem.get());
					 }else {
						 emiItem.get().setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
						 emiItem.get().setFirstapproverName(currentUserModel.getMember());
						 emiItem.get().setCurrentStatus(LoanEmiDetail.CurrentStatus.PAYMENT_INITIAL_APPROVAL);
						 emiDetailRepository.save(emiItem.get());
					 }
				 }else if(emiItem.get().getCurrentStatus().equals(LoanEmiDetail.CurrentStatus.PAYMENT_INITIAL_APPROVAL) && emiItem.get().getEmiAmount().compareTo(emiItem.get().getPaidAmount()) == 0 ) {
					 if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
						 emiItem.get().setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
						 emiItem.get().setSecondapproverName(currentUserModel.getMember());
						 emiItem.get().setCurrentStatus(LoanEmiDetail.CurrentStatus.PAID);
						 emiDetailRepository.save(emiItem.get());
						 // Update the Remaining Balance and Received amount
						 LoanModel currentLoan = emiItem.get().getLoan();
						 BigDecimal receivedAmount = emiItem.get().getLoan().getReceivedAmount();
						 BigDecimal remainingBalance = emiItem.get().getLoan().getRemainingBalance();
						 receivedAmount = receivedAmount.add(emiItem.get().getEmiAmount());
						 remainingBalance = remainingBalance.subtract(emiItem.get().getEmiAmount());
						 currentLoan.setReceivedAmount(receivedAmount);
						 currentLoan.setRemainingBalance(remainingBalance);
						 loanRepository.save(currentLoan);
						 
						 // Update in the Finance
						 FinanceModel financeItem = emiItem.get().getLoan().getFinanceType();
						 Double currentBalance = financeItem.getCurrentBalance();
						 currentBalance = currentBalance+ emiItem.get().getEmiAmount().doubleValue();
						 financeItem.setCurrentBalance(currentBalance);
						 financeRepository.save(financeItem);
					 }else {
						 emiItem.get().setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
						 emiItem.get().setFirstapproverName(currentUserModel.getMember());
						 emiItem.get().setCurrentStatus(LoanEmiDetail.CurrentStatus.PAID);
						 emiDetailRepository.save(emiItem.get());
						 // Update the Remaining Balance and Received amount
						 LoanModel currentLoan = emiItem.get().getLoan();
						 BigDecimal receivedAmount = emiItem.get().getLoan().getReceivedAmount();
						 BigDecimal remainingBalance = emiItem.get().getLoan().getRemainingBalance();
						 receivedAmount = receivedAmount.add(emiItem.get().getEmiAmount());
						 remainingBalance = remainingBalance.subtract(emiItem.get().getEmiAmount());
						 currentLoan.setReceivedAmount(receivedAmount);
						 currentLoan.setRemainingBalance(remainingBalance);
						 loanRepository.save(currentLoan);
						 
						 // Update in the Finance
						 FinanceModel financeItem = emiItem.get().getLoan().getFinanceType();
						 Double currentBalance = financeItem.getCurrentBalance();
						 currentBalance = currentBalance+ emiItem.get().getEmiAmount().doubleValue();
						 financeItem.setCurrentBalance(currentBalance);
						 financeRepository.save(financeItem);
					 }
				 }
				 return true;	 
			 }
		 }else if(ChunksFinanceConstants.WEEKLY.equals(currentType) && null != idNumber) {
			 Optional<AccountTransactionsModel> accountTransationItem = accountTransactionsRepository.findById(Integer.parseInt(idNumber));
			 if(null != accountTransationItem && accountTransationItem.isPresent()) {
				 if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
					 accountTransationItem.get().setSecondApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
					 accountTransationItem.get().setSecondapproverName(currentUserModel.getMember());
					 if(null != accountTransationItem.get().getFirstApprovalTime() && null !=  accountTransationItem.get().getFirstapproverName()) {
						 FinanceModel financeItem = accountTransationItem.get().getFinanceType();
						 Double currentBalance = financeItem.getCurrentBalance();
						 currentBalance = currentBalance + accountTransationItem.get().getPaidAmount().doubleValue();
						 financeItem.setCurrentBalance(currentBalance);
						 financeRepository.save(financeItem);
					 }
				 }else {
					 accountTransationItem.get().setFirstApprovalTime(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
					 accountTransationItem.get().setFirstapproverName(currentUserModel.getMember());
					 if(null != accountTransationItem.get().getSecondApprovalTime() && null !=  accountTransationItem.get().getSecondapproverName()) {
						 FinanceModel financeItem = accountTransationItem.get().getFinanceType();
						 Double currentBalance = financeItem.getCurrentBalance();
						 currentBalance = currentBalance + accountTransationItem.get().getPaidAmount().doubleValue();
						 financeItem.setCurrentBalance(currentBalance);
						 financeRepository.save(financeItem);
					 }
				 }
				 accountTransactionsRepository.save(accountTransationItem.get());
				 return true;
			 }
		 }
		 return false;
	 }
	 
	 private boolean isBussinessExipredRule(LocalDate spendDate,String settingName) {
		 if(null != spendDate) {
			 LocalDateTime localDateTimeInIST = ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime();
			 LocalDate today = localDateTimeInIST.toLocalDate();
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


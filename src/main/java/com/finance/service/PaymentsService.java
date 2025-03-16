package com.finance.service;

import java.math.BigDecimal;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.AccountModel;
import com.finance.model.AccountTransactionsModel;
import com.finance.model.FinanceModel;
import com.finance.model.LoanEmiDetail;
import com.finance.model.LoanEmiDetail.CurrentStatus;
import com.finance.model.MemberModel;
import com.finance.repository.AccountRepository;
import com.finance.repository.AccountTransactionsRepository;
import com.finance.repository.LoanEmiDetailRepository;
import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 * 9 Mar 2025
 *
 */
@Service
public class PaymentsService {
	
	@Autowired
	private LoanService loanService;
	
	@Autowired
	private CreateFinanceService createFinanceService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private AccountTransactionsService accountTransactionsService;
	
	@Autowired
	private LoanEmiDetailRepository emiDetailRepository;
	
	@Autowired
    private AccountRepository accountRepository;
	
	@Autowired
	private AccountTransactionsRepository accountTransactionsRepository;
	
	public List<LoanEmiDetail> loadEMI(MemberDetails currentUser){
		List<LoanEmiDetail> allLoansForCurrentUser = loanService.findAllLoansForCurrentUser(currentUser);
		return allLoansForCurrentUser;
	}
	
	public List<FinanceModel> fetchAllUpcomingPrimaryPendingPayments(MemberModel currentUser, LocalDate upcomingSunday) {
		List<FinanceModel> activePrimaryFinance = createFinanceService.getActivePrimaryFinances();
		List<FinanceModel> pendingPaymentList = new ArrayList<FinanceModel>();
		for (FinanceModel financeModel : activePrimaryFinance) {
			List<AccountTransactionsModel> upcomingTransation = accountTransactionsService.getTransactions(financeModel, currentUser, upcomingSunday);
			if( null != upcomingTransation || upcomingTransation.size() ==0 ) {
				pendingPaymentList.add(financeModel);
			}
		}
	   return pendingPaymentList;
	}
	
	public void populatePaymentDetails(MemberDetails currentUser, Model model) {
		
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
        
		model.addAttribute(ChunksFinanceConstants.UPCOMING_PAYMENT_DATE, upcomingSunday);
		// Displaying upcoming Loan EMI
		List<LoanEmiDetail> emiDetails = loadEMI(currentUser);
		model.addAttribute(ChunksFinanceConstants.ALL_LOANS_EMI, emiDetails);
		
		// Displaying Current Account Holder to display the Payment.
		List<AccountModel> accountModel = accountService.getPrimaryActiveAccountsByHolder(currentUser.getMember());
		List<AccountTransactionsModel> primaryPendingPaymentList = new ArrayList<AccountTransactionsModel>();
		for (AccountModel accountModel2 : accountModel) {
			List<AccountTransactionsModel> listOfTransations = accountTransactionsService.getTransactionsForDisplay(accountModel2.getFinanceType(), currentUser.getMember(), upcomingSunday);
			boolean currentStstausFlag = false;
			if(null != listOfTransations && listOfTransations.size() >=0) {
				
				AccountTransactionsModel pendingItem = new AccountTransactionsModel();
				pendingItem.setId(accountModel2.getId());
				pendingItem.setAccountHolderName(currentUser.getMember());
				pendingItem.setFinanceType(accountModel2.getFinanceType());
				pendingItem.setTotalAmount(BigDecimal.valueOf(accountModel2.getFinanceType().getFinanceAmount()));
				if(listOfTransations.size() >= 1) {
					pendingItem.setPaidAmount(listOfTransations.get(0).getPaidAmount());
					if (BigDecimal.valueOf(accountModel2.getFinanceType().getFinanceAmount()).compareTo(listOfTransations.get(0).getPaidAmount()) == 0) {
						currentStstausFlag = true;
					}else {
						currentStstausFlag = false;
					}
				}else {
					pendingItem.setPaidAmount(BigDecimal.ZERO);	
				}
				if(!currentStstausFlag) {
					primaryPendingPaymentList.add(pendingItem);
				}
			}
		}
		model.addAttribute(ChunksFinanceConstants.PENDING_PRIMARY_PAYMENT, primaryPendingPaymentList);
		
		
		List<AccountTransactionsModel> secondaryPendingPaymentList = new ArrayList<AccountTransactionsModel>();
		
		List<AccountModel> secondaryAcountModelForPrimaryUser =accountService.getSecondaryActiveAccountsByHolder(currentUser.getMember());
		for (AccountModel secondaryModelItemForPrimaryUser : secondaryAcountModelForPrimaryUser) {
			List<AccountTransactionsModel> listOfTransations = accountTransactionsService.getTransactions(secondaryModelItemForPrimaryUser.getFinanceType(), currentUser.getMember(), upcomingSunday);
			if(null != listOfTransations && listOfTransations.size() >=0) {
				AccountTransactionsModel pendingItem = new AccountTransactionsModel();
				pendingItem.setId(secondaryModelItemForPrimaryUser.getId());
				pendingItem.setAccountHolderName(secondaryModelItemForPrimaryUser.getAccountHolderName());
				pendingItem.setFinanceType(secondaryModelItemForPrimaryUser.getFinanceType());
				pendingItem.setTotalAmount(BigDecimal.valueOf(secondaryModelItemForPrimaryUser.getFinanceType().getFinanceAmount()));
				secondaryPendingPaymentList.add(pendingItem);
			}
		}
		
		List<MemberModel> listOfSecondaryMembers = memberService.getSecondaryMembers(currentUser.getMember());
		for (MemberModel secMemberItem : listOfSecondaryMembers) {
			List<AccountModel> secondaryAcountModel = accountService.getSecondaryActiveAccountsByHolder(secMemberItem);
			for (AccountModel secondaryModelItem : secondaryAcountModel) {
				List<AccountTransactionsModel> listOfTransations = accountTransactionsService.getTransactions(secondaryModelItem.getFinanceType(), secMemberItem, upcomingSunday);
				if(null != listOfTransations && listOfTransations.size() >=0) {
					AccountTransactionsModel pendingItem = new AccountTransactionsModel();
					pendingItem.setId(secondaryModelItem.getId());
					pendingItem.setAccountHolderName(secMemberItem);
					pendingItem.setFinanceType(secondaryModelItem.getFinanceType());
					pendingItem.setTotalAmount(BigDecimal.valueOf(secondaryModelItem.getFinanceType().getFinanceAmount()));
					secondaryPendingPaymentList.add(pendingItem);
				}
			}
		}
		
		model.addAttribute(ChunksFinanceConstants.PENDING_SECONDAY_PAYMENT, secondaryPendingPaymentList);
	}	
	
	
	public List<FinanceModel> fetchAllUpcomingSecondayPendingPayments(MemberModel currentUser, LocalDate upcomingSunday) {
		List<FinanceModel> activeSecondaryFinance = createFinanceService.getActiveSecondaryFinances();
		List<FinanceModel> pendingPaymentList = new ArrayList<FinanceModel>();
		for (FinanceModel financeModel : activeSecondaryFinance) {
			List<AccountTransactionsModel> upcomingTransation = accountTransactionsService.getTransactions(financeModel, currentUser, upcomingSunday);
			if( null != upcomingTransation || upcomingTransation.size() ==0 ) {
				pendingPaymentList.add(financeModel);
			}
		}
	   return pendingPaymentList;
	}
	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public void processEMI(List<Double> loanEmiValues, List<Integer> loanEmiNames) {
		Map<Integer,Double> loanEmIPaid = new HashMap<Integer,Double>();
		if (loanEmiValues.size() == loanEmiNames.size()) {
			for (int i = 0; i < loanEmiValues.size(); i++) {
		        loanEmIPaid.put(loanEmiNames.get(i) ,loanEmiValues.get(i));
		    }
		}
		// Processing the EMI 
		loanEmIPaid.forEach((key, value) -> {
			if(value > 0) {
				Optional<LoanEmiDetail> emiItem = emiDetailRepository.findById(key);
				if(emiItem.isPresent()) {
					if(emiItem.get().getEmiAmount().doubleValue() >= value) {
						// Changing status to PAYMENT_SUBMITTED and updating paid amount to EMI reporistoy
						if(emiItem.get().getPaidAmount().intValue() > 0) {
							double currentPaidAmount  = emiItem.get().getPaidAmount().doubleValue();
							double totalPaid = value+ currentPaidAmount;
							if(totalPaid <= emiItem.get().getEmiAmount().doubleValue()) {
								emiItem.get().setPaidAmount(BigDecimal.valueOf(totalPaid));
								if(totalPaid == emiItem.get().getEmiAmount().doubleValue()) {
									emiItem.get().setCurrentStatus(CurrentStatus.PAYMENT_SUBMITTED);
								}
								
							}else {
								// Send the error message to FE.
							}
						}else {
							if(emiItem.get().getEmiAmount().doubleValue() != value) {
								emiItem.get().setPaidAmount(BigDecimal.valueOf(value));
								emiItem.get().setCurrentStatus(CurrentStatus.PAYMENT_INITIATED);
							}else {
								emiItem.get().setPaidAmount(BigDecimal.valueOf(value));
								emiItem.get().setCurrentStatus(CurrentStatus.PAYMENT_SUBMITTED);
							}
							
						}
						
					}else {
						// Throwing exception because you can't pay more than current EMI amt.
					}
					if(emiItem.get().getCurrentStatus()!= CurrentStatus.PAYMENT_SUBMITTED) {
						emiItem.get().setCurrentStatus(CurrentStatus.PAYMENT_INITIATED);
					}
					emiDetailRepository.save(emiItem.get());
				}
			}
		});
		
		
		
	}
	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public void processPrimaryFund(List<Double> primaryPaymentValues, List<Integer> primaryPaymentNames,MemberDetails currentUserModel) {
		Map<Integer,Double> primaryFundPaid = new HashMap<Integer,Double>();
		if (primaryPaymentValues.size() == primaryPaymentNames.size()) {
			for (int i = 0; i < primaryPaymentValues.size(); i++) {
				primaryFundPaid.put(primaryPaymentNames.get(i) ,primaryPaymentValues.get(i));
		    }
		}
	    Integer maxTransactionId = accountTransactionsRepository.findMaxTransactionId();
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
	    for (Map.Entry<Integer, Double> entry : primaryFundPaid.entrySet()) {
	    	if(entry.getValue() > 0 ) {
	    		Optional<AccountModel> accountItem = accountRepository.findById(entry.getKey());
		    	 List<AccountTransactionsModel> accountTransationItem = accountTransactionsRepository.findTransactions(accountItem.get().getFinanceType(),currentUserModel.getMember(),upcomingSunday);
		    	 AccountTransactionsModel accountTransactionsModel = null;
		    	 if(null != accountTransationItem && accountTransationItem.size() ==0) {
		    		 accountTransactionsModel = new AccountTransactionsModel();
		    		 accountTransactionsModel.setId(++maxTransactionId);
		    		 accountTransactionsModel.setPaidAmount(BigDecimal.valueOf(entry.getValue()));
		    	 }else {
		    		 accountTransactionsModel = accountTransationItem.get(0);
		    		 BigDecimal currentPaidAmt = accountTransationItem.get(0).getPaidAmount();
		    		 currentPaidAmt = currentPaidAmt.add(BigDecimal.valueOf(entry.getValue()));
		    		 accountTransactionsModel.setPaidAmount(currentPaidAmt);
		    	 }
		        
		        accountTransactionsModel.setPaymentDate(upcomingSunday);
		        if(null != accountItem && accountItem.isPresent()) {
		        	 accountTransactionsModel.setFinanceType(accountItem.get().getFinanceType());
		        	 accountTransactionsModel.setTotalAmount(BigDecimal.valueOf(accountItem.get().getFinanceType().getFinanceAmount()));
		        }
		        accountTransactionsModel.setAccountHolderName(currentUserModel.getMember());
		        accountTransactionsRepository.save(accountTransactionsModel);
	    	}
	    	 
	    }
	}
	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public void processSecondaryFund(List<Double> secondaryPaymentValues, List<Integer> secondaryPaymentNames,MemberDetails currentUserModel) {
		Map<Integer,Double> secondaryFundPaid = new HashMap<Integer,Double>();
		if (secondaryPaymentValues.size() == secondaryPaymentNames.size()) {
			for (int i = 0; i < secondaryPaymentValues.size(); i++) {
				secondaryFundPaid.put(secondaryPaymentNames.get(i) ,secondaryPaymentValues.get(i));
		    }
		}
		 Integer maxTransactionId = accountTransactionsRepository.findMaxTransactionId();
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
		 for (Map.Entry<Integer, Double> entry : secondaryFundPaid.entrySet()) {
			 if(entry.getValue() > 0) {
				 Optional<AccountModel> accountItem = accountRepository.findById(entry.getKey());
				 if(null != accountItem && accountItem.isPresent()) {
				   	 List<AccountTransactionsModel> accountTransationItem = accountTransactionsRepository.findTransactions(accountItem.get().getFinanceType(),accountItem.get().getAccountHolderName(),upcomingSunday);
			    	 AccountTransactionsModel accountTransactionsModel = null;
			    	 if(null != accountTransationItem && accountTransationItem.size() ==0) {
			    		 accountTransactionsModel = new AccountTransactionsModel();
			    		 accountTransactionsModel.setId(++maxTransactionId);
			    		 accountTransactionsModel.setPaidAmount(BigDecimal.valueOf(entry.getValue()));
			    	 }else {
			    		 accountTransactionsModel = accountTransationItem.get(0);
			    		 BigDecimal currentPaidAmt = accountTransationItem.get(0).getPaidAmount();
			    		 currentPaidAmt = currentPaidAmt.add(BigDecimal.valueOf(entry.getValue()));
			    		 accountTransactionsModel.setPaidAmount(currentPaidAmt);
			    	 }
			    	 accountTransactionsModel.setPaymentDate(upcomingSunday);
				        if(null != accountItem && accountItem.isPresent()) {
				        	 accountTransactionsModel.setFinanceType(accountItem.get().getFinanceType());
				        }
			        accountTransactionsModel.setAccountHolderName(accountItem.get().getAccountHolderName());
			        accountTransactionsRepository.save(accountTransactionsModel); 
				 }
			 }

		 }
	}
	
}

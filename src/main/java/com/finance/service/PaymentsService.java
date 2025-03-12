package com.finance.service;

import java.math.BigDecimal;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.AccountModel;
import com.finance.model.AccountTransactionsModel;
import com.finance.model.FinanceModel;
import com.finance.model.LoanEmiDetail;
import com.finance.model.MemberModel;
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
	
	public List<LoanEmiDetail> loadEMI(MemberDetails currenUser){
		List<LoanEmiDetail> allLoansForCurrentUser = loanService.findAllLoansForCurrentUser(currenUser);
		return allLoansForCurrentUser;
	}
	
	public List<FinanceModel> fetchAllUpcomingPrimaryPendingPayments(MemberModel currenUser, LocalDate upcomingSunday) {
		List<FinanceModel> activePrimaryFinance = createFinanceService.getActivePrimaryFinances();
		List<FinanceModel> pendingPaymentList = new ArrayList<FinanceModel>();
		for (FinanceModel financeModel : activePrimaryFinance) {
			List<AccountTransactionsModel> upcomingTransation = accountTransactionsService.getTransactions(financeModel, currenUser, upcomingSunday);
			if( null != upcomingTransation || upcomingTransation.size() ==0 ) {
				pendingPaymentList.add(financeModel);
			}
		}
	   return pendingPaymentList;
	}
	
	public void populatePaymentDetails(MemberDetails currenUser, Model model) {
		
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
		List<LoanEmiDetail> emiDetails = loadEMI(currenUser);
		model.addAttribute(ChunksFinanceConstants.ALL_LOANS_EMI, emiDetails);
		
		// Displaying Current Account Holder to display the Payment.
		List<AccountModel> accountModel = accountService.getActiveAccountsByHolder(currenUser.getMember());
		List<AccountTransactionsModel> primaryPendingPaymentList = new ArrayList<AccountTransactionsModel>();
		int pCount = 1;
		for (AccountModel accountModel2 : accountModel) {
			List<AccountTransactionsModel> listOfTransations = accountTransactionsService.getTransactions(accountModel2.getFinanceType(), currenUser.getMember(), upcomingSunday);
			if(null != listOfTransations && listOfTransations.size() ==0) {
				AccountTransactionsModel pendingItem = new AccountTransactionsModel();
				pendingItem.setId(pCount++);
				pendingItem.setAccountHolderName(currenUser.getMember());
				pendingItem.setFinanceType(accountModel2.getFinanceType());
				pendingItem.setTotalAmount(BigDecimal.valueOf(accountModel2.getFinanceType().getFinanceAmount()));
				primaryPendingPaymentList.add(pendingItem);
			}
		}
		model.addAttribute(ChunksFinanceConstants.PENDING_PAYMENT, primaryPendingPaymentList);
		
		
		List<AccountTransactionsModel> secondaryPendingPaymentList = new ArrayList<AccountTransactionsModel>();
		List<MemberModel> listOfSecondaryMembers = memberService.getSecondaryMembers(currenUser.getMember());
		for (MemberModel secMemberItem : listOfSecondaryMembers) {
			List<AccountModel> secondaryAcountModel = accountService.getActiveAccountsByHolder(secMemberItem);
			for (AccountModel secondaryModelItem : secondaryAcountModel) {
				List<AccountTransactionsModel> listOfTransations = accountTransactionsService.getTransactions(secondaryModelItem.getFinanceType(), secMemberItem, upcomingSunday);
				if(null != listOfTransations && listOfTransations.size() ==0) {
					AccountTransactionsModel pendingItem = new AccountTransactionsModel();
					pendingItem.setId(pCount++);
					pendingItem.setAccountHolderName(secMemberItem);
					pendingItem.setFinanceType(secondaryModelItem.getFinanceType());
					pendingItem.setTotalAmount(BigDecimal.valueOf(secondaryModelItem.getFinanceType().getFinanceAmount()));
					secondaryPendingPaymentList.add(pendingItem);
				}
			}
		}
		
		model.addAttribute(ChunksFinanceConstants.PENDING_SECONDAY_PAYMENT, secondaryPendingPaymentList);
		
		
		
		
		/*
		 * // Display the weekly Collection for all primary finance List<FinanceModel>
		 * pendingPaymentList =
		 * fetchAllUpcomingPrimaryPendingPayments(currenUser.getMember(),upcomingSunday)
		 * ; model.addAttribute(ChunksFinanceConstants.PENDING_PAYMENT,
		 * pendingPaymentList); // Now Fetch all Secondary Funds. List<MemberModel>
		 * listOfDepositUsers =
		 * memberService.getMembersByReferenceAndUserType(currenUser.getMember()); for
		 * (MemberModel memberModel : listOfDepositUsers) { List<FinanceModel>
		 * finModelPending =
		 * fetchAllUpcomingSecondayPendingPayments(memberModel,upcomingSunday); }
		 */
		
		
		
		
		
		
	}	
	
	
	public List<FinanceModel> fetchAllUpcomingSecondayPendingPayments(MemberModel currenUser, LocalDate upcomingSunday) {
		List<FinanceModel> activeSecondaryFinance = createFinanceService.getActiveSecondaryFinances();
		List<FinanceModel> pendingPaymentList = new ArrayList<FinanceModel>();
		for (FinanceModel financeModel : activeSecondaryFinance) {
			List<AccountTransactionsModel> upcomingTransation = accountTransactionsService.getTransactions(financeModel, currenUser, upcomingSunday);
			if( null != upcomingTransation || upcomingTransation.size() ==0 ) {
				pendingPaymentList.add(financeModel);
			}
		}
	   return pendingPaymentList;
	}
	
}

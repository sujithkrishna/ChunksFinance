package com.finance.service;

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

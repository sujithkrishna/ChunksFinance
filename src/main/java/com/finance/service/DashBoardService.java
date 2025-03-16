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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.FinanceModel;
import com.finance.model.LoanEnquiresModel;
import com.finance.model.MemberModel;
import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Service
public class DashBoardService {
	
	@Autowired
	private CreateFinanceService financeService;
	
	@Autowired
	private LoanEnquiresService loanEnquiresService;

	public void populateDashboardData(MemberDetails currentUserModel, Model model) {
		List<FinanceModel> financeModel = financeService.getAllFinanceRecords();
		if (currentUserModel != null) {
	            MemberModel currentUser = currentUserModel.getMember();
	            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
	    }
		if(financeModel.size()==0) {
			financeModel = null;
		}
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
		List<LoanEnquiresModel> loanEnquiresModel = loanEnquiresService.getLoanEnquiresForDashboard();
		// Calculate this should go to CHunks or Onam Fund.
		
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
		
		
		
		Map<String, List<LoanEnquiresModel>> loanFinalMap = new HashMap<>();

		List<FinanceModel> financeOrderbyPrio = financeService.getAllSortedByLoanPriorityNum();
		List<LoanEnquiresModel> remainingLoanEnquiries = new ArrayList<>(loanEnquiresModel); // Copy the list to modify it

		// Iterate through finance models
		for (FinanceModel financeItem : financeOrderbyPrio) {
		    String financeName = financeItem.getFinanceName();
		    Double remainingFinanceBalance = financeItem.getCurrentBalance(); // Start with available balance
		    
		    List<LoanEnquiresModel> processedLoans = new ArrayList<>();
		    List<LoanEnquiresModel> stillUnprocessedLoans = new ArrayList<>();

		    // Iterate through all remaining loan inquiries
		    for (LoanEnquiresModel loanEnquiry : remainingLoanEnquiries) {
		        BigDecimal loanAmount = loanEnquiry.getLoanAmount();

		        if (remainingFinanceBalance >= loanAmount.doubleValue()) {
		            remainingFinanceBalance -= loanAmount.doubleValue();
		            loanEnquiry.setStatus(true); // Mark loan as successfully processed
		            processedLoans.add(loanEnquiry);
		        } else {
		            // Don't mark it as unprocessed yet, try with the next finance model
		            stillUnprocessedLoans.add(loanEnquiry);
		        }

		        if (remainingFinanceBalance <= 0) {
		            break; // Stop processing loans for this finance item
		        }
		    }

		    // Store the successfully processed loans for this finance model
		    loanFinalMap.put(financeName, processedLoans);

		    // Update the list of loan inquiries that are still pending for the next finance model
		    remainingLoanEnquiries = new ArrayList<>(stillUnprocessedLoans);
		    // If all loans are processed, break early
		    if (remainingLoanEnquiries.isEmpty()) {
		        break;
		    }
		}

		// Store loanFinalMap data into the model
        for (Map.Entry<String, List<LoanEnquiresModel>> entry : loanFinalMap.entrySet()) {
        	String key = entry.getKey();
            List<LoanEnquiresModel> value = entry.getValue();
            model.addAttribute(key, value);
        }
		
		
		
	}
   
}

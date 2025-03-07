package com.finance.service;

import java.math.BigDecimal;
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

	public void populateDashboardData(MemberDetails currenUser, Model model) {
		List<FinanceModel> financeModel = financeService.getAllFinanceRecords();
		if (currenUser != null) {
	            MemberModel currentUser = currenUser.getMember();
	            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
	    }
		if(financeModel.size()==0) {
			financeModel = null;
		}
		List<LoanEnquiresModel> loanEnquiresModel = loanEnquiresService.getLoanEnquiresForDashboard();
		// Calculate this should go to CHunks or Onam Fund.
		
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
		    System.out.println("----------------------stillUnprocessedLoans----------------------------"+stillUnprocessedLoans);	
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
            System.out.println("Finance: " + key + ", Processed Loans: " + value);
        }
		
		
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
	}
   
}

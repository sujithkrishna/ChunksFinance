package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.FinanceModel;
import com.finance.model.LoanModel;
import com.finance.model.MemberModel;
import com.finance.service.CreateFinanceService;
import com.finance.service.LoanService;
import com.finance.service.MemberService;
import com.finance.user.MemberDetails;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class ReportsController {

	@Autowired
	private LoanService loanService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CreateFinanceService financeService;
	
	@GetMapping(path = {"/reports"})
	public String handleReports(@AuthenticationPrincipal MemberDetails currentUserModel, Model model) {
		if (currentUserModel != null) {
            MemberModel currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
            List<FinanceModel> activeFinancesWithOwner = financeService.getActiveFinancesWithOwner(currentUser);
            if(null != activeFinancesWithOwner && activeFinancesWithOwner.size() >=1) {
            	model.addAttribute(ChunksFinanceConstants.FINANCE_OWNER, Boolean.TRUE);
            }
            
		}
		
		List<LoanModel> allLoans = loanService.getAllLoanRecords();
		model.addAttribute(ChunksFinanceConstants.ALL_LOANS, allLoans);
		
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute(ChunksFinanceConstants.PRIMARY_MEMBERS,primaryMembers);
		
		
		return "reports";
	}
}

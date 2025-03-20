package com.finance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.service.LoanPreclosureService;
import com.finance.user.MemberDetails;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 * 19 Mar 2025
 *
 */
@Controller
public class LoanPreclosureController {
	private static final String ACCOUNT_HOLDER_NAME = "AccountHolderName";
	@Autowired
	private LoanPreclosureService loanPreclosureService;

	@GetMapping(path = {"/loan-preclosure"})
	public String handlePreclosure(@AuthenticationPrincipal MemberDetails currentUserModel, Model model) {
		loanPreclosureService.populatePreClosureData(currentUserModel, model);
		model.addAttribute(ChunksFinanceConstants.LOAN_LOAN, Boolean.FALSE);
		return "loanPreclosure";
	}
	
	
	@PostMapping(path = {"/loan-preclosure"})
	public String handlePreclosureloadLoan(@AuthenticationPrincipal MemberDetails currentUserModel,HttpServletRequest request, Model model) {
		
		String loanPersonNo = request.getParameter(ACCOUNT_HOLDER_NAME);
		if(null != loanPersonNo) {
			loanPreclosureService.populateLoanData(loanPersonNo,model);
		}
		loanPreclosureService.populatePreClosureData(currentUserModel, model);
		model.addAttribute(ChunksFinanceConstants.LOAN_LOAN, Boolean.TRUE);
		return "loanPreclosure";
	}
}

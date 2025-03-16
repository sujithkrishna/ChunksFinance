package com.finance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.LoanEnquiresModel;
import com.finance.service.LoanEnquiresService;
import com.finance.user.MemberDetails;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 * 7 Mar 2025
 *
 */
@Controller
public class LoanEnquiresController {

	@Autowired
	private LoanEnquiresService loanEnquiresService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	@GetMapping(path = {"/loan-enquires"})
	public String handleLoanEnquires(@AuthenticationPrincipal MemberDetails currentUserModel, Model model) {
		loanEnquiresService.populateLoanEnquiresPageDetails(currentUserModel, model);
		return "loan-enquires";
	}
	
	
	@PostMapping(path = {"/loan-enquires"})
	public String handleCreateLoanEnquires(@AuthenticationPrincipal MemberDetails currentUserModel,HttpServletRequest request, @ModelAttribute LoanEnquiresModel loanEnquiresModel, Model model) {
		boolean status = loanEnquiresService.createLoanEnquires(currentUserModel,request, loanEnquiresModel);
		if(status) {
			loanEnquiresService.populateLoanEnquiresPageDetails(currentUserModel, model);
			model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.LOAN_ENQUIRES_CREATE_MESSAGE,currentUserModel.getMember().getMemberName()));
		}
		
		return "loan-enquires";
	}
}

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
import com.finance.exception.DuplicateLoanException;
import com.finance.model.LoanModel;
import com.finance.service.LoanService;
import com.finance.user.MemberDetails;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class LoanController {
	
	@Autowired
	private LoanService loanService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	@GetMapping(path = {"/loan"})
	public String handleLoan(@AuthenticationPrincipal MemberDetails currentUserModel, Model model) {
		loanService.populateLoanPageDetails(currentUserModel, model);
		return "loan";
	}
	
	@PostMapping(path = {"/loan"})
	public String handleCreateLoan(@AuthenticationPrincipal MemberDetails currentUserModel,@ModelAttribute LoanModel loanModel, Model model) {
		try {
			boolean status = loanService.createLoan(loanModel);
				if(status) {
					 model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.LOAN_CREATE_MESSAGE,currentUserModel.getMember().getMemberName()));
				}
				loanService.populateLoanPageDetails(currentUserModel, model);
		}catch(DuplicateLoanException exception) {
			model.addAttribute(ChunksFinanceConstants.ERROR,propertyService.getProperty(ChunksFinanceConstants.DUPLICATE_LOAN_MESSAGE));
			loanService.populateLoanPageDetails(currentUserModel, model);
		}
		return "loan";
	}
	
	
}

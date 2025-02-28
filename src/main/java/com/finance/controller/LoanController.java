package com.finance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	@GetMapping(path = {"/loan"})
	public String handleLoan(@AuthenticationPrincipal MemberDetails currenUser, Model model) {
		loanService.populateLoanPageDetails(currenUser, model);
		return "loan";
	}
	
	@PostMapping(path = {"/loan"})
	public String handleCreateLoan(@AuthenticationPrincipal MemberDetails currenUser,@ModelAttribute LoanModel loanModel, Model model) {
		loanService.createLoan(loanModel);
		loanService.populateLoanPageDetails(currenUser, model);
		return "loan";
	}
	
	
}

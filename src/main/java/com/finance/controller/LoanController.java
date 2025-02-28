package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.LoanModel;
import com.finance.model.MemberModel;
import com.finance.model.RevenueModel;
import com.finance.service.LoanService;
import com.finance.service.MemberService;
import com.finance.user.MemberDetails;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class LoanController {


	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LoanService loanService;
	
	@GetMapping(path = {"/loan"})
	public String handleLoan(@AuthenticationPrincipal MemberDetails currenUser, Model model) {
		if (currenUser != null) {
            MemberModel currentUser = currenUser.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute("primaryMembers",primaryMembers);
		
		List<MemberModel> secondaryMembers = memberService.getAllSecondaryMemeber();
		model.addAttribute("secondaryMembers",secondaryMembers);
		
		Integer currentLonNumber = loanService.getMaxLoanNumber();
		if(null == currentLonNumber) {
			model.addAttribute("loanNumber",ChunksFinanceConstants.NUMBER_ONE);
		}else {
			++currentLonNumber;
			model.addAttribute("loanNumber",currentLonNumber);
		}
		return "loan";
	}
	
	@PostMapping(path = {"/loan"})
	public String handleCreateLoan(@AuthenticationPrincipal MemberDetails currenUser,@ModelAttribute LoanModel loanModel, Model model) {
		
		loanService.createLoan(loanModel);
		if (currenUser != null) {
            MemberModel currentUser = currenUser.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute("primaryMembers",primaryMembers);
		
		List<MemberModel> secondaryMembers = memberService.getAllSecondaryMemeber();
		model.addAttribute("secondaryMembers",secondaryMembers);
		
		Integer currentLonNumber = loanService.getMaxLoanNumber();
		if(null == currentLonNumber) {
			model.addAttribute("loanNumber",ChunksFinanceConstants.NUMBER_ONE);
		}else {
			++currentLonNumber;
			model.addAttribute("loanNumber",currentLonNumber);
		}
		return "loan";
	}
	
	
}

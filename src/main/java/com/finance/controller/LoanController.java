package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.MemberModel;
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
	
	@GetMapping(path = {"/loan"})
	public String handleLoan(@AuthenticationPrincipal MemberDetails memberDetails, Model model) {
		if (memberDetails != null) {
            MemberModel currentUser = memberDetails.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute("primaryMembers",primaryMembers);
		
		List<String> secondaryMembers = memberService.getAllSecondaryMemeber();
		model.addAttribute("secondaryMembers",secondaryMembers);
		
		return "loan";
	}
}

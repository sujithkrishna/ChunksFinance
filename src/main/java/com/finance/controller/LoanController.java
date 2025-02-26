package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.CurrentUser;
import com.finance.model.MemberModel;
import com.finance.service.MemberService;

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
	private CurrentUser currentUser;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping(path = {"/loan"})
	public String handleLoan(HttpServletRequest request, HttpServletResponse response, Model model) {
		if(null != currentUser  && !currentUser.isLoggedIn()) {
			currentUser.setMemberName(ChunksFinanceConstants.SILENT_WATCHER);
		}
		model.addAttribute("currentUser", currentUser);
		
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute("primaryMembers",primaryMembers);
		
		List<String> secondaryMembers = memberService.getAllSecondaryMemeber();
		model.addAttribute("secondaryMembers",secondaryMembers);
		
		return "loan";
	}
}

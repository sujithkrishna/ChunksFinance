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
import com.finance.model.MemberModel;
import com.finance.model.RevenueModel;
import com.finance.service.RevenueService;
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
public class RevenueController {
	
	@Autowired
	private RevenueService revenueService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	@GetMapping(path = {"/revenue"})
	public String handleRevenue(@AuthenticationPrincipal MemberDetails currenUser, Model model) {
		if (currenUser != null) {
            MemberModel currentUser = currenUser.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}		
		revenueService.populatingFields(model);
		return "revenue";
	}

	
	
	@PostMapping(path = {"/revenue"})
	public String handleCreatRevenue(@AuthenticationPrincipal MemberDetails currentUser,@ModelAttribute RevenueModel revenueModel,Model model) {
		boolean status = revenueService.creatRevenue(currentUser,revenueModel);
		if(status) {
			revenueService.populatingFields(model);
			model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.FINANCE_CREATE_REVENUE_MESSAGE,currentUser.getMember().getMemberName()));
	        return "revenue";
		}
		
		
		return "revenue";
	}
	
	
}

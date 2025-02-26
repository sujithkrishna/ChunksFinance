package com.finance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.CurrentUser;
import com.finance.model.RevenueModel;
import com.finance.service.RevenueService;

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
	private CurrentUser currentUser;
	

	@Autowired
	private RevenueService revenueService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	@GetMapping(path = {"/revenue"})
	public String handleRevenue(HttpServletRequest request, HttpServletResponse response, Model model) {
		if(null != currentUser  && !currentUser.isLoggedIn()) {
			currentUser.setMemberName(ChunksFinanceConstants.SILENT_WATCHER);
		}
		model = revenueService.populatingFields(model);
		return "revenue";
	}

	
	
	@PostMapping(path = {"/revenue"})
	public String handleCreatRevenue(@ModelAttribute RevenueModel revenueModel,Model model) {
		boolean status = revenueService.creatRevenue(revenueModel);
		String memberName = null;
		if(null != currentUser  && !currentUser.isLoggedIn()) {
			memberName = ChunksFinanceConstants.SILENT_WATCHER;
		}else {
			memberName = currentUser.getMemberName();
		}
		if(status) {
			model = revenueService.populatingFields(model);
			model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.FINANCE_CREATE_REVENUE_MESSAGE,memberName));
	        return "revenue";
		}
		
		
		return "revenue";
	}
	
	
}

package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.RevenueAlreadyApprovedException;
import com.finance.model.CurrentUser;
import com.finance.model.RevenueModel;
import com.finance.service.ApprovalsService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class ApprovalsController {

	@Autowired
	private CurrentUser currentUser;
	
	@Autowired
	private ApprovalsService approvalsService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	
	@GetMapping(path = {"/approvals"})
	public String handleApprovals(HttpServletRequest request, HttpServletResponse response, Model model) {
		if(null != currentUser  && !currentUser.isLoggedIn()) {
			currentUser.setMemberName(ChunksFinanceConstants.SILENT_WATCHER);
		}
		model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		List<RevenueModel> nonApprovedRevenueList = approvalsService.getAllNonApprovedRevenueForMyApproval();
		if(null != nonApprovedRevenueList && nonApprovedRevenueList.size() == 0) {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_REVENUE_LIST, null);
		}else {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_REVENUE_LIST, nonApprovedRevenueList);
		}
		return "approvals";
	}
	
	@PostMapping(path = {"/create-approval"})
	public String handleCreateApproval(Model model, HttpServletRequest request,HttpServletResponse response) {
		try {
		boolean status = approvalsService.processApprovels(request,response);
			if(status) {
				List<RevenueModel> nonApprovedRevenueList = approvalsService.getAllNonApprovedRevenueForMyApproval();
				model.addAttribute(ChunksFinanceConstants.NON_APPROVED_REVENUE_LIST, nonApprovedRevenueList);
				model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getProperty(ChunksFinanceConstants.FINANCE_APPOVED_MESSAGE));
			}
		}catch(RevenueAlreadyApprovedException exception) {
			model.addAttribute(ChunksFinanceConstants.ERROR,propertyService.getProperty(ChunksFinanceConstants.FINANCE_ALREADY_APPOVED_MESSAGE));
			return "approvals";
		}
		return "approvals";
	}
	
}

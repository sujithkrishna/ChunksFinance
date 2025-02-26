package com.finance.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.AlreadyApprovedException;
import com.finance.exception.DateExpiredException;
import com.finance.model.CurrentUser;
import com.finance.model.ExpensesModel;
import com.finance.model.RevenueModel;
import com.finance.service.ApprovalsService;
import com.finance.service.ExpensesService;
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
public class ApprovalsController {
	/*

	@Autowired
	private CurrentUser currentUser;
	
	@Autowired
	private ApprovalsService approvalsService;
	
	@Autowired
	private RevenueService revenueService;
	
	@Autowired
	private ExpensesService expensesService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	
	@GetMapping(path = {"/approvals"})
	public String handleApprovals(HttpServletRequest request, HttpServletResponse response, Model model) {
		if(null != currentUser  && !currentUser.isLoggedIn()) {
			currentUser.setMemberName(ChunksFinanceConstants.SILENT_WATCHER);
		}
		model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		
		//Fetching Revenue List
		LocalDate givenDate = LocalDate.now();
		List<RevenueModel> nonApprovedRevenueList = revenueService.getRevenueFromMondayToGivenDate(givenDate);
		if(null != nonApprovedRevenueList && nonApprovedRevenueList.size() == 0) {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_REVENUE_LIST, null);
		}else {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_REVENUE_LIST, nonApprovedRevenueList);
		}
		
		//Fetching Expenses List		
		List<ExpensesModel> nonApprovedExpensesList = expensesService.getExpensesFromMondayToGivenDate(givenDate);
		if(null != nonApprovedExpensesList && nonApprovedExpensesList.size() == 0) {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_EXPENSES_LIST, null);
		}else {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_EXPENSES_LIST, nonApprovedExpensesList);
		}
		model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, givenDate);
		return "approvals";
	}
	
	
	@PostMapping(path = {"/view-approval"})
	public String handleViewApprovals(HttpServletRequest request, HttpServletResponse response, Model model) {
		LocalDate selectedDate = request.getParameter(ChunksFinanceConstants.APPROVAL_DATE) != null ? LocalDate.parse(request.getParameter(ChunksFinanceConstants.APPROVAL_DATE), DateTimeFormatter.ISO_LOCAL_DATE) : null;

        System.out.println("LocalDate: " + selectedDate);
		
        revewnueAndExpensesList(model, selectedDate);
		
		model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
		return "approvals";
	}
	
	
	
	
	@PostMapping(path = {"/create-approval"})
	public String handleCreateApproval(Model model, HttpServletRequest request,HttpServletResponse response) {
		LocalDate selectedDate = null;
		try {
			selectedDate = request.getParameter(ChunksFinanceConstants.APPROVAL_DATE) != null ? LocalDate.parse(request.getParameter(ChunksFinanceConstants.APPROVAL_DATE), DateTimeFormatter.ISO_LOCAL_DATE) : null;
			boolean status = approvalsService.processApprovels(request,response);
			if(status) {
				model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getProperty(ChunksFinanceConstants.FINANCE_APPOVED_MESSAGE));
				revewnueAndExpensesList(model, selectedDate);
			}
		}catch(DateExpiredException exception) {
			model.addAttribute(ChunksFinanceConstants.ERROR,propertyService.getProperty(ChunksFinanceConstants.FINANCE_DATEEXPIRED_MESSAGE));
			model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
			revewnueAndExpensesList(model, selectedDate);
			return "approvals";
		}catch(AlreadyApprovedException exception) {
			model.addAttribute(ChunksFinanceConstants.ERROR,propertyService.getProperty(ChunksFinanceConstants.FINANCE_ALREADY_APPOVED_MESSAGE));
			model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
			revewnueAndExpensesList(model, selectedDate);
			return "approvals";
		}
		model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
		return "approvals";
	}


	private void revewnueAndExpensesList(Model model, LocalDate selectedDate) {
		if(null != currentUser  && !currentUser.isLoggedIn()) {
			currentUser.setMemberName(ChunksFinanceConstants.SILENT_WATCHER);
		}
		model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		List<RevenueModel> nonApprovedRevenueList = revenueService.getRevenueFromMondayToGivenDate(selectedDate);
		if(null != nonApprovedRevenueList && nonApprovedRevenueList.size() == 0) {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_REVENUE_LIST, null);
		}else {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_REVENUE_LIST, nonApprovedRevenueList);
		}
		
		List<ExpensesModel> nonApprovedExpensesList = expensesService.getExpensesFromMondayToGivenDate(selectedDate);
		if(null != nonApprovedExpensesList && nonApprovedExpensesList.size() == 0) {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_EXPENSES_LIST, null);
		}else {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_EXPENSES_LIST, nonApprovedExpensesList);
		}
	}
	*/
}

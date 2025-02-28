package com.finance.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.AlreadyApprovedException;
import com.finance.exception.DateExpiredException;
import com.finance.model.ExpensesModel;
import com.finance.model.MemberModel;
import com.finance.model.RevenueModel;
import com.finance.service.ApprovalsService;
import com.finance.service.ExpensesService;
import com.finance.service.RevenueService;
import com.finance.user.MemberDetails;

import jakarta.servlet.http.HttpServletRequest;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class ApprovalsController {
	

		
	@Autowired
	private ApprovalsService approvalsService;
	
	@Autowired
	private RevenueService revenueService;
	
	@Autowired
	private ExpensesService expensesService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	
	@GetMapping(path = {"/approvals"})
	public String handleApprovals(@AuthenticationPrincipal MemberDetails currenUser, Model model) {
		 MemberModel currentUser = null;
		if (currenUser != null) {
			currentUser = currenUser.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}	
		//Fetching Revenue List
		LocalDate givenDate = LocalDate.now();
		revewnueAndExpensesList(model,givenDate,currentUser);
		return "approvals";
	}
	
	
	@PostMapping(path = {"/view-approval"})
	public String handleViewApprovals(@AuthenticationPrincipal MemberDetails currenUser,HttpServletRequest request, Model model) {
	 MemberModel currentUser = null;
		if (currenUser != null) {
			currentUser = currenUser.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}	
		LocalDate selectedDate = request.getParameter(ChunksFinanceConstants.APPROVAL_DATE) != null ? LocalDate.parse(request.getParameter(ChunksFinanceConstants.APPROVAL_DATE), DateTimeFormatter.ISO_LOCAL_DATE) : null;
        revewnueAndExpensesList(model,selectedDate,currentUser);
		model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
		return "approvals";
	}
	
	
	
	
	@PostMapping(path = {"/create-approval"})
	public String handleCreateApproval(Model model, HttpServletRequest request,@AuthenticationPrincipal MemberDetails currenUser) {
		LocalDate selectedDate = null;
		MemberModel currentUser = null;
		if (currenUser != null) {
			currentUser = currenUser.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}	
		try {
			selectedDate = request.getParameter(ChunksFinanceConstants.APPROVAL_DATE) != null ? LocalDate.parse(request.getParameter(ChunksFinanceConstants.APPROVAL_DATE), DateTimeFormatter.ISO_LOCAL_DATE) : null;
			boolean status = approvalsService.processApprovels(request);
			if(status) {
				model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getProperty(ChunksFinanceConstants.FINANCE_APPOVED_MESSAGE));
				revewnueAndExpensesList(model, selectedDate,currentUser);
			}
		}catch(DateExpiredException exception) {
			model.addAttribute(ChunksFinanceConstants.ERROR,propertyService.getProperty(ChunksFinanceConstants.FINANCE_DATEEXPIRED_MESSAGE));
			model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
			revewnueAndExpensesList(model, selectedDate,currentUser);
			return "approvals";
		}catch(AlreadyApprovedException exception) {
			model.addAttribute(ChunksFinanceConstants.ERROR,propertyService.getProperty(ChunksFinanceConstants.FINANCE_ALREADY_APPOVED_MESSAGE));
			model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
			revewnueAndExpensesList(model, selectedDate,currentUser);
			return "approvals";
		}
		model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
		return "approvals";
	}


	private void revewnueAndExpensesList(Model model, LocalDate givenDate,MemberModel currentUser) {
	
		List<RevenueModel> nonApprovedRevenueList = revenueService.getRevenueFromMondayToGivenDate(givenDate,currentUser);
		if(null != nonApprovedRevenueList && nonApprovedRevenueList.size() == 0) {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_REVENUE_LIST, null);
		}else {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_REVENUE_LIST, nonApprovedRevenueList);
		}
		
		//Fetching Expenses List		
		List<ExpensesModel> nonApprovedExpensesList = expensesService.getExpensesFromMondayToGivenDate(givenDate,currentUser);
		if(null != nonApprovedExpensesList && nonApprovedExpensesList.size() == 0) {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_EXPENSES_LIST, null);
		}else {
			model.addAttribute(ChunksFinanceConstants.NON_APPROVED_EXPENSES_LIST, nonApprovedExpensesList);
		}
		model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, givenDate);
	}
	
}

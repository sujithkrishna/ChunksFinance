package com.finance.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

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
import com.finance.exception.FirstApprovalCannotbeSameException;
import com.finance.model.MemberModel;
import com.finance.service.ApprovalsService;
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
	private ChunksFinancePropertyService propertyService;
	
	
	@GetMapping(path = {"/approvals"})
	public String handleApprovals(@AuthenticationPrincipal MemberDetails currentUserModel, Model model) {
		 MemberModel currentUser = null;
		if (currentUserModel != null) {
			currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}	
		//Fetching Revenue List
		LocalDateTime localDateTimeInIST = ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime();
		LocalDate givenDate = localDateTimeInIST.toLocalDate();
		approvalsService.revewnueAndExpensesList(model,givenDate,currentUser);
		return "approvals";
	}
	
	
	@PostMapping(path = {"/view-approval"})
	public String handleViewApprovals(@AuthenticationPrincipal MemberDetails currentUserModel,HttpServletRequest request, Model model) {
	 MemberModel currentUser = null;
		if (currentUserModel != null) {
			currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}	
		LocalDate selectedDate = request.getParameter(ChunksFinanceConstants.APPROVAL_DATE) != null ? LocalDate.parse(request.getParameter(ChunksFinanceConstants.APPROVAL_DATE), DateTimeFormatter.ISO_LOCAL_DATE) : null;
		approvalsService.revewnueAndExpensesList(model,selectedDate,currentUser);
		model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
		return "approvals";
	}
	
	
	
	
	@PostMapping(path = {"/create-approval"})
	public String handleCreateApproval(Model model, HttpServletRequest request,@AuthenticationPrincipal MemberDetails currentUserModel) {
		LocalDate selectedDate = null;
		MemberModel currentUser = null;
		if (currentUserModel != null) {
			currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}	
		try {
			selectedDate = request.getParameter(ChunksFinanceConstants.APPROVAL_DATE) != null ? LocalDate.parse(request.getParameter(ChunksFinanceConstants.APPROVAL_DATE), DateTimeFormatter.ISO_LOCAL_DATE) : null;
			boolean status = approvalsService.processApprovels(request,currentUserModel);
			if(status) {
				model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getProperty(ChunksFinanceConstants.FINANCE_APPOVED_MESSAGE));
				approvalsService.revewnueAndExpensesList(model, selectedDate,currentUser);
				model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
				return "approvals";
			}
		}catch(DateExpiredException exception) {
			model.addAttribute(ChunksFinanceConstants.ERROR,propertyService.getProperty(ChunksFinanceConstants.FINANCE_DATEEXPIRED_MESSAGE));
			model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
			approvalsService.revewnueAndExpensesList(model, selectedDate,currentUser);
			return "approvals";
		}catch(AlreadyApprovedException exception) {
			model.addAttribute(ChunksFinanceConstants.ERROR,propertyService.getProperty(ChunksFinanceConstants.FINANCE_ALREADY_APPOVED_MESSAGE));
			model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
			approvalsService.revewnueAndExpensesList(model, selectedDate,currentUser);
			return "approvals";
		}catch(FirstApprovalCannotbeSameException exception) {
			model.addAttribute(ChunksFinanceConstants.ERROR,propertyService.getProperty(ChunksFinanceConstants.FINANCE_FIRSTAPPROVAL_CANNOTBE_SAME_APPOVED_MESSAGE));
			model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
			approvalsService.revewnueAndExpensesList(model, selectedDate,currentUser);
			return "approvals";
		}
		model.addAttribute(ChunksFinanceConstants.SELCTED_APPROVAL_DATE, selectedDate);
		return "approvals";
	}


	
	
}

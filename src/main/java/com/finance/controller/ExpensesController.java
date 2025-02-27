package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.ExpensesModel;
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;
import com.finance.service.DashBoardService;
import com.finance.service.ExpensesService;
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
public class ExpensesController {
	
	@Autowired
	private DashBoardService boardService;
	
	@Autowired
	private ExpensesService expensesService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	@GetMapping(path = {"/expenses"})
	public String handleExpenses(@AuthenticationPrincipal MemberDetails memberDetails,Model model) {
		if (memberDetails != null) {
            MemberModel currentUser = memberDetails.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		List<FinanceModel> financeModel = boardService.getAllFinanceRecords();
		if(financeModel.size()==0) {
			financeModel = null;
		}
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
		
		Long currentExpensesNumber = expensesService.getMaxExpensesNumber();
		if(null == currentExpensesNumber) {
			model.addAttribute(ChunksFinanceConstants.EXPENSES_NUMBER, ChunksFinanceConstants.NUMBER_ONE);
		}else {
			model.addAttribute(ChunksFinanceConstants.EXPENSES_NUMBER, ++currentExpensesNumber);
		}
		return "expenses";
	}
	
	@PostMapping(path = {"/create-expenses"})
	public String handleCreatExpenses(@ModelAttribute ExpensesModel expensesModel,HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttributes) {
		boolean status = expensesService.createExpenses(request, expensesModel);
		String memberName = null;
		if(status) {
			redirectAttributes.addFlashAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.FINANCE_CREATE_EXPENSES_MESSAGE,memberName));
	        return "redirect:/expenses";
		}
		
		return "";
	}
	
	
	
	
	
	
}

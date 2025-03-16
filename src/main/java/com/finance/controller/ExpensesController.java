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
import com.finance.model.ExpensesModel;
import com.finance.model.MemberModel;
import com.finance.service.ExpensesService;
import com.finance.user.MemberDetails;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class ExpensesController {

	@Autowired
	private ExpensesService expensesService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	@GetMapping(path = {"/expenses"})
	public String handleExpenses(@AuthenticationPrincipal MemberDetails currentUserModel,Model model) {
		if (currentUserModel != null) {
            MemberModel currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		expensesService.populatingFields(model);
		return "expenses";
	}
	
	@PostMapping(path = {"/expenses"})
	public String handleCreatExpenses(@AuthenticationPrincipal MemberDetails currentUser,@ModelAttribute ExpensesModel expensesModel,Model model) {
		boolean status = expensesService.createExpenses(currentUser,expensesModel);
		if(status) {
			expensesService.populatingFields(model);
			model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.FINANCE_CREATE_EXPENSES_MESSAGE,currentUser.getMember().getMemberName()));
		}
  	   return "expenses";
	}
	
	
	
	
	
	
}

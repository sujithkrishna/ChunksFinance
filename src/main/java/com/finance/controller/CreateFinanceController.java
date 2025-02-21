package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;
import com.finance.service.CreateFinanceService;
import com.finance.service.LoginService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class CreateFinanceController {
	
	@Autowired
	private CreateFinanceService createFinanceService ;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	@GetMapping(path = {"/load-finance"})
	public ModelAndView handleLoanFinance(ModelAndView modelview) {
		List<String> primaryMembers = createFinanceService.getAllPrimaryMemeber();
		modelview.addObject("primaryMembers",primaryMembers);
		modelview.setViewName("createFinance");
        return modelview;
	}
	
	
	@PostMapping(path = {"/create-finance"})
	public ModelAndView handleCreateFinance(ModelAndView modelview,@ModelAttribute FinanceModel finance,HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttributes) {
		createFinanceService.creatFinance(request, finance);
		List<String> primaryMembers = createFinanceService.getAllPrimaryMemeber();
		modelview.addObject("primaryMembers",primaryMembers);
		modelview.addObject(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.FINANCE_CREATE_NEWFINANCE_MESSAGE,finance.getFinanceName()));
		modelview.setViewName("createFinance");		
		return modelview;
	}
}

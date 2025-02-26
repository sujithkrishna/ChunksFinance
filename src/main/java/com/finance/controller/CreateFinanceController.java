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
import com.finance.model.CurrentUser;
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;
import com.finance.service.CreateFinanceService;
import com.finance.service.LoginService;
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
public class CreateFinanceController {
	
	
	@Autowired
	private CreateFinanceService createFinanceService ;

	@Autowired
	private ChunksFinancePropertyService propertyService;
		
	@Autowired
	private CurrentUser currentUser;

	@Autowired
	private MemberService memberService;
	
	
	@GetMapping(path = {"/finance"})
	public String handleLoanFinance(Model modelview) {
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		modelview.addAttribute("primaryMembers",primaryMembers);
		if(null != currentUser  && !currentUser.isLoggedIn()) {
			currentUser.setMemberName(ChunksFinanceConstants.SILENT_WATCHER);
		}
		modelview.addAttribute("currentUser", currentUser);
        return "createFinance";
	}
	
	
	@PostMapping(path = {"/finance"})
	public String handleCreateFinance(Model model,@ModelAttribute FinanceModel finance,RedirectAttributes redirectAttributes) {
		createFinanceService.creatFinance(finance);
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute("primaryMembers",primaryMembers);
		model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.FINANCE_CREATE_NEWFINANCE_MESSAGE,finance.getFinanceName()));
				
		return "createFinance";
	}
}

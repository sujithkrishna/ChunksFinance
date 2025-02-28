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
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;
import com.finance.service.CreateFinanceService;
import com.finance.service.MemberService;
import com.finance.user.MemberDetails;
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
	private MemberService memberService;
	
	
	@GetMapping(path = {"/finance"})
	public String handleLoanFinance(@AuthenticationPrincipal MemberDetails currenUser,Model model) {
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		if (currenUser != null) {
            MemberModel currentUser = currenUser.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}		
		model.addAttribute("primaryMembers",primaryMembers);
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

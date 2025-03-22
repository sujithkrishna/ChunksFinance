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
	public String handleLoanFinance(@AuthenticationPrincipal MemberDetails currentUserModel,Model model) {
		if (currentUserModel != null) {
            MemberModel currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
            List<FinanceModel> activeFinancesWithOwner = createFinanceService.getActiveFinancesWithOwner(currentUser);
            if(null != activeFinancesWithOwner && activeFinancesWithOwner.size() >=1) {
            	model.addAttribute(ChunksFinanceConstants.FINANCE_OWNER, Boolean.TRUE);
            }
		}		
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute(ChunksFinanceConstants.PRIMARY_MEMBERS,primaryMembers);
		
		List<FinanceModel> sourceFinance = createFinanceService.getActiveFinancesWithOwner(currentUserModel.getMember());
		model.addAttribute(ChunksFinanceConstants.SOURCE_FINANCE,sourceFinance);
		
		List<FinanceModel> destinationFinance = createFinanceService.getActiveFinancesWithOwnerNotOwner(currentUserModel.getMember());
		model.addAttribute(ChunksFinanceConstants.DESTINATION_FINANCE,destinationFinance);
		
		
        return "createFinance";
	}
	
	
	@PostMapping(path = {"/finance"})
	public String handleCreateFinance(@AuthenticationPrincipal MemberDetails currentUserModel,Model model,@ModelAttribute FinanceModel finance,RedirectAttributes redirectAttributes) {
		if(currentUserModel.getMember().getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
			boolean status = createFinanceService.creatFinance(finance);
			List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
			model.addAttribute(ChunksFinanceConstants.PRIMARY_MEMBERS,primaryMembers);
			if(status) {
			 model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.FINANCE_CREATE_NEWFINANCE_MESSAGE,finance.getFinanceName()));
			}
		}else {
			 model.addAttribute(ChunksFinanceConstants.ERROR, propertyService.getFormattedProperty(ChunksFinanceConstants.FINANCE_CREATE_NEWFINANCENOTAUTHORISED_MESSAGE,currentUserModel.getMember().getMemberName()));
		}
		
				
		return "createFinance";
	}
}

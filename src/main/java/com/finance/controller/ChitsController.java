package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.ChitsModel;
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;
import com.finance.service.ChitsService;
import com.finance.service.CreateFinanceService;
import com.finance.service.MemberService;
import com.finance.user.MemberDetails;

import jakarta.servlet.http.HttpServletRequest;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class ChitsController {
	

	@Autowired
	private CreateFinanceService financeService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ChitsService chitsService;
	
	@GetMapping(path = {"/chits"})
	public String handleChits(@AuthenticationPrincipal MemberDetails currenUser, Model model) {
		if (currenUser != null) {
            MemberModel currentUser = currenUser.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		
		List<FinanceModel> financeModel = financeService.getAllFinanceRecords();
		if(financeModel.size()==0) {
			financeModel = null;
		}
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
		
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute("primaryMembers",primaryMembers);
		
		Integer currentChitsNumber = chitsService.getMaxChitsNumber();
		if(null == currentChitsNumber) {
			model.addAttribute(ChunksFinanceConstants.CHITS_NUMBER,ChunksFinanceConstants.NUMBER_ONE);
		}else {
			++currentChitsNumber;
			model.addAttribute(ChunksFinanceConstants.CHITS_NUMBER,currentChitsNumber);
		}
		return "chits";
	}
	
	@PostMapping(path = {"/chits"})
	public String handleCreateChits(@AuthenticationPrincipal MemberDetails currenUser,HttpServletRequest request,@ModelAttribute ChitsModel chitsModel, Model model) {
		
		boolean status = chitsService.createChits(chitsModel,request);
		
		if (currenUser != null) {
            MemberModel currentUser = currenUser.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		
		List<FinanceModel> financeModel = financeService.getAllFinanceRecords();
		if(financeModel.size()==0) {
			financeModel = null;
		}
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
		
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute("primaryMembers",primaryMembers);
		
		Integer currentChitsNumber = chitsService.getMaxChitsNumber();
		if(null == currentChitsNumber) {
			model.addAttribute(ChunksFinanceConstants.CHITS_NUMBER,ChunksFinanceConstants.NUMBER_ONE);
		}else {
			++currentChitsNumber;
			model.addAttribute(ChunksFinanceConstants.CHITS_NUMBER,currentChitsNumber);
		}
		return "chits";
	}
}

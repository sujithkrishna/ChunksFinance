package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.CashModel;
import com.finance.model.CurrentUser;
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;
import com.finance.service.CashService;
import com.finance.service.DashBoardService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class CashController {
	
	@Autowired
	private CurrentUser currentUser;
	
	@Autowired
	private DashBoardService boardService;
	
	@Autowired
	private CashService cashService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	@GetMapping(path = {"/cash"})
	public String handleCash(HttpServletRequest request, HttpServletResponse response, Model model) {
		if(null != currentUser  && !currentUser.isLoggedIn()) {
			currentUser.setMemberName(ChunksFinanceConstants.SILENT_WATCHER);
		}
		model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		model.addAttribute(ChunksFinanceConstants.CURRENT_USER_NAME, currentUser.getMemberName());
		List<FinanceModel> financeModel = boardService.getAllFinanceRecords();
		if(financeModel.size()==0) {
			financeModel = null;
		}
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
		Long currentCashNumber = cashService.getMaxCashNumber();
		if(null == currentCashNumber) {
			model.addAttribute(ChunksFinanceConstants.CASH_NUMBER, ChunksFinanceConstants.CASH_NUMBER_ONE);
		}else {
			model.addAttribute(ChunksFinanceConstants.CASH_NUMBER, ++currentCashNumber);
		}
		return "cash";
	}
	
	@PostMapping(path = {"/create-cash"})
	public String handleCreatCash(@ModelAttribute CashModel cashModel,HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttributes) {
		boolean status = cashService.creatCash(request, cashModel);
		String memberName = null;
		if(null != currentUser  && !currentUser.isLoggedIn()) {
			memberName = ChunksFinanceConstants.SILENT_WATCHER;
		}else {
			memberName = currentUser.getMemberName();
		}
		if(status) {
			redirectAttributes.addFlashAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.FINANCE_CREATE_CASH_MESSAGE,memberName));
	        return "redirect:/cash";
		}
		
		return "";
	}
	
	
}

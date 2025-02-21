package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.CurrentUser;
import com.finance.model.FinanceModel;
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
public class DashBoardController {
	
	

	@Autowired
	private CurrentUser currentUser;
	
	@Autowired
	private DashBoardService boardService;
	
	@GetMapping(path = {"/dashboard"})
	public String handleDashboard(HttpServletRequest request, HttpServletResponse response, Model model) {
		if(null != currentUser  && !currentUser.isLoggedIn()) {
			currentUser.setMemberName(ChunksFinanceConstants.SILENT_WATCHER);
		}
		List<FinanceModel> financeModel = boardService.getAllFinanceRecords();
		model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		if(financeModel.size()==0) {
			financeModel = null;
		}
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
        return "dashboard";
	}

}

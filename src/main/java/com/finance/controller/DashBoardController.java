package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;
import com.finance.service.CreateFinanceService;
import com.finance.service.DashBoardService;
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
public class DashBoardController {
	
	@Autowired
	private CreateFinanceService financeService;
	
	@GetMapping(path = {"/dashboard"})
	public String handleDashboard(@AuthenticationPrincipal MemberDetails currenUser, Model model) {
		List<FinanceModel> financeModel = financeService.getAllFinanceRecords();
		if (currenUser != null) {
	            MemberModel currentUser = currenUser.getMember();
	            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
	    }
		if(financeModel.size()==0) {
			financeModel = null;
		}
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
        return "dashboard";
	}

}

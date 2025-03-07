package com.finance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finance.service.DashBoardService;
import com.finance.user.MemberDetails;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class DashBoardController {
	
	@Autowired
	private DashBoardService boardService;
	
	
	@GetMapping(path = {"/dashboard"})
	public String handleDashboard(@AuthenticationPrincipal MemberDetails currenUser, Model model) {
		boardService.populateDashboardData(currenUser, model);
        return "dashboard";
	}

	

}

package com.finance.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.MemberModel;
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
public class ReportsController {

	@GetMapping(path = {"/reports"})
	public String handleReports(@AuthenticationPrincipal MemberDetails memberDetails, Model model) {
		if (memberDetails != null) {
            MemberModel currentUser = memberDetails.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		return "reports";
	}
}

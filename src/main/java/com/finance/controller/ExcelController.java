package com.finance.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 * 17 May 2026
 *
 */
@Controller
public class ExcelController {

	@GetMapping(path = {"/excel"})
	public String handleExcel(@AuthenticationPrincipal MemberDetails currentUserModel, Model model) {
		model.addAttribute("currentUser", currentUserModel);
		return "excel";
	}

}

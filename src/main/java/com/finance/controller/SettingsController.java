package com.finance.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finance.user.MemberDetails;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class SettingsController {
	

	@GetMapping(path = {"/settings"})
	public String handleDashboard(@AuthenticationPrincipal MemberDetails currenUser, Model model) {
		
        return "settings";
	}

}

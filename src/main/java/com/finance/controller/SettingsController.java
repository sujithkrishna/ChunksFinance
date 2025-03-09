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
import com.finance.model.MemberModel;
import com.finance.model.SettingsModel;
import com.finance.service.SettingsService;
import com.finance.user.MemberDetails;

import jakarta.servlet.http.HttpServletRequest;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class SettingsController {

	@Autowired
	private SettingsService settingsService;  
	
	@GetMapping(path = {"/settings"})
	public String handleSetting(@AuthenticationPrincipal MemberDetails currenUser,@ModelAttribute SettingsModel settingModel ,Model model) {
		
		if (currenUser != null) {
            MemberModel currentUser = currenUser.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		List<SettingsModel> allSettings = settingsService.getAllSettings();
		model.addAttribute(ChunksFinanceConstants.ALL_SETTINGS, allSettings);
		
		
		
        return "settings";
	}
	
	
	@PostMapping(path = {"/settings"})
	public String handleCreateSetting(@AuthenticationPrincipal MemberDetails currenUser,HttpServletRequest request, @ModelAttribute SettingsModel settingModel ,Model model) {
		settingsService.saveSettings(currenUser,settingModel,request);
		List<SettingsModel> allSettings = settingsService.getAllSettings();
		 model.addAttribute(ChunksFinanceConstants.ALL_SETTINGS, allSettings);
        return "settings";
	}

}

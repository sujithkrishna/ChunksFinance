package com.finance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.CurrentUser;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class ChitsController {
	
	@Autowired
	private CurrentUser currentUser;
	
	@GetMapping(path = {"/new-chits"})
	public String handleChits(HttpServletRequest request, HttpServletResponse response, Model model) {
		if(null != currentUser  && !currentUser.isLoggedIn()) {
			currentUser.setMemberName(ChunksFinanceConstants.SILENT_WATCHER);
		}
		model.addAttribute("currentUser", currentUser);
		return "newChits";
	}
}

package com.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class FinanceUploadController {

	@GetMapping(path = {"/finance-uploads"})
	public String handleFinanceUploads(HttpServletRequest request, HttpServletResponse response, Model model) {
	
		model.addAttribute("currentUser", "NULL");
		return "financeUploads";
	}
}

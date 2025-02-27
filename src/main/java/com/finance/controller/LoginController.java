package com.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class LoginController {
	
	@GetMapping(path = {"/financeLogin"})
	public String handleLogin(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
	    if (session != null) {
	        String errorMessage = (String) session.getAttribute("loginError");
	        if (errorMessage != null) {
	            model.addAttribute("error", errorMessage);
	            session.removeAttribute("loginError");
	        }
	    }
	    return "financeLogin";
	}
	
	

}

package com.finance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.PasswordWrongException;
import com.finance.exception.UserNotFoundException;
import com.finance.model.CurrentUser;
import com.finance.model.MemberModel;
import com.finance.service.LoginService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	@Autowired
	private CurrentUser currentUser;
	
	@GetMapping(path = {"/financeLogin"})
	public String handleLogin(Model model) {
		return "financeLogin";
	}
	
	@PostMapping(path = {"/financeLoginSubmit"})
	public String handleLogin(@ModelAttribute MemberModel member,HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttributes) {
		try {
			boolean loggedinStatus = loginService.validateLogin(request, member);
			if(loggedinStatus) {
				redirectAttributes.addFlashAttribute("currentUser", currentUser);
				return "redirect:/dashboard";			  
			}
		}catch(UserNotFoundException exception) {
			redirectAttributes.addFlashAttribute(ChunksFinanceConstants.ERROR, propertyService.getFormattedProperty(ChunksFinanceConstants.USER_NOTFOUND_ERROR));
			return "redirect:/financeLogin";			  
		}catch(PasswordWrongException exception) {
			redirectAttributes.addFlashAttribute(ChunksFinanceConstants.ERROR, propertyService.getFormattedProperty(ChunksFinanceConstants.USER_PASSWORD_WRONG_ERROR));
			return "redirect:/financeLogin";			  
		}
		return "financeLogin";
	}

}

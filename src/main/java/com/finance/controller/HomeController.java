package com.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class HomeController {
	
	@GetMapping(path = {"/", "/home", "/index"})
	public String handleHome(HttpServletRequest request) {
		System.out.println("Home Page called from "+request.getRemoteAddr());
		return "index";
	}
	
	@GetMapping(path = {"/about"})
	public String handleAbout() {
		return "about";
	}

	@GetMapping(path = {"/services"})
	public String handleServicest() {
		return "services";
	}
	

	@GetMapping(path = {"/contact"})
	public String handleContact() {
		return "contact";
	}
}

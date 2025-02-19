package com.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class FinanceStatusController {

	@GetMapping(path = {"/finance-status"})
	public String handleFinanceStatus() {
		return "financeStatus";
	}
}

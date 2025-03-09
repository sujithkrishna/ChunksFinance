package com.finance.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.MemberModel;
import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 * 10 Mar 2025
 *
 */
@Controller
public class EnrolmentController {
	
	@GetMapping(path = {"/enrolment"})
	public String handlePayments(@AuthenticationPrincipal MemberDetails currenUser, Model model) {
		if (currenUser != null) {
            MemberModel currentUser = currenUser.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		return "enrolment";
	}

}

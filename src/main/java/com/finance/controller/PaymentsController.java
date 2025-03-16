package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.MemberModel;
import com.finance.service.PaymentsService;
import com.finance.user.MemberDetails;

import jakarta.servlet.http.HttpServletRequest;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class PaymentsController {

	@Autowired
	private PaymentsService paymentsService;
	
	@GetMapping(path = {"/payments"})
	public String handlePayments(@AuthenticationPrincipal MemberDetails currentUserModel, Model model) {
		if (currentUserModel != null) {
            MemberModel currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		paymentsService.populatePaymentDetails(currentUserModel, model);
		return "payments";
	}

	@PostMapping(path = {"/payments"})
	public String handleCreatPayments(@AuthenticationPrincipal MemberDetails currentUserModel,@RequestParam("loanEMITxt") List<Double> loanEmiValues,@RequestParam("pendingAmountPrimaryTxt") List<Double> primaryPaymentValues,@RequestParam("pendingAmountSecondaryTxt") List<Double> secondaryPaymentValues,HttpServletRequest request,Model model ,
			@RequestParam("loanEMIName") List<Integer> loanEmiNames,@RequestParam("pendingAmountPrimaryName") List<Integer> primaryPaymentNames,@RequestParam("pendingAmountSecondaryName") List<Integer> secondaryPaymentNames) {
		paymentsService.processEMI(loanEmiValues,loanEmiNames);
		paymentsService.processPrimaryFund(primaryPaymentValues,primaryPaymentNames,currentUserModel);
		paymentsService.processSecondaryFund(secondaryPaymentValues,secondaryPaymentNames,currentUserModel);
		MemberModel currentUser = null;
		if (currentUserModel != null) {
            currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		paymentsService.populatePaymentDetails(currentUserModel, model);
		return "payments";
	}
	
}

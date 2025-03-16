package com.finance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.AccountModel;
import com.finance.service.EnrolmentService;
import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 * 10 Mar 2025
 *
 */
@Controller
public class EnrolmentController {
	
	@Autowired
	private EnrolmentService enrolmentService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	
	@GetMapping(path = {"/enrolment"})
	public String handleEnrolment(@AuthenticationPrincipal MemberDetails currentUserModel, Model model) {
		enrolmentService.populateEnrolmentData(currentUserModel, model);
		return "enrolment";
	}

	@PostMapping(path = {"/enrolment"})
	public String handleCreateEnrolment(@AuthenticationPrincipal MemberDetails currentUserModel,@ModelAttribute AccountModel accountModel, Model model) {
		try {
		boolean status = enrolmentService.createEnrolment(accountModel);
			if(status) {
				 enrolmentService.populateEnrolmentData(currentUserModel, model);
				 model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.ENROLMENT_CREATE_MESSAGE,accountModel.getAccountHolderName().getMemberName(),accountModel.getFinanceType().getFinanceName()));
			}
		}catch(DataIntegrityViolationException exception) {
			StringBuffer errorMessage = new StringBuffer(propertyService.getFormattedProperty(ChunksFinanceConstants.ENROLMENT_CREATE_NEWUSER_ERROR_EXISTING_USER_MESSAGE,accountModel.getAccountHolderName().getMemberName()));
			model.addAttribute(ChunksFinanceConstants.ERROR, errorMessage);
			enrolmentService.populateEnrolmentData(currentUserModel, model);
		}
		
		return "enrolment";
	}

	

}

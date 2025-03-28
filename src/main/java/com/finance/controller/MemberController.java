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
import com.finance.exception.DuplicateMemberEmailIdException;
import com.finance.exception.DuplicateMemberException;
import com.finance.model.MemberModel;
import com.finance.service.MemberService;
import com.finance.user.MemberDetails;
/**
 * 
 * 
 * @author Sujith Krishna
 * @date 19 Feb 2025
 */
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	

	
	@GetMapping(path = {"/member"})
	public String handleMember(@AuthenticationPrincipal MemberDetails currentUser,Model model) {
		memberService.loadPrimaryMemCurrentUser(model,currentUser);
        return "member";
	}
	
	@PostMapping(path = {"/member"})
	public String handleCreateMember(@AuthenticationPrincipal MemberDetails currentUserDetails,@ModelAttribute MemberModel member,Model model) {
		boolean status;
		String memberName = member.getMemberName();
		try {
			status = memberService.createMember(member);
			if(status) {
				model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.MEMBER_CREATE_NEWUSER_MESSAGE,memberName));
				memberService.loadPrimaryMemCurrentUser(model,currentUserDetails);
		        return "member";
			}
		} catch (DuplicateMemberEmailIdException exception) {
			StringBuffer errorMessage = new StringBuffer(propertyService.getFormattedProperty(ChunksFinanceConstants.MEMBER_CREATE_NEWUSER_ERROR_EMAILPRESENT_MESSAGE,memberName));
			model.addAttribute(ChunksFinanceConstants.ERROR, errorMessage);
			memberService.loadPrimaryMemCurrentUser(model,currentUserDetails);
	        return "member";
		}catch (DuplicateMemberException | DataIntegrityViolationException exception) {
			StringBuffer errorMessage = new StringBuffer(propertyService.getFormattedProperty(ChunksFinanceConstants.MEMBER_CREATE_NEWUSER_ERROR_SAMENAME_TYPE_MESSAGE,memberName));
			model.addAttribute(ChunksFinanceConstants.ERROR, errorMessage);
			memberService.loadPrimaryMemCurrentUser(model,currentUserDetails);
	        return "member";
		} catch (Exception exception) {
			model.addAttribute(ChunksFinanceConstants.ERROR, exception.getMessage());
			memberService.loadPrimaryMemCurrentUser(model,currentUserDetails);
	        return "member";
		}
		return "member"; 
	}
}

package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.DuplicateMemberEmailIdException;
import com.finance.exception.DuplicateMemberTypeNameException;
import com.finance.model.CurrentUser;
import com.finance.model.MemberModel;
import com.finance.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
	
	@Autowired
	private CurrentUser currentUser;

	@GetMapping(path = {"/member"})
	public String handleMember(HttpServletRequest request, HttpServletResponse response, Model model) {
        List<String> primaryMembers = memberService.getAllPrimaryMemeber();
        model.addAttribute("primaryMembers", primaryMembers);
		if(null != currentUser  && !currentUser.isLoggedIn()) {
			currentUser.setMemberName(ChunksFinanceConstants.SILENT_WATCHER);
		}
		model.addAttribute("currentUser", currentUser);
        return "member";
	}
	
	@PostMapping(path = {"/crateMember"})
	public String handleCreateMember(@ModelAttribute MemberModel member,HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttributes) {
		boolean status;
		String memberName = request.getParameter(ChunksFinanceConstants.MEMBER_NAME);
		try {
			status = memberService.createMember(request,member);
			if(status) {
				redirectAttributes.addFlashAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.MEMBER_CREATE_NEWUSER_MESSAGE,memberName));
		        return "redirect:/member";
			}
		} catch (DuplicateMemberEmailIdException exception) {
			StringBuffer errorMessage = new StringBuffer(propertyService.getFormattedProperty(ChunksFinanceConstants.MEMBER_CREATE_NEWUSER_ERROR_EMAILPRESENT_MESSAGE,memberName));
			redirectAttributes.addFlashAttribute(ChunksFinanceConstants.ERROR, errorMessage);
	        return "redirect:/member";
		} catch (DuplicateMemberTypeNameException exception) {
			StringBuffer errorMessage = new StringBuffer(propertyService.getFormattedProperty(ChunksFinanceConstants.MEMBER_CREATE_NEWUSER_ERROR_SAMENAME_TYPE_MESSAGE,memberName));
			redirectAttributes.addFlashAttribute(ChunksFinanceConstants.ERROR, errorMessage);
	        return "redirect:/member";
		} catch (Exception exception) {
			redirectAttributes.addFlashAttribute(ChunksFinanceConstants.ERROR, exception.getMessage());
	        return "redirect:/member";
		}
		return "member"; 
	}
}

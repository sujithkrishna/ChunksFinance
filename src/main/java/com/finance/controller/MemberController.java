package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@GetMapping(path = {"/member"})
	public String handleMember(HttpServletRequest request, HttpServletResponse response, Model model) {
        List<String> primaryMembers = memberService.getAllPrimaryMemeber();
        model.addAttribute("primaryMembers", primaryMembers);
        return "member";
	}
	
	@PostMapping(path = {"/crateMember"})
	public String handleCreateMember(@ModelAttribute MemberModel member,HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttributes) {
		boolean status = memberService.createMember(member);
		if(status) {
			StringBuffer successMessage = new StringBuffer("A New Member "+member.getMemberName()+" created successfully!");
			redirectAttributes.addFlashAttribute("success", successMessage);
	        return "redirect:/member";
		}
		return "member"; 
	}
}

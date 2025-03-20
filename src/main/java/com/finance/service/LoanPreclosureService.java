package com.finance.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.FinanceModel;
import com.finance.model.LoanModel;
import com.finance.model.MemberModel;
import com.finance.repository.LoanRepository;
import com.finance.repository.MemberRepository;
import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 * 19 Mar 2025
 *
 */
@Service
public class LoanPreclosureService {
	
	@Autowired
	private CreateFinanceService createFinanceService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private LoanRepository loanRepository;
	
	public void populatePreClosureData(MemberDetails currentUserModel, Model model) {
		if (currentUserModel != null) {
            MemberModel currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		
		List<FinanceModel> allActiveFinance = createFinanceService.getAllFinanceRecords();
		model.addAttribute(ChunksFinanceConstants.ALL_ACTIVE_FINANCE, allActiveFinance);
		
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute(ChunksFinanceConstants.PRIMARY_MEMBERS,primaryMembers);
		
		List<MemberModel> secondaryMembers = memberService.getAllSecondaryMemeber();
		model.addAttribute(ChunksFinanceConstants.SECONDARY_MEMBERS,secondaryMembers);
	}
	
	
	public void populateLoanData(String loanpersonsNo, Model model) {
		if(null != loanpersonsNo) {
			Optional<MemberModel> byMemberName = memberRepository.findById(Integer.parseInt(loanpersonsNo));
			if(null != byMemberName && byMemberName.isPresent()) {
				List<LoanModel> byLoanApplicantName = loanRepository.findByLoanApplicantName(byMemberName.get());
				if(null != byLoanApplicantName && byLoanApplicantName.size() >=1) {
					model.addAttribute(ChunksFinanceConstants.LOAN_ITEM,byLoanApplicantName.get(0));
				}
			}
			
		}
		
	}

}

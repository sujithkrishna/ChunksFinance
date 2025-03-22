package com.finance.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.AccountModel;
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;
import com.finance.repository.AccountRepository;
import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 * 11 Mar 2025
 *
 */
@Service
public class EnrolmentService {
	
	@Autowired
	private CreateFinanceService createFinanceService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private CreateFinanceService financeService;

	public void populateEnrolmentData(MemberDetails currentUserModel, Model model) {
		if (currentUserModel != null) {
            MemberModel currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
            List<FinanceModel> activeFinancesWithOwner = financeService.getActiveFinancesWithOwner(currentUser);
            if(null != activeFinancesWithOwner && activeFinancesWithOwner.size() >=1) {
            	model.addAttribute(ChunksFinanceConstants.FINANCE_OWNER, Boolean.TRUE);
            }
		}
		
		List<FinanceModel> allSecondaryFinance = createFinanceService.getActiveSecondaryFinances();
		model.addAttribute(ChunksFinanceConstants.SECONDARY_FINANCE, allSecondaryFinance);
		
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute(ChunksFinanceConstants.PRIMARY_MEMBERS,primaryMembers);
		
		List<MemberModel> secondaryMembers = memberService.getAllSecondaryMemeber();
		model.addAttribute(ChunksFinanceConstants.SECONDARY_MEMBERS,secondaryMembers);
	}

	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean createEnrolment(AccountModel accountModel) {
		Integer currentAccountMaxId = accountRepository.findMaxAccountNo();
		++currentAccountMaxId;
		accountModel.setId(currentAccountMaxId++);
		accountModel.setCurrentBalance(BigDecimal.ZERO);
		accountModel.setBalanceIncludingInterest(BigDecimal.ZERO);
		accountRepository.save(accountModel);
		return true;
	}
}

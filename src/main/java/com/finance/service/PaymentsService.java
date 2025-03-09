package com.finance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finance.model.LoanEmiDetail;
import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 * 9 Mar 2025
 *
 */
@Service
public class PaymentsService {
	
	@Autowired
	private LoanService loanService;
	
	public List<LoanEmiDetail> loadEMI(MemberDetails currenUser){
		List<LoanEmiDetail> allLoansForCurrentUser = loanService.findAllLoansForCurrentUser(currenUser);
		return allLoansForCurrentUser;
	}

}

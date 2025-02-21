package com.finance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.model.FinanceModel;
import com.finance.repository.FinanceRepository;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Service
public class CreateFinanceService {

	@Autowired
	private FinanceRepository financeRepository;
	
	@Autowired
	private MemberService memberService;

	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean creatFinance(HttpServletRequest request, FinanceModel finance) {
		if(null == finance.getCurrentBalance()) {
			finance.setCurrentBalance(Long.valueOf(0));
		}
		if(null == finance.getFinanceAmount()) {
			finance.setFinanceAmount(Long.valueOf(0));
		}
		
		financeRepository.save(finance);
		return true;
	}
	
	public List<String> getAllPrimaryMemeber() {
		List<String> primaryMembers = memberService.getAllPrimaryMemeber();
		return primaryMembers;
	}
	
}

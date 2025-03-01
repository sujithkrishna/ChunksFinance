package com.finance.service;
/**
 * @author Sujith Krishna
 *
 * 1 Mar 2025
 *
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.finance.model.ChitsModel;
import com.finance.model.ExpensesModel;
import com.finance.model.FinanceModel;
import com.finance.model.LoanModel;
import com.finance.model.MemberModel;
import com.finance.model.RevenueModel;
import com.finance.repository.ChitsRepository;
import com.finance.repository.ExpensesRepository;
import com.finance.repository.FinanceRepository;
import com.finance.repository.LoanRepository;
import com.finance.repository.MemberRepository;
import com.finance.repository.RevenueRepository;
@Component
public class AllExportService {

	@Autowired
	private ChitsRepository chitsRepository;
	@Autowired
	private ExpensesRepository expensesRepository;
	@Autowired
	private FinanceRepository financeRepository;
	@Autowired
	private LoanRepository loanRepository;
	@Autowired
	private MemberRepository memberRepository;
	@Autowired
	private RevenueRepository revenueRepository;
	
	
	public List<ChitsModel> getAllChits() {
        return chitsRepository.findAll();
    }
	
	
	public List<ExpensesModel> getAllExpenses() {
        return expensesRepository.findAll();
    }
	
	public List<FinanceModel> getAllFinances() {
        return financeRepository.findAll();
    }
	
	public List<LoanModel> getAllLoans() {
        return loanRepository.findAll();
    }
	
	public List<MemberModel> getAllMembers() {
        return memberRepository.findAll();
    }
	
	public List<RevenueModel> getAllRevenue() {
        return revenueRepository.findAll();
    }
}

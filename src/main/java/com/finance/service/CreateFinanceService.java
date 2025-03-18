package com.finance.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.model.AccountModel;
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;
import com.finance.repository.AccountRepository;
import com.finance.repository.FinanceRepository;

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
	
	@Autowired
	private AccountRepository accountRepository;
		
	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean creatFinance(FinanceModel finance) {
		if(null == finance.getCurrentBalance()) {
			finance.setCurrentBalance(Double.valueOf(0));
		}
		if(null == finance.getFinanceAmount()) {
			finance.setFinanceAmount(Double.valueOf(0));
		}
		Integer maxNumber = financeRepository.findMaxNo();
		if(null != maxNumber) {
			finance.setId(++maxNumber);
		}else {
			finance.setId(1);
		}
		financeRepository.save(finance);
		// Fetch all primary users and add into the accounts.
		if(FinanceModel.FinanceType.PRIMARY.equals(finance.getFinanceType())) {
			List<MemberModel> allPrimaryMembers = memberService.getAllPrimaryMemeber();
			Integer currentAccountMaxId = accountRepository.findMaxAccountNo();
			++currentAccountMaxId;
			for (MemberModel memberModel : allPrimaryMembers) {
				AccountModel aModel = new AccountModel();
				aModel.setId(currentAccountMaxId++);
				aModel.setAccountHolderName(memberModel);
				aModel.setFinanceType(finance);
				aModel.setCurrentBalance(BigDecimal.ZERO);
				aModel.setBalanceIncludingInterest(BigDecimal.ZERO);
				accountRepository.save(aModel);
			}
		}
		return true;
	}
	
	
	public List<FinanceModel> getAllSortedByLoanPriorityNum(){
		return financeRepository.findAllSortedByLoanPriorityOrderNumber();
	}
	
	 public List<FinanceModel> getAllFinanceRecords() {
	        return financeRepository.findActiveFinances();
	 }
	
	 public List<FinanceModel> getActivePrimaryFinances() {
	        return financeRepository.findActivePrimaryFinances(FinanceModel.FinanceType.PRIMARY, FinanceModel.FinanceStatus.ACTIVE);
	 }
	 
	 public List<FinanceModel> getActiveSecondaryFinances() {
	        return financeRepository.findActivePrimaryFinances(FinanceModel.FinanceType.SECONDARY, FinanceModel.FinanceStatus.ACTIVE);
	 }
	 
	 public List<FinanceModel> getActivePrimaryFinancesWithOwner(MemberModel financeOwner) {
	        return financeRepository.findActivePrimaryFinancesWithOwner(financeOwner);
	 }
	 
}

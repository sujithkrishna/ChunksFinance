package com.finance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.model.FinanceModel;
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
		return true;
	}
	
	
	 public List<FinanceModel> getAllFinanceRecords() {
	        return financeRepository.findAll();
	    }
	
}

package com.finance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.CashModel;
import com.finance.model.MemberModel;
import com.finance.repository.CashRepository;
import com.finance.repository.FinanceRepository;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Service
public class CashService {
	
	

	@Autowired
    private CashRepository cashRepository;
	
	@Autowired
	private FinanceRepository financeRepository;
	
	public Long getMaxCashNumber() {
        return cashRepository.findMaxCashNumber(); 
    }

	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean creatCash(HttpServletRequest request, CashModel cash) {
		cash.setCurrentStatus(ChunksFinanceConstants.IN_PROGRESS);
		if(null != cash.getFinanceType()) {
			String[] financeTypeDataSplit = cash.getFinanceType().split(ChunksFinanceConstants.FINANCETYPE_SPLIT_REGEX);
			String financeOwnerName = financeTypeDataSplit[2];
			cash.setApproverName(financeOwnerName);		
		}else {
			// Its going to Default Approver
			
		}
		

		try {
			cashRepository.save(cash);
			return true;
		} catch (Exception exception) {
			return false;
		}
		
		
		
	}
	
}

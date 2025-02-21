package com.finance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.RevenueModel;
import com.finance.model.MemberModel;
import com.finance.repository.RevenueRepository;
import com.finance.repository.FinanceRepository;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Service
public class RevenueService {
	
	

	@Autowired
    private RevenueRepository revenueRepository;
	
	@Autowired
	private FinanceRepository financeRepository;
	
	public Long getMaxRevenueNumber() {
        return revenueRepository.findMaxRevenueNumber(); 
    }

	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean creatRevenue(HttpServletRequest request, RevenueModel revenue) {
		revenue.setCurrentStatus(ChunksFinanceConstants.IN_PROGRESS);
		if(null != revenue.getFinanceType()) {
			String[] financeTypeDataSplit = revenue.getFinanceType().split(ChunksFinanceConstants.FINANCETYPE_SPLIT_REGEX);
			String financeOwnerName = financeTypeDataSplit[2];
			revenue.setApproverName(financeOwnerName);		
		}else {
			// Its going to Default Approver
			
		}
		try {
			revenueRepository.save(revenue);
			return true;
		} catch (Exception exception) {
			return false;
		}
		
		
		
	}
	
}

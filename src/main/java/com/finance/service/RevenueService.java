package com.finance.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.FinanceModel;
import com.finance.model.RevenueModel;
import com.finance.repository.FinanceRepository;
import com.finance.repository.RevenueRepository;

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
	
	@Autowired
	private DashBoardService boardService;
	

	public Integer getMaxRevenueNumber() {
        return revenueRepository.findMaxNo(); 
    }

	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean creatRevenue(RevenueModel revenue) {
		if(null != revenue.getFinanceType()) {
			//String[] financeTypeDataSplit = revenue.getFinanceType().split(ChunksFinanceConstants.FINANCETYPE_SPLIT_REGEX);
			//String financeOwnerName = financeTypeDataSplit[2];
			//revenue.setApproverName(financeOwnerName);		
		}else {
			// Its going to Default Approver
			
		}
		try {
			Integer maxRevenueNum = getMaxRevenueNumber();
			if(null != maxRevenueNum && maxRevenueNum<revenue.getRevenueNumber()) {
				revenue.setRevenueNumber(++maxRevenueNum);
			}else {
				revenue.setRevenueNumber(1);
			}
			//revenue.setSpenderName(currentUser.getCurrentUser());
			revenue.setSpenderName(null);
			revenue.setApproverName(revenue.getFinanceType().getFinanceOwner());
			revenueRepository.save(revenue);
			return true;
		} catch (Exception exception) {
			return false;
		}
		
	}
	
	
	public Model populatingFields(Model model) {
		List<FinanceModel> financeModel = boardService.getAllFinanceRecords();
		if(financeModel.size()==0) {
			financeModel = null;
		}
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
		Integer currentRevenueNumber = getMaxRevenueNumber();
		
		if(null == currentRevenueNumber) {
			model.addAttribute(ChunksFinanceConstants.REVENUE_NUMBER, ChunksFinanceConstants.NUMBER_ONE);
		}else {
			++currentRevenueNumber;
			model.addAttribute(ChunksFinanceConstants.REVENUE_NUMBER, currentRevenueNumber);
		}
		return model;
	}
	
	 public List<RevenueModel> getRevenueFromMondayToGivenDate(LocalDate givenDate) {
	        LocalDate startOfWeek = givenDate.with(DayOfWeek.MONDAY);
	        String currentUserName = null;

	       // return revenueRepository.findRevenueByDateRangeAndStatusAndApprover(startOfWeek, givenDate,ChunksFinanceConstants.IN_PROGRESS,currentUserName);
		 	return null;
	    }
	
}

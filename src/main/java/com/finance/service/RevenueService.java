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
import com.finance.model.MemberModel;
import com.finance.model.RevenueModel;
import com.finance.model.RevenueModel.CurrentStatus;
import com.finance.model.SettingsModel;
import com.finance.repository.RevenueRepository;
import com.finance.repository.SettingsRepository;
import com.finance.user.MemberDetails;

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
	private SettingsService settingsService;
	
	@Autowired
	private CreateFinanceService financeService;
	

	public Integer getMaxRevenueNumber() {
        return revenueRepository.findMaxNo(); 
    }

	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean creatRevenue(MemberDetails currentUser , RevenueModel revenue) {
		try {
			Integer maxRnumFromDB = getMaxRevenueNumber();
			if(null == maxRnumFromDB) {
				revenue.setRevenueNumber(1);
			} else {
				revenue.setRevenueNumber(++maxRnumFromDB);
			}
			revenue.setSpenderName(currentUser.getMember());
			revenue.setFirstapproverName(revenue.getFinanceType().getFinanceOwner());
			revenueRepository.save(revenue);
			return true;
		} catch (Exception exception) {
			return false;
		}
		
	}
	
	
	public void populatingFields(Model model) {
		List<FinanceModel> financeModel = financeService.getAllFinanceRecords();
		if(financeModel.size()==0) {
			financeModel = null;
		}
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
		Integer currentRevenueNumber = getMaxRevenueNumber();
		// Check here what you are doing....
		if(null == currentRevenueNumber) {
			model.addAttribute(ChunksFinanceConstants.REVENUE_NUMBER, ChunksFinanceConstants.NUMBER_ONE);
		}else {
			++currentRevenueNumber;
			model.addAttribute(ChunksFinanceConstants.REVENUE_NUMBER, currentRevenueNumber);
		}
	}
	
	 public List<RevenueModel> getRevenueFromMondayToGivenDate(LocalDate givenDate,MemberModel currentUser) {
			 LocalDate startOfWeek = givenDate.with(DayOfWeek.MONDAY);
			 LocalDate endOfWeek = givenDate.with(DayOfWeek.SUNDAY);
			 List<CurrentStatus> statusList = List.of(CurrentStatus.INPROGRESS, CurrentStatus.INITIAL_APPROVAL);
			 if(currentUser.getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
				 SettingsModel settingModelData = settingsService.getSettingByName(ChunksFinanceConstants.APPROVAL_PROCESS);
				 String approvalProcessStatus = null;
				 if(null != settingModelData) {
					 approvalProcessStatus = settingModelData.getSettingsValue();
				 }
				 if(ChunksFinanceConstants.APPROVAL_PROCESS_SEQUENTIAL.equals(approvalProcessStatus)) {
					 return revenueRepository.findRevenueByDateRangeAndStatusAndSuperAdminSequentialApprover(startOfWeek, endOfWeek, statusList);
				 }else {
					 return revenueRepository.findRevenueByDateRangeAndStatusAndSuperAdminApprover(startOfWeek, endOfWeek, statusList);
				 }
			 }else {
				 return revenueRepository.findRevenueByDateRangeAndStatusAndApprover(startOfWeek, endOfWeek, statusList, currentUser);
			 }
	 	     
	    }
	
}

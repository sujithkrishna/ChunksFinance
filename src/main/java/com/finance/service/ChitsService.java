package com.finance.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.ChitsEmiDetail;
import com.finance.model.ChitsModel;
import com.finance.model.LoanEmiDetail;
import com.finance.model.MemberModel;
import com.finance.model.SettingsModel;
import com.finance.repository.ChitsEmiDetailRepository;
import com.finance.repository.ChitsRepository;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 *         28 Feb 2025
 *
 */
@Service
public class ChitsService {



	@Autowired
	private ChitsRepository chitsRepository;
	
	@Autowired
	private SettingsService settingsService;
	
	@Autowired
	private ChitsEmiDetailRepository chitsEmiDetailRepository;
	
	public Integer getMaxChitsNumber() {
		return chitsRepository.findMaxChitsNo();
	}
	
	
	public ChitsModel getChitByNo(Integer chitsNo) {
        return chitsRepository.findByChitsNo(chitsNo);
    }

	public boolean createChits(ChitsModel chitsModel, HttpServletRequest request) {

		Integer currentChitsNumber = getMaxChitsNumber();
		List<ChitsEmiDetail> emiDetails = new ArrayList<ChitsEmiDetail>();
		int startEmiId = 1;
		if (currentChitsNumber == null || currentChitsNumber == 0) {
			startEmiId = 1;
		} else {
			startEmiId = currentChitsNumber * 20 + 1;
		}
		if (null == currentChitsNumber) {
			chitsModel.setChitsNo(1);
		} else {
			chitsModel.setChitsNo(++currentChitsNumber);
		}
		for (int i = 1; i <= 20; i++) {
			ChitsEmiDetail currentEMI = new ChitsEmiDetail();
			// Change this.
			currentEMI.setId(startEmiId + i - 1);
			currentEMI.setChits(chitsModel);
			currentEMI.setEmiNumber(i);
			currentEMI.setFirstapproverName(chitsModel.getFinanceType().getFinanceOwner());
			currentEMI.setEmiDate(chitsModel.getChitsStartDate().plusMonths(i * 1));
			String paramValue = request.getParameter(ChunksFinanceConstants.CHITS_DASH + i);
			currentEMI.setAmount(new BigDecimal(paramValue != null ? paramValue : ChunksFinanceConstants.ZERO));
			emiDetails.add(currentEMI);
		}
		chitsModel.setEmiDetails(emiDetails);
		chitsModel.setFirstapproverName(chitsModel.getFinanceType().getFinanceOwner());
		chitsRepository.save(chitsModel);
		return true;
	}

	
	public List<ChitsModel> getAllChitsNotApproved(MemberModel currentUser) {
		if(currentUser.getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
			
			 SettingsModel settingModelData = settingsService.getSettingByName(ChunksFinanceConstants.APPROVAL_PROCESS);
			 String approvalProcessStatus = null;
			 if(null != settingModelData) {
				 approvalProcessStatus = settingModelData.getSettingsValue();
			 }
			 if(ChunksFinanceConstants.APPROVAL_PROCESS_SEQUENTIAL.equals(approvalProcessStatus)) {
				 return chitsRepository.findByChitsNotApprovedANDBySuperAdminSequential();
			 }else {
				 return chitsRepository.findByChitsNotApprovedANDBySuperAdminParallel();
			 }
		}else {
			return chitsRepository.findByChitsNotApprovedANDByFinanceOwner(currentUser.getNo());
		}
		
	}
	
	
	
	
	public List<ChitsEmiDetail> findPendingApprovals(List<LoanEmiDetail.CurrentStatus> statusList,MemberModel currentUser,LocalDate startDate,LocalDate endDate){
		if(currentUser.getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
			SettingsModel settingModelData = settingsService.getSettingByName(ChunksFinanceConstants.APPROVAL_PROCESS);
			 String approvalProcessStatus = null;
			 if(null != settingModelData) {
				 approvalProcessStatus = settingModelData.getSettingsValue();
			 }
			 if(ChunksFinanceConstants.APPROVAL_PROCESS_SEQUENTIAL.equals(approvalProcessStatus)) {
				 return chitsEmiDetailRepository.findByStatusAndDateRangeAndApprovalTimes(statusList,startDate,endDate,ChitsModel.CurrentStatus.INPROGRESS);
			 }else {
				 return chitsEmiDetailRepository.findByStatusAndDateRangeAndSecondApprovalTimeIsNull(statusList,startDate,endDate,ChitsModel.CurrentStatus.INPROGRESS);
			 }
		}else {
			return chitsEmiDetailRepository.findPendingApprovals(statusList,currentUser,startDate,endDate,ChitsModel.CurrentStatus.INPROGRESS);
		}
		
	}
	
	
	
}

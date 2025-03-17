package com.finance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.LoanEmiDetail;
import com.finance.model.MemberModel;
import com.finance.model.SettingsModel;
import com.finance.repository.LoanEmiDetailRepository;

/**
 * @author Sujith Krishna
 *
 * 17 Mar 2025
 *
 */
@Service
public class LoanEmiDetailService {

	@Autowired
	private LoanEmiDetailRepository loanEmiDetailRepository; 
	
	@Autowired
	private SettingsService settingsService;
	
	 public List<LoanEmiDetail> getPaidLoanEmiDetails(MemberModel currentUser) {
		 if(currentUser.getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
			 SettingsModel settingModelData = settingsService.getSettingByName(ChunksFinanceConstants.APPROVAL_PROCESS);
			 String approvalProcessStatus = null;
			 if(null != settingModelData) {
				 approvalProcessStatus = settingModelData.getSettingsValue();
			 }
			 if(ChunksFinanceConstants.APPROVAL_PROCESS_SEQUENTIAL.equals(approvalProcessStatus)) {
				 return loanEmiDetailRepository.findPaidLoanEmiDetailsForAdminSequential();
			 }else {
				 return loanEmiDetailRepository.findPaidLoanEmiDetailsForAdminParallel();
			 }
		 }else {
			 return loanEmiDetailRepository.findPaidLoanEmiDetails(currentUser);
		 }
	 }
}

package com.finance.service;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.FinanceModel;
import com.finance.model.FinanceTransferModel;
import com.finance.model.FinanceTransferModel.CurrentStatus;
import com.finance.model.MemberModel;
import com.finance.model.SettingsModel;
import com.finance.repository.FinanceRepository;
import com.finance.repository.FinanceTransferRepository;

/**
 * @author Sujith Krishna
 *
 * 21 Mar 2025
 *
 */

@Service
public class FinanceTransferService {
	
	@Autowired
	private FinanceTransferRepository financeTransferRepository;
	
	@Autowired
	private FinanceRepository financeRepository;
	
	@Autowired
	private SettingsService settingsService;
	
	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean createFinanceTransfer(FinanceTransferModel financeTransferModel) {
		int maxCount  = 1;
		Optional<Integer> maxNo = financeTransferRepository.findMaxId();
		if(null != maxNo && maxNo.isPresent()) {
			maxCount = maxNo.get();
			maxCount++;
		}
		financeTransferModel.setId(maxCount);
		financeTransferModel.setFinanceTransferDate(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDate());
		financeTransferModel.setFirstapproverName(financeTransferModel.getSourceFinanceType().getFinanceOwner());
		financeTransferRepository.save(financeTransferModel);
		return true;
	}

	public List<FinanceTransferModel> fetchAllFinanceTransfersForFinanceOwner(MemberModel currentUser){
		List<FinanceTransferModel> pendingList = new ArrayList<FinanceTransferModel>();
		List<FinanceModel> activeFinancesWithOwner = financeRepository.findActiveFinancesWithOwner(currentUser);
		List<CurrentStatus> statusList = List.of(CurrentStatus.REQUESTED, CurrentStatus.INITIAL_APPROVAL);
		for (FinanceModel financeModel : activeFinancesWithOwner) {
			List<FinanceTransferModel> pendingRequestItem = financeTransferRepository.findAllByCurrentStatusAndSourceFinanceType(statusList,financeModel);
			pendingList.addAll(pendingRequestItem);
		}
		return pendingList;
	}
	
	public List<FinanceTransferModel> fetchAllFinanceTransfersForAdmin(MemberModel currentUser){
		if(currentUser.getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
			 SettingsModel settingModelData = settingsService.getSettingByName(ChunksFinanceConstants.APPROVAL_PROCESS);
			 String approvalProcessStatus = null;
				 if(null != settingModelData) {
					 approvalProcessStatus = settingModelData.getSettingsValue();
				 }
				 List<CurrentStatus> statusList = List.of(CurrentStatus.REQUESTED, CurrentStatus.INITIAL_APPROVAL); 
				if(ChunksFinanceConstants.APPROVAL_PROCESS_SEQUENTIAL.equals(approvalProcessStatus)) {
					return financeTransferRepository.findAllByCurrentStatusForAdminSequential(statusList);
				}else {
					return financeTransferRepository.findAllByCurrentStatusForAdminParallel(statusList);
				}
			}
		return null;
	}
	
	
	
}

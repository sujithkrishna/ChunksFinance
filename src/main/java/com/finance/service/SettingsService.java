package com.finance.service;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.SettingsModel;
import com.finance.repository.SettingsRepository;
import com.finance.user.MemberDetails;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 * 3 Mar 2025
 *
 */
@Service
public class SettingsService {
	
	@Autowired
    private SettingsRepository settingsRepository;
	
	public Integer getMaxSettingsNumber() {
		return settingsRepository.findMaxSettingsNo();
	}
	
	public SettingsModel getSettingByName(String settingsName) {
	    return settingsRepository.findBySettingsName(settingsName).orElse(null);
	}
	
	public List<SettingsModel> getAllSettings() {
        return settingsRepository.findAll();
    }

	
	
	public boolean saveSettings(MemberDetails currentUser,SettingsModel settingModel,HttpServletRequest request) {
		
			String approvalProcessValue = request.getParameter(ChunksFinanceConstants.APPROVAL_PROCESS);
			saveSettings(currentUser, ChunksFinanceConstants.APPROVAL_PROCESS,approvalProcessValue);
			
			String secondaryLoginValue = request.getParameter(ChunksFinanceConstants.SECONDARY_LOGIN);
			saveSettings(currentUser, ChunksFinanceConstants.SECONDARY_LOGIN,secondaryLoginValue);
			
			String approvalcutoffValue = request.getParameter(ChunksFinanceConstants.APPROVAL_CUTOFF);
			saveSettings(currentUser, ChunksFinanceConstants.APPROVAL_CUTOFF_DAY,approvalcutoffValue);
			
			String approvaltimeValue = request.getParameter(ChunksFinanceConstants.APPROVAL_TIME);
			saveSettings(currentUser, ChunksFinanceConstants.APPROVAL_CUTOFF_TIME,approvaltimeValue);
			
			String expensesStatusValue = request.getParameter(ChunksFinanceConstants.EXPENSES_STATUS);
			saveSettings(currentUser, ChunksFinanceConstants.EXPENSES_STATUS,expensesStatusValue);
			
			String revenueStatusValue = request.getParameter(ChunksFinanceConstants.REVENUE_STATUS);
			saveSettings(currentUser, ChunksFinanceConstants.REVENUE_STATUS,revenueStatusValue);
			
			String primaryapprovalcutoffValue = request.getParameter(ChunksFinanceConstants.PRIMARY_APPROVAL_CUTOFF);
			saveSettings(currentUser, ChunksFinanceConstants.PRIMARY_APPROVAL_CUTOFF_DAY,primaryapprovalcutoffValue);
			
			String primaryapprovaltimeValue = request.getParameter(ChunksFinanceConstants.PRIMARY_APPROVAL_TIME);
			saveSettings(currentUser, ChunksFinanceConstants.PRIMARY_APPROVAL_CUTOFF_TIME,primaryapprovaltimeValue);
			
			
			String secondaryapprovalcutoffValue = request.getParameter(ChunksFinanceConstants.SECONDARY_APPROVAL_CUTOFF);
			saveSettings(currentUser, ChunksFinanceConstants.SECONDARY_APPROVAL_CUTOFF_DAY,secondaryapprovalcutoffValue);
			
			String secondaryapprovaltimeValue = request.getParameter(ChunksFinanceConstants.SECONDARY_APPROVAL_TIME);
			saveSettings(currentUser, ChunksFinanceConstants.SECONDARY_APPROVAL_CUTOFF_TIME,secondaryapprovaltimeValue);
			
			
		return true;
	}

	private void saveSettings(MemberDetails currentUser, String settingsName,String settingsValue ) {
		if(null != currentUser && null != settingsName && null != settingsValue) {
			
			SettingsModel settingsItem = getSettingByName(settingsName);
			Integer maxSettingsNumber = getMaxSettingsNumber();
			if(null == maxSettingsNumber) {
				maxSettingsNumber = 0;
			}else {
				++maxSettingsNumber;
			}
			if(null != settingsItem) {
				settingsItem.setSettingsName(settingsName);
				settingsItem.setSettingsValue(settingsValue);
				settingsItem.setLastUpdatedDate(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
				settingsItem.setLastUpdatedBy(currentUser.getMember());
				settingsRepository.save(settingsItem);
			}else {
				SettingsModel newSettings = new SettingsModel();
				newSettings.setSettingsName(settingsName);
				newSettings.setSettingsValue(settingsValue);
				newSettings.setLastUpdatedDate(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime());
				newSettings.setLastUpdatedBy(currentUser.getMember());
				newSettings.setNo(maxSettingsNumber);
				settingsRepository.save(newSettings);
			}
		}
	}

}

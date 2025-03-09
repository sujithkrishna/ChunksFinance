package com.finance.service;

import java.time.LocalDateTime;
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

	
	
	public boolean saveSettings(MemberDetails currenUser,SettingsModel settingModel,HttpServletRequest request) {
		
			String approvalProcessValue = request.getParameter(ChunksFinanceConstants.APPROVAL_PROCESS);
			saveSettings(currenUser, ChunksFinanceConstants.APPROVAL_PROCESS,approvalProcessValue);
			
			String secondaryLoginValue = request.getParameter(ChunksFinanceConstants.SECONDARY_LOGIN);
			saveSettings(currenUser, ChunksFinanceConstants.SECONDARY_LOGIN,secondaryLoginValue);
			
			String approvalcutoffValue = request.getParameter(ChunksFinanceConstants.APPROVAL_CUTOFF);
			saveSettings(currenUser, ChunksFinanceConstants.APPROVAL_CUTOFF_DAY,approvalcutoffValue);
			
			String approvaltimeValue = request.getParameter(ChunksFinanceConstants.APPROVAL_TIME);
			saveSettings(currenUser, ChunksFinanceConstants.APPROVAL_CUTOFF_TIME,approvaltimeValue);
			
			String expensesStatusValue = request.getParameter(ChunksFinanceConstants.EXPENSES_STATUS);
			saveSettings(currenUser, ChunksFinanceConstants.EXPENSES_STATUS,expensesStatusValue);
			
			String revenueStatusValue = request.getParameter(ChunksFinanceConstants.REVENUE_STATUS);
			saveSettings(currenUser, ChunksFinanceConstants.REVENUE_STATUS,revenueStatusValue);
			
			
		return true;
	}

	private void saveSettings(MemberDetails currenUser, String settingsName,String settingsValue ) {
		if(null != currenUser && null != settingsName && null != settingsValue) {
			
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
				settingsItem.setLastUpdatedDate(LocalDateTime.now());
				settingsItem.setLastUpdatedBy(currenUser.getMember());
				settingsRepository.save(settingsItem);
			}else {
				SettingsModel newSettings = new SettingsModel();
				newSettings.setSettingsName(settingsName);
				newSettings.setSettingsValue(settingsValue);
				newSettings.setLastUpdatedDate(LocalDateTime.now());
				newSettings.setLastUpdatedBy(currenUser.getMember());
				newSettings.setNo(maxSettingsNumber);
				settingsRepository.save(newSettings);
			}
		}
	}

}

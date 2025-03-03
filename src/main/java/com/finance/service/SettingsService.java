package com.finance.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	
	public List<SettingsModel> getAllSettings() {
        return settingsRepository.findAll();
 }

	
	
	public boolean saveSettings(MemberDetails currenUser,SettingsModel settingModel,HttpServletRequest request) {
		Integer maxSettingsNumber = getMaxSettingsNumber();
			if(null == maxSettingsNumber) {
				maxSettingsNumber = 0;
			}else {
				++maxSettingsNumber;
			}
		
		 Map<String, String> config = new HashMap<String, String>();
   	     config.put(ChunksFinanceConstants.APPROVAL_PROCESS, request.getParameter(ChunksFinanceConstants.APPROVAL_PROCESS));
   	     config.put(ChunksFinanceConstants.SECONDARY_LOGIN, request.getParameter(ChunksFinanceConstants.SECONDARY_LOGIN));
	   	  String searchTerm = "\"approvalProcess\":";
	      SettingsModel currentSettings = settingsRepository.findSettingsByApprovalProcess(searchTerm);
		   	  if(null != currentSettings) {
		   		 currentSettings.setSettings(config); 
		   	  	 currentSettings.setLastUpdatedDate(LocalDateTime.now());
		   	  	 currentSettings.setLastUpdatedBy(currenUser.getMember());
				 settingsRepository.save(currentSettings);
		   	  }else {
		   		settingModel.setNo(maxSettingsNumber);
		   		settingModel.setSettings(config); 
		   		settingModel.setLastUpdatedDate(LocalDateTime.now());
		   		settingModel.setLastUpdatedBy(currenUser.getMember());
		   		settingsRepository.save(settingModel);
		   	}
		return true;
	}

}

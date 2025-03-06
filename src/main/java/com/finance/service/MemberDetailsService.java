package com.finance.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.SecondaryLoginDisabledException;
import com.finance.model.MemberModel;
import com.finance.model.SettingsModel;
import com.finance.repository.MemberRepository;
import com.finance.repository.SettingsRepository;
import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 * 27 Feb 2025
 *
 */
@Service
public class MemberDetailsService  implements UserDetailsService {

	private final MemberRepository memberRepository;
    
	private ChunksFinancePropertyService propertyService;
	
    private SettingsService settingsService;
	
    
    public MemberDetailsService(MemberRepository memberRepository,SettingsRepository settingsRepository,ChunksFinancePropertyService propertyService,SettingsService settingsService) {
        this.memberRepository = memberRepository;
        this.propertyService=propertyService;
        this.settingsService=settingsService;
    }

    @Override
    public UserDetails loadUserByUsername(String emailId) throws UsernameNotFoundException {
    	MemberModel member = memberRepository.findByEmailId(emailId)
    		    .orElseThrow(() -> {
    		        return new UsernameNotFoundException(propertyService.getFormattedProperty(ChunksFinanceConstants.USER_NOTFOUND_ERROR,emailId));
    		    });
    	if(member.getMemberType().equals(MemberModel.MemberType.SECONDARY)) {
    		SettingsModel settingModelData =settingsService.getSettingByName("secondaryLogin");
    		String secondaryLoginStatus = null;
    		if(null != settingModelData) {
    			secondaryLoginStatus = settingModelData.getSettingsValue();
    		}
    		if(ChunksFinanceConstants.LOGIN_STATUS_NO.equals(secondaryLoginStatus)) {
    	        throw new SecondaryLoginDisabledException(propertyService.getFormattedProperty(ChunksFinanceConstants.USER_SECONDARY_LOGIN_ERROR,emailId) );
    		}
    	}
    	
    	List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_" + member.getRole()));
    	
    	 return new MemberDetails(member);
    }
}
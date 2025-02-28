package com.finance.service;


import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.finance.model.MemberModel;
import com.finance.repository.MemberRepository;
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
    
    public MemberDetailsService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String emailId) throws UsernameNotFoundException {
    	MemberModel member = memberRepository.findByEmailId(emailId)
    		    .orElseThrow(() -> {
    		        String errorMessage = "Login attempt failed for email: " + emailId + " - User not found!";
    		        return new UsernameNotFoundException(errorMessage);
    		    });
    	
    	 return new MemberDetails(member);
    }
}
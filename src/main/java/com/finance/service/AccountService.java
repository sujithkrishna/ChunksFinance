package com.finance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finance.model.AccountModel;
import com.finance.model.MemberModel;
import com.finance.repository.AccountRepository;

/**
 * @author Sujith Krishna
 *
 * 11 Mar 2025
 *
 */
@Service
public class AccountService {
	
	@Autowired
    private AccountRepository accountRepository;
	
	 public List<AccountModel> getActiveAccountsByHolder(MemberModel accountHolder) {
	        return accountRepository.findActiveAccountsByHolder(accountHolder);
	 }

}

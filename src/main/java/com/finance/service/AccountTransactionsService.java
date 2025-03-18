package com.finance.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finance.model.AccountTransactionsModel;
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;
import com.finance.repository.AccountTransactionsRepository;

/**
 * @author Sujith Krishna
 *
 * 10 Mar 2025
 *
 */
@Service
public class AccountTransactionsService {
	
	@Autowired
    private AccountTransactionsRepository accountTransactionsRepository;

    public List<AccountTransactionsModel> getTransactions(FinanceModel financeType, MemberModel accountHolderName, LocalDate paymentDate) {
        return accountTransactionsRepository.findTransactions(financeType, accountHolderName, paymentDate);
    }

    
    public List<AccountTransactionsModel> getTransactionsForDisplay(FinanceModel financeType, MemberModel accountHolderName, LocalDate paymentDate) {
        return accountTransactionsRepository.findTransactionsForDisplay(financeType, accountHolderName, paymentDate);
    }
    
    public List<AccountTransactionsModel> getPendingTransactionsForPrimaryAccount(FinanceModel financeType, LocalDate paymentDate) {
        return accountTransactionsRepository.findPendingTransactionsForPrimaryAccount(financeType, paymentDate);
    }
}

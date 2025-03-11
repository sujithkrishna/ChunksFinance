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
    private AccountTransactionsRepository repository;

    public List<AccountTransactionsModel> getTransactions(FinanceModel financeType, MemberModel accountHolderName, LocalDate paymentDate) {
        return repository.findTransactions(financeType, accountHolderName, paymentDate);
    }

}

package com.finance.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.AccountTransactionsModel;
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;

/**
 * @author Sujith Krishna
 *
 * 10 Mar 2025
 *
 */
@Repository
public interface AccountTransactionsRepository extends JpaRepository<AccountTransactionsModel, Integer> {
	
	@Query("SELECT COALESCE(MAX(a.id), 0) FROM AccountTransactionsModel a")
	Integer findMaxTransactionId();
	   
	@Query("SELECT a FROM AccountTransactionsModel a WHERE a.financeType = :financeType AND a.accountHolderName = :accountHolderName AND a.paymentDate = :paymentDate")
    List<AccountTransactionsModel> findTransactions(@Param("financeType") FinanceModel financeType, @Param("accountHolderName") MemberModel accountHolderName, @Param("paymentDate") LocalDate paymentDate);
	
	@Query("SELECT a FROM AccountTransactionsModel a WHERE a.financeType = :financeType AND a.accountHolderName = :accountHolderName AND a.paymentDate = :paymentDate AND a.totalAmount >= a.paidAmount")
    List<AccountTransactionsModel> findTransactionsForDisplay(@Param("financeType") FinanceModel financeType, @Param("accountHolderName") MemberModel accountHolderName, @Param("paymentDate") LocalDate paymentDate);
	
}

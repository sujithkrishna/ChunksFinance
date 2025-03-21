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
	   
	@Query("SELECT a FROM AccountTransactionsModel a WHERE a.financeType = :financeType AND a.accountHolderName = :accountHolderName AND a.actualPaymentDate = :actualPaymentDate")
    List<AccountTransactionsModel> findTransactions(@Param("financeType") FinanceModel financeType, @Param("accountHolderName") MemberModel accountHolderName, @Param("actualPaymentDate") LocalDate actualPaymentDate);
	
	@Query("SELECT a FROM AccountTransactionsModel a WHERE a.financeType = :financeType AND a.accountHolderName = :accountHolderName AND a.actualPaymentDate = :actualPaymentDate AND a.totalAmount >= a.paidAmount")
    List<AccountTransactionsModel> findTransactionsForDisplay(@Param("financeType") FinanceModel financeType, @Param("accountHolderName") MemberModel accountHolderName, @Param("actualPaymentDate") LocalDate actualPaymentDate);
	
	@Query("SELECT a FROM AccountTransactionsModel a WHERE a.financeType = :financeType AND a.actualPaymentDate = :actualPaymentDate AND a.totalAmount = a.paidAmount AND a.firstApprovalTime IS NULL")
	List<AccountTransactionsModel> findPendingTransactionsForPrimaryAccount(@Param("financeType") FinanceModel financeType,@Param("actualPaymentDate") LocalDate actualPaymentDate);
	
	
	@Query("SELECT a FROM AccountTransactionsModel a WHERE a.financeType = :financeType AND a.actualPaymentDate = :actualPaymentDate AND a.totalAmount = a.paidAmount AND a.firstApprovalTime IS NOT NULL AND a.secondApprovalTime IS NULL")
	List<AccountTransactionsModel> findPendingTransactionsForPrimaryAccountAdminSequential(@Param("financeType") FinanceModel financeType,@Param("actualPaymentDate") LocalDate actualPaymentDate);
	
	@Query("SELECT a FROM AccountTransactionsModel a WHERE a.financeType = :financeType AND a.actualPaymentDate = :actualPaymentDate AND a.totalAmount = a.paidAmount AND a.secondApprovalTime IS NULL")
	List<AccountTransactionsModel> findPendingTransactionsForPrimaryAccountAdminParallel(@Param("financeType") FinanceModel financeType,@Param("actualPaymentDate") LocalDate actualPaymentDate);
	
	
	@Query("SELECT a FROM AccountTransactionsModel a WHERE a.financeType = :financeType AND a.actualPaymentDate = :actualPaymentDate  AND a.firstApprovalTime IS NULL")
	List<AccountTransactionsModel> findPendingTransactionsForSecondayAccount(@Param("financeType") FinanceModel financeType,@Param("actualPaymentDate") LocalDate actualPaymentDate);
	
	
	@Query("SELECT a FROM AccountTransactionsModel a WHERE a.financeType = :financeType AND a.actualPaymentDate = :actualPaymentDate  AND a.firstApprovalTime IS NOT NULL AND a.secondApprovalTime IS NULL")
	List<AccountTransactionsModel> findPendingTransactionsForSecondayAccountAdminSequential(@Param("financeType") FinanceModel financeType,@Param("actualPaymentDate") LocalDate actualPaymentDate);
	
	@Query("SELECT a FROM AccountTransactionsModel a WHERE a.financeType = :financeType AND a.actualPaymentDate = :actualPaymentDate  AND a.secondApprovalTime IS NULL")
	List<AccountTransactionsModel> findPendingTransactionsForSecondayAccountAdminParallel(@Param("financeType") FinanceModel financeType,@Param("actualPaymentDate") LocalDate actualPaymentDate);
	
}

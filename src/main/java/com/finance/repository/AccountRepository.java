package com.finance.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.AccountModel;
import com.finance.model.MemberModel;

/**
 * @author Sujith Krishna
 *
 * 11 Mar 2025
 *
 */
@Repository
public interface AccountRepository extends JpaRepository<AccountModel, Integer> {
	
    @Query("SELECT COALESCE(MAX(a.id), 0) FROM AccountModel a")
    Integer findMaxAccountNo();

    @Query("SELECT a FROM AccountModel a WHERE a.accountHolderName = :accountHolderName AND a.currentStatus = 'ACTIVE' AND a.financeType.financeType = 'PRIMARY'")
    List<AccountModel> findPrimaryActiveAccountsByHolder(@Param("accountHolderName") MemberModel accountHolderName);
    
    @Query("SELECT a FROM AccountModel a WHERE a.accountHolderName = :accountHolderName AND a.currentStatus = 'ACTIVE' AND a.financeType.financeType = 'SECONDARY'")
    List<AccountModel> findSecondaryActiveAccountsByHolder(@Param("accountHolderName") MemberModel accountHolderName);
}

package com.finance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.finance.model.AccountModel;

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

}

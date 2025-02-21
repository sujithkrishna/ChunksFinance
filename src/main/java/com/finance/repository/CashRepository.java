package com.finance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.finance.model.CashId;
import com.finance.model.CashModel;

/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Repository
public interface CashRepository extends JpaRepository<CashModel, CashId> {

	@Query("SELECT MAX(c.cashNumber) FROM CashModel c")
    Long findMaxCashNumber();
}

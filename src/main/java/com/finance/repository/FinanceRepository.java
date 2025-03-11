package com.finance.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.FinanceModel;

/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Repository
public interface FinanceRepository extends JpaRepository<FinanceModel, Long>{
	
	@Query("SELECT MAX(f.id) FROM FinanceModel f")
    Integer findMaxNo();

	@Query("SELECT f FROM FinanceModel f ORDER BY f.loanPriorityOrderNumber ASC")
	List<FinanceModel> findAllSortedByLoanPriorityOrderNumber();
	
	@Query("SELECT f FROM FinanceModel f WHERE f.status = 'ACTIVE'")
	List<FinanceModel> findActiveFinances();
	
	@Query("SELECT f FROM FinanceModel f WHERE f.financeType = :financeType AND f.status = :status ORDER BY f.id")
    List<FinanceModel> findActivePrimaryFinances(@Param("financeType") FinanceModel.FinanceType financeType, @Param("status") FinanceModel.FinanceStatus status
    );
	
}

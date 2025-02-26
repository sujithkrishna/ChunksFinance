package com.finance.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.finance.model.FinanceModel;
import com.finance.model.FinanceModelId;

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

	//FinanceModel findByFinanceTypeAndFinanceNameAndFinanceOwnerName(String financeType, String financeName, String financeOwnerName);
	
	
}

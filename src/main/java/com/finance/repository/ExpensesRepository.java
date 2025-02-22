package com.finance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.finance.model.ExpensesId;
import com.finance.model.ExpensesModel;
import com.finance.model.RevenueId;
import com.finance.model.RevenueModel;

/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Repository
public interface ExpensesRepository extends JpaRepository<ExpensesModel, ExpensesId> {

	@Query("SELECT MAX(c.expensesNumber) FROM ExpensesModel c")
    Long findMaxExpensesNumber();
	
	List<ExpensesModel> findByCurrentStatus(String currentStatus);
	
	List<ExpensesModel> findByCurrentStatusAndApproverName(String currentStatus, String approverName);
	
	Optional<ExpensesModel> findByExpensesNumber(Long expensesNumber);
	
}

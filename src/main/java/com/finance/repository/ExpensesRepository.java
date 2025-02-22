package com.finance.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.ExpensesId;
import com.finance.model.ExpensesModel;

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
	
	@Query("SELECT e FROM ExpensesModel e WHERE e.spendDate BETWEEN :startDate AND :endDate AND (:currentStatus IS NULL OR e.currentStatus = :currentStatus) AND (:approverName IS NULL OR e.approverName = :approverName)")
	List<ExpensesModel> findExpensesByDateRangeAndStatusAndApprover(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, @Param("currentStatus") String currentStatus, @Param("approverName") String approverName);

	
}

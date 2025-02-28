package com.finance.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.finance.model.ExpensesModel;
import com.finance.model.ExpensesModel.CurrentStatus;
import com.finance.model.MemberModel;


/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Repository
public interface ExpensesRepository extends JpaRepository<ExpensesModel, Integer> {

	@Query("SELECT MAX(e.expensesNumber) FROM ExpensesModel e")
	Integer findMaxNo();

	@Query("SELECT e FROM ExpensesModel e WHERE e.spendDate BETWEEN :startDate AND :endDate AND e.currentStatus = :currentStatus AND e.firstapproverName = :firstapproverName")
	List<ExpensesModel> findExpensesByDateRangeAndStatusAndApprover(LocalDate startDate, LocalDate endDate,CurrentStatus currentStatus, MemberModel firstapproverName);

}

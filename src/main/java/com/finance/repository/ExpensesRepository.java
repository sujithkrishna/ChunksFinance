package com.finance.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.ExpensesModel;
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

	
	@Query("SELECT e FROM ExpensesModel e WHERE e.spendDate BETWEEN :startDate AND :endDate AND e.currentStatus IN (:statuses) AND e.firstapproverName = :firstapproverName AND e.firstApprovalTime IS NULL")
	List<ExpensesModel> findExpensesByDateRangeAndStatusAndApprover(@Param("startDate") LocalDate startDate,@Param("endDate") LocalDate endDate,@Param("statuses") List<ExpensesModel.CurrentStatus> statuses,@Param("firstapproverName") MemberModel firstapproverName);

	@Query("SELECT e FROM ExpensesModel e WHERE e.spendDate BETWEEN :startDate AND :endDate AND e.currentStatus IN (:statuses) AND e.secondapproverName IS NULL AND e.secondApprovalTime IS NULL")
	List<ExpensesModel> findExpensesByDateRangeAndStatusAndSuperAdminApprover(@Param("startDate") LocalDate startDate,@Param("endDate") LocalDate endDate,@Param("statuses") List<ExpensesModel.CurrentStatus> statuses);
	
	@Query("SELECT e FROM ExpensesModel e WHERE e.spendDate BETWEEN :startDate AND :endDate AND e.currentStatus IN (:statuses) AND e.secondapproverName IS NULL AND e.secondApprovalTime IS NULL AND e.firstApprovalTime IS NOT NULL")
	List<ExpensesModel> findExpensesByDateRangeAndStatusAndSuperAdminSequentialApprover(@Param("startDate") LocalDate startDate,@Param("endDate") LocalDate endDate,@Param("statuses") List<ExpensesModel.CurrentStatus> statuses);
	
	
	
}

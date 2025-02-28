package com.finance.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.finance.model.MemberModel;
import com.finance.model.RevenueModel;
import com.finance.model.RevenueModel.CurrentStatus;

/**
 * @author Sujith Krishna
 *
 *         21 Feb 2025
 *
 */
@Repository
public interface RevenueRepository extends JpaRepository<RevenueModel, Integer> {

	@Query("SELECT MAX(r.revenueNumber) FROM RevenueModel r")
	Integer findMaxNo();
	
	@Query("SELECT r FROM RevenueModel r WHERE r.spendDate BETWEEN :startDate AND :endDate AND r.currentStatus = :currentStatus AND r.firstapproverName = :firstapproverName")
	List<RevenueModel> findRevenueByDateRangeAndStatusAndApprover(LocalDate startDate, LocalDate endDate,CurrentStatus currentStatus, MemberModel firstapproverName);

}

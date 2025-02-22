package com.finance.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.RevenueId;
import com.finance.model.RevenueModel;

/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Repository
public interface RevenueRepository extends JpaRepository<RevenueModel, RevenueId> {

	@Query("SELECT MAX(c.revenueNumber) FROM RevenueModel c")
    Long findMaxRevenueNumber();
	
	List<RevenueModel> findByCurrentStatus(String currentStatus);
	
	List<RevenueModel> findByCurrentStatusAndApproverName(String currentStatus, String approverName);
	
	Optional<RevenueModel> findByRevenueNumber(Long revenueNumber);
	
	@Query("SELECT r FROM RevenueModel r WHERE r.spendDate BETWEEN :startDate AND :endDate AND (:currentStatus IS NULL OR r.currentStatus = :currentStatus) AND (:approverName IS NULL OR r.approverName = :approverName)")
		List<RevenueModel> findRevenueByDateRangeAndStatusAndApprover(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, @Param("currentStatus") String currentStatus, @Param("approverName") String approverName);

	
}

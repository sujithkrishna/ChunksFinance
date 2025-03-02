package com.finance.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.MemberModel;
import com.finance.model.RevenueModel;

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
	
	@Query("SELECT r FROM RevenueModel r WHERE r.spendDate BETWEEN :startDate AND :endDate AND r.currentStatus IN (:statuses) AND r.firstapproverName = :firstapproverName AND r.firstApprovalTime IS NULL")
	List<RevenueModel> findRevenueByDateRangeAndStatusAndApprover(@Param("startDate") LocalDate startDate,@Param("endDate") LocalDate endDate,@Param("statuses") List<RevenueModel.CurrentStatus> statuses,@Param("firstapproverName") MemberModel firstapproverName);

	@Query("SELECT r FROM RevenueModel r WHERE r.spendDate BETWEEN :startDate AND :endDate AND r.currentStatus IN (:statuses) AND r.secondapproverName IS NULL AND r.secondApprovalTime IS NULL")
	List<RevenueModel> findRevenueByDateRangeAndStatusAndSuperAdminApprover(@Param("startDate") LocalDate startDate,@Param("endDate") LocalDate endDate,@Param("statuses") List<RevenueModel.CurrentStatus> statuses);

	
    
	

}

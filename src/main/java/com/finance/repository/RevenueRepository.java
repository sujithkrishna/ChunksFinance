package com.finance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
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
	
}

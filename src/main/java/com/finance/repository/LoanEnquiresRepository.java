package com.finance.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.finance.model.LoanEnquiresModel;

/**
 * @author Sujith Krishna
 *
 * 7 Mar 2025
 *
 */
@Repository
public interface LoanEnquiresRepository extends JpaRepository<LoanEnquiresModel, Integer> {
    
	 @Query("SELECT MAX(l.id) FROM LoanEnquiresModel l")
		Integer findMaxNo();
	    @Query("SELECT l FROM LoanEnquiresModel l WHERE l.currentStatus = :currentStatus AND l.loanEnquiresDate BETWEEN :startDate AND :endDate ORDER BY l.loanEnquiresDate ASC")
	 List<LoanEnquiresModel> findByCurrentStatusAndLoanEnquiresDateBetween(LoanEnquiresModel.CurrentStatus currentStatus, LocalDate startDate, LocalDate endDate); 
	 
	 
}
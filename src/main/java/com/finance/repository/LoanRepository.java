package com.finance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.finance.model.LoanModel;

/**
 * @author Sujith Krishna
 *
 * 27 Feb 2025
 *
 */
public interface LoanRepository extends JpaRepository<LoanModel, Integer> {
    
    Optional<LoanModel> findByLoanNo(Integer loanNo);
    
    @Query("SELECT MAX(l.loanNo) FROM LoanModel l")
	Integer findMaxNo();
    
    @Query("SELECT l FROM LoanModel l WHERE l.currentStatus = :currentStatus AND l.firstapproverName.no = :firstApproverMemberNo ORDER BY l.loanDate ASC")
    List<LoanModel> findLoansByStatusAndApprover(LoanModel.CurrentStatus currentStatus, Integer firstApproverMemberNo);

   
}

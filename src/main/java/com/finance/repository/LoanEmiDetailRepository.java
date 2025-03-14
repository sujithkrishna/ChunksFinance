package com.finance.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.LoanEmiDetail;

/**
 * @author Sujith Krishna
 *
 * 9 Mar 2025
 *
 */
@Repository
public interface LoanEmiDetailRepository extends JpaRepository<LoanEmiDetail, Integer> {
	
	@Query("SELECT e FROM LoanEmiDetail e WHERE e.loan.loanReferenceName.no = :loanReferenceNo AND e.currentStatus = 'INPROGRESS' AND e.emiDate = :emiDate ORDER BY e.loan.financeType ,e.emiAmount ASC")
    List<LoanEmiDetail> findEmiDetailsByLoanReferenceNameAndStatusAndEmiDate(@Param("loanReferenceNo") Integer loanReferenceNo, @Param("emiDate") LocalDate emiDate);
}

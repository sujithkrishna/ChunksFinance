package com.finance.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.LoanEmiDetail;
import com.finance.model.MemberModel;

/**
 * @author Sujith Krishna
 *
 * 9 Mar 2025
 *
 */
@Repository
public interface LoanEmiDetailRepository extends JpaRepository<LoanEmiDetail, Integer> {
	
	@Query("SELECT e FROM LoanEmiDetail e WHERE e.loan.loanReferenceName.no = :loanReferenceNo AND e.currentStatus IN ('INPROGRESS', 'PAYMENT_INITIATED ', 'PAYMENT_SUBMITTED', 'PAYMENT_INITIAL_APPROVAL', 'PAYMENT_SECOND_APPROVAL') AND e.emiDate = :emiDate AND e.emiAmount > e.paidAmount AND e.loan.currentStatus NOT IN ('PRECLOSURE_REQUEST', 'PRECLOSURE_INITIAL_APPROVAL', 'PRECLOSURE_CLOSED') ORDER BY e.loan.financeType ,e.emiAmount ASC")
    List<LoanEmiDetail> findEmiDetailsByLoanReferenceNameAndStatusAndEmiDate(@Param("loanReferenceNo") Integer loanReferenceNo, @Param("emiDate") LocalDate emiDate);
	
	
	@Query("SELECT l FROM LoanEmiDetail l WHERE l.firstapproverName = :firstApprover AND l.currentStatus IN ('PAYMENT_SUBMITTED', 'PAYMENT_INITIAL_APPROVAL') AND l.emiAmount = l.paidAmount AND l.firstApprovalTime IS NULL AND l.loan.currentStatus NOT IN ('PRECLOSURE_REQUEST', 'PRECLOSURE_INITIAL_APPROVAL', 'PRECLOSURE_CLOSED')")
    List<LoanEmiDetail> findPaidLoanEmiDetails(@Param("firstApprover") MemberModel firstApprover);
	
	
	@Query("SELECT l FROM LoanEmiDetail l WHERE l.currentStatus IN ('PAYMENT_SUBMITTED', 'PAYMENT_INITIAL_APPROVAL')  AND l.emiAmount = l.paidAmount AND l.firstApprovalTime IS NOT NULL AND l.secondApprovalTime IS NULL AND l.loan.currentStatus NOT IN ('PRECLOSURE_REQUEST', 'PRECLOSURE_INITIAL_APPROVAL', 'PRECLOSURE_CLOSED')")
    List<LoanEmiDetail> findPaidLoanEmiDetailsForAdminSequential();
	
	@Query("SELECT l FROM LoanEmiDetail l WHERE l.currentStatus IN ('PAYMENT_SUBMITTED', 'PAYMENT_INITIAL_APPROVAL')  AND l.emiAmount = l.paidAmount AND l.secondApprovalTime IS NULL AND l.loan.currentStatus NOT IN ('PRECLOSURE_REQUEST', 'PRECLOSURE_INITIAL_APPROVAL', 'PRECLOSURE_CLOSED')")
    List<LoanEmiDetail> findPaidLoanEmiDetailsForAdminParallel();
}

package com.finance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.finance.model.LoanModel;
import com.finance.model.MemberModel;

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
    
    List<LoanModel> findByLoanApplicantName(MemberModel loanApplicantName);
    
    @Query("SELECT l FROM LoanModel l WHERE l.currentStatus IN :currentStatuses AND l.firstapproverName.no = :firstApproverMemberNo AND l.firstApprovalTime IS NULL ORDER BY l.loanDate ASC")
    List<LoanModel> findLoansByStatusesAndApprover(List<LoanModel.CurrentStatus> currentStatuses, Integer firstApproverMemberNo);
    
    
    @Query("SELECT l FROM LoanModel l WHERE l.currentStatus IN :currentStatuses AND l.secondApprovalTime IS NULL ORDER BY l.loanDate ASC")
    List<LoanModel> findLoansByStatusWithSecondApproval(List<LoanModel.CurrentStatus> currentStatuses);
    
    
    @Query("SELECT l FROM LoanModel l WHERE l.currentStatus IN :currentStatuses AND l.firstApprovalTime IS NOT NULL AND l.secondApprovalTime IS NULL ORDER BY l.loanDate ASC")
    List<LoanModel> findLoansByStatusWithBothApprovals(List<LoanModel.CurrentStatus> currentStatuses);

    @Query("SELECT l FROM LoanModel l WHERE l.loanReferenceName = :loanReferenceName AND l.loanApplicantName = :loanApplicantName AND l.currentStatus = 'INPROGRESS'")
     List<LoanModel> findInProgressLoans(@Param("loanReferenceName") MemberModel loanReferenceName,@Param("loanApplicantName") MemberModel loanApplicantName);

   
}

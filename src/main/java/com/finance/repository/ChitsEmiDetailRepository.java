package com.finance.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.ChitsEmiDetail;
import com.finance.model.ChitsModel;
import com.finance.model.LoanEmiDetail.CurrentStatus;
import com.finance.model.MemberModel;

/**
 * @author Sujith Krishna
 *
 * 6 Mar 2025
 *
 */
@Repository
public interface ChitsEmiDetailRepository extends JpaRepository<ChitsEmiDetail, Integer> {

    @Query("SELECT c FROM ChitsEmiDetail c WHERE c.currentStatus IN (:statuses) AND c.firstapproverName = :firstApprover AND c.firstApprovalTime IS NULL AND c.emiDate BETWEEN :startDate AND :endDate AND c.chits.currentStatus = :chitsStatus ORDER BY c.emiDate")
    List<ChitsEmiDetail> findPendingApprovals(@Param("statuses") List<CurrentStatus> statusList,@Param("firstApprover") MemberModel firstApprover,@Param("startDate") LocalDate startDate,@Param("endDate") LocalDate endDate,@Param("chitsStatus") ChitsModel.CurrentStatus chitsStatus);
    
     @Query("SELECT c FROM ChitsEmiDetail c WHERE c.currentStatus IN :statuses AND c.emiDate BETWEEN :startDate AND :endDate AND c.secondApprovalTime IS NULL AND c.chits.currentStatus = :chitsStatus ORDER BY c.emiDate")
     List<ChitsEmiDetail> findByStatusAndDateRangeAndSecondApprovalTimeIsNull(@Param("statuses") List<CurrentStatus> statuses,@Param("startDate") LocalDate startDate,@Param("endDate") LocalDate endDate,@Param("chitsStatus") ChitsModel.CurrentStatus chitsStatus);
     
     @Query("SELECT c FROM ChitsEmiDetail c WHERE c.currentStatus IN :statuses AND c.emiDate BETWEEN :startDate AND :endDate AND c.secondApprovalTime IS NULL AND c.firstApprovalTime IS NOT NULL AND c.chits.currentStatus = :chitsStatus ORDER BY c.emiDate")
      List<ChitsEmiDetail> findByStatusAndDateRangeAndApprovalTimes(@Param("statuses") List<CurrentStatus> statuses,@Param("startDate") LocalDate startDate,@Param("endDate") LocalDate endDate,@Param("chitsStatus") ChitsModel.CurrentStatus chitsStatus);    
}

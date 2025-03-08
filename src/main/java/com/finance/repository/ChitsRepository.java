package com.finance.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.ChitsModel;

/**
 * @author Sujith Krishna
 *
 * 28 Feb 2025
 *
 */
@Repository
public interface ChitsRepository extends JpaRepository<ChitsModel, Integer> {

	ChitsModel findByChitsNo(Integer chitsNo);
	
    @Query("SELECT COALESCE(MAX(c.chitsNo), 0) FROM ChitsModel c")
    Integer findMaxChitsNo();
    
    @Query("SELECT c FROM ChitsModel c WHERE c.financeType.financeOwner.no = :financeOwnerNo AND c.firstApprovalTime IS NULL AND c.currentStatus IN ('REQUESTED', 'INITIAL_APPROVAL')")
    List<ChitsModel> findByChitsNotApprovedANDByFinanceOwner(@Param("financeOwnerNo") Integer financeOwnerNo);
    
    @Query("SELECT c FROM ChitsModel c WHERE  c.secondApprovalTime IS NULL AND c.firstApprovalTime IS NOT NULL AND c.currentStatus IN ('REQUESTED', 'INITIAL_APPROVAL')")
    List<ChitsModel> findByChitsNotApprovedANDBySuperAdminSequential();
    
    
    @Query("SELECT c FROM ChitsModel c WHERE  c.secondApprovalTime IS NULL AND c.currentStatus IN ('REQUESTED', 'INITIAL_APPROVAL')")
    List<ChitsModel> findByChitsNotApprovedANDBySuperAdminParallel();
    
}

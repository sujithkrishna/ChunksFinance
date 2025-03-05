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

    @Query("SELECT COALESCE(MAX(c.chitsNo), 0) FROM ChitsModel c")
    Integer findMaxChitsNo();
    
    
    @Query("SELECT c FROM ChitsModel c WHERE c.financeType.financeOwner.no = :financeOwnerNo AND c.currentStatus = 'INPROGRESS'")
    List<ChitsModel> findByFinanceOwnerAndStatus(@Param("financeOwnerNo") Integer financeOwnerNo);
    
    
    @Query("SELECT c FROM ChitsModel c WHERE c.financeType.financeOwner.no = :financeOwnerNo AND c.currentStatus IN ('REQUESTED', 'INITIAL_APPROVAL')")
    List<ChitsModel> findByChitsNotApprovedANDByFinanceOwner(@Param("financeOwnerNo") Integer financeOwnerNo);
}

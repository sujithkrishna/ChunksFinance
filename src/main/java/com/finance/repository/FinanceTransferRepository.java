package com.finance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.FinanceModel;
import com.finance.model.FinanceTransferModel;
import com.finance.model.FinanceTransferModel.CurrentStatus;

/**
 * @author Sujith Krishna
 *
 * 21 Mar 2025
 *
 */
@Repository
public interface FinanceTransferRepository extends JpaRepository<FinanceTransferModel, Integer> {


    @Query("SELECT MAX(f.id) FROM FinanceTransferModel f")
    Optional<Integer> findMaxId();	
    
    @Query("SELECT f FROM FinanceTransferModel f WHERE f.currentStatus = :status AND f.sourceFinanceType = :sourceFinanceType AND f.firstApprovalTime IS NULL")
    List<FinanceTransferModel> findAllByCurrentStatusAndSourceFinanceType(@Param("status") CurrentStatus status, @Param("sourceFinanceType") FinanceModel sourceFinanceType);

    
    @Query("SELECT f FROM FinanceTransferModel f WHERE f.currentStatus = :status AND f.firstApprovalTime IS NOT NULL AND f.secondApprovalTime IS NULL")
    List<FinanceTransferModel> findAllByCurrentStatusForAdminSequential(@Param("status") CurrentStatus status);
	
    
    @Query("SELECT f FROM FinanceTransferModel f WHERE f.currentStatus = :status AND f.secondApprovalTime IS NULL")
    List<FinanceTransferModel> findAllByCurrentStatusForAdminParallel(@Param("status") CurrentStatus status);
	
}

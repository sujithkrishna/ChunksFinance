package com.finance.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.finance.model.FinanceTransferModel;

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
	
}

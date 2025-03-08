package com.finance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
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

}

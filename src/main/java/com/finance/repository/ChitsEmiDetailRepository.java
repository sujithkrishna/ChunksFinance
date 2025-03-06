package com.finance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.finance.model.ChitsEmiDetail;

/**
 * @author Sujith Krishna
 *
 * 6 Mar 2025
 *
 */
@Repository
public interface ChitsEmiDetailRepository extends JpaRepository<ChitsEmiDetail, Integer> {
	

}

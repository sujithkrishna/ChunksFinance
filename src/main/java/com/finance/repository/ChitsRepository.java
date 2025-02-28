package com.finance.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
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
}

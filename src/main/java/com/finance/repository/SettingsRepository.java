package com.finance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.finance.model.MemberModel;
import com.finance.model.SettingsModel;

/**
 * @author Sujith Krishna
 *
 * 3 Mar 2025
 *
 */
@Repository
public interface SettingsRepository extends JpaRepository<SettingsModel, Integer> {
    
	List<SettingsModel> findByLastUpdatedBy(MemberModel member);
	
	 @Query("SELECT COALESCE(MAX(s.no), 0) FROM SettingsModel s")
	 Integer findMaxSettingsNo();
	 
	 Optional<SettingsModel> findBySettingsName(String settingsName);
	 
}
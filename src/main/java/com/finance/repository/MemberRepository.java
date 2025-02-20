package com.finance.repository;

import org.springframework.stereotype.Repository;

import com.finance.model.MemberModel;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Repository
public interface MemberRepository extends JpaRepository<MemberModel, Integer> {

	
	List<MemberModel> findByMemberType(String memberType);
	
}

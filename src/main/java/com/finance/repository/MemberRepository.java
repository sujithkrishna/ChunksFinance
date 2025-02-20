package com.finance.repository;

import org.springframework.stereotype.Repository;

import com.finance.model.MemberModel;
import com.finance.model.MemberModel.MemberId;

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
public interface MemberRepository extends JpaRepository<MemberModel, MemberId> {

	// This method will now use the embedded ID's memberType field
    List<MemberModel> findByIdMemberType(String memberType);

    // Example of a custom query using the embedded ID fields
    @Query("SELECT m FROM MemberModel m WHERE m.id.memberType = :memberType AND m.id.memberName = :memberName")
    List<MemberModel> findByMemberTypeAndMemberName(@Param("memberType") String memberType, @Param("memberName") String memberName);

    // Example of a query to find members by emailId
    List<MemberModel> findByEmailId(String emailId);
    
    boolean existsByEmailId(String emailId);
    
	
}

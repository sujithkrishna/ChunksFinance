package com.finance.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.finance.model.MemberModel;
/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Repository
public interface MemberRepository extends JpaRepository<MemberModel, Integer> {
	
	@Query("SELECT MAX(m.no) FROM MemberModel m")
    Integer findMaxNo();

    Optional<MemberModel> findByEmailId(String emailId);
    
    Optional<MemberModel> findByMemberName(String memberName);
        
    List<MemberModel> findByMemberType(MemberModel.MemberType memberType);
    
    @Query("SELECT m FROM MemberModel m WHERE m.referenceMember = :referenceMember AND m.memberType = 'SECONDARY'")
    List<MemberModel> findSecondaryMembers(@Param("referenceMember") MemberModel referenceMember);
    
}

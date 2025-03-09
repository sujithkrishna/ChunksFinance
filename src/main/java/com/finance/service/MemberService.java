package com.finance.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.DuplicateMemberEmailIdException;
import com.finance.model.MemberModel;
import com.finance.repository.MemberRepository;
import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 *         20 Feb 2025
 *
 */
@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean  createMember(MemberModel member) {
		String emailId = member.getEmailId();
		Optional<MemberModel> existingMember = memberRepository.findByEmailId(emailId);
		if(existingMember.isPresent()) {
			throw new DuplicateMemberEmailIdException();
		}else {
				try {
					String encodedPassword = passwordEncoder.encode(member.getPassword());
				    member.setPassword(encodedPassword);
				} catch (Exception e) {
					e.printStackTrace();
				}
				Integer currentValue = getMaxMemberNo();
				member.setNo(++currentValue);
				if(member.getMemberType().equals(MemberModel.MemberType.PRIMARY)) {
					member.setUserType(null);
				}
				memberRepository.save(member);
		}
		return true;
	}
	
	public void loadPrimaryMemCurrentUser(Model model,MemberDetails currenUserDetails) {
		List<MemberModel> primaryMembers = getAllPrimaryMemeber();
        model.addAttribute(ChunksFinanceConstants.PRIMARY_MEMBERS, primaryMembers);
        if (currenUserDetails != null) {
            MemberModel currentUser = currenUserDetails.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}	
	}
	
	
	
	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public Integer getMaxMemberNo() {
        return memberRepository.findMaxNo();
    }
	
	public List<MemberModel> getAllPrimaryMemeber() {
		List<MemberModel> primaryMembers = memberRepository.findByMemberType(MemberModel.MemberType.PRIMARY);
		return primaryMembers;
	}
	
	public List<MemberModel> getAllSecondaryMemeber() {
		List<MemberModel> secondaryMembers = memberRepository.findByMemberType(MemberModel.MemberType.SECONDARY);
		return secondaryMembers;
	}
	

}

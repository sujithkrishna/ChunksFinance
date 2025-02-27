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

import com.finance.exception.DuplicateMemberEmailIdException;
import com.finance.model.MemberModel;
import com.finance.repository.MemberRepository;

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
				memberRepository.save(member);
		}
		return true;
	}
	
	public void loadPrimaryMemCurrentUser(Model model) {
		List<MemberModel> primaryMembers = getAllPrimaryMemeber();
        model.addAttribute("primaryMembers", primaryMembers);
		model.addAttribute("currentUser", "NULL");
	}
	
	
	
	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public Integer getMaxMemberNo() {
        return memberRepository.findMaxNo();
    }
	
	public List<MemberModel> getAllPrimaryMemeber() {
		List<MemberModel> primaryMembers = memberRepository.findByMemberType(MemberModel.MemberType.PRIMARY);
		return primaryMembers;
	}
	
	public List<String> getAllSecondaryMemeber() {
		/*
		List<MemberModel> secondaryMembersMemMdl = memberRepository.findAllSecondaryMembers();
		List<String> secondaryMembers = new ArrayList<String>();
		for (MemberModel memberModel : secondaryMembersMemMdl) {
			secondaryMembers.add(memberModel.getId().getMemberName());
		}
		return secondaryMembers;
		*/
		return null;
	}
	
	
	public List<String> getEligibleLoanMembers() {
		/*
		List<MemberModel> primaryMembersMemMdl = memberRepository.findAllPrimaryMembers();
		List<MemberModel> secondaryMembersMemMdl = memberRepository.findAllSecondaryMembers();
		List<String> eligibleLoanMembers = new ArrayList<String>();
		for (MemberModel memberModel : primaryMembersMemMdl) {
			eligibleLoanMembers.add(memberModel.getId().getMemberName());
		}
		for (MemberModel memberModel : secondaryMembersMemMdl) {
			eligibleLoanMembers.add(memberModel.getId().getMemberName());
		}
		return eligibleLoanMembers;
		*/
		return null;
	}
	

}

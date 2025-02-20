package com.finance.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.DuplicateMemberEmailIdException;
import com.finance.exception.DuplicateMemberTypeNameException;
import com.finance.model.MemberModel;
import com.finance.model.MemberModel.MemberId;
import com.finance.repository.MemberRepository;
import com.finance.security.AESEncryptionUtil;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 *         20 Feb 2025
 *
 */
@Service
public class MemberService {

	@Autowired
	private MemberRepository memeberRepository;

	@Autowired
	private AESEncryptionUtil encryptionUtil;

	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean createMember(HttpServletRequest request, MemberModel member) {
		
		MemberId mId = new MemberId();
		mId.setMemberName(request.getParameter(ChunksFinanceConstants.MEMBER_NAME));
		mId.setMemberType(request.getParameter(ChunksFinanceConstants.MEMBER_TYPE));
		member.setId(mId);
		
		String email = member.getEmailId();
		Boolean emailPressent = memeberRepository.existsByEmailId(email);
		if (emailPressent) {
			throw new DuplicateMemberEmailIdException();
		}
		List<MemberModel> memberPresent = memeberRepository.findByMemberTypeAndMemberName(member.getId().getMemberType(),member.getId().getMemberName());
		if(memberPresent.size()>0) {
			throw new DuplicateMemberTypeNameException();
		}
		try {
			member.setPassword(encryptionUtil.encrypt(member.getPassword()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (null == member.getReferenceMember()) {
			member.setReferenceMember(ChunksFinanceConstants.PRIMARY);
		}
		
		try {
			memeberRepository.save(member);
			return true;
		} catch (Exception exception) {
			return false;
		}
	}

	public List<String> getAllPrimaryMemeber() {
		List<MemberModel> primaryMembersMemMdl = memeberRepository.findByIdMemberType(ChunksFinanceConstants.PRIMARY);
		List<String> primaryMembers = new ArrayList<String>();
		for (MemberModel memberModel : primaryMembersMemMdl) {
			primaryMembers.add(memberModel.getId().getMemberName());
		}
		return primaryMembers;
	}

}

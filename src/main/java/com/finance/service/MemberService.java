package com.finance.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.MemberModel;
import com.finance.repository.MemberRepository;
import com.finance.security.AESEncryptionUtil;
/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Service
public class MemberService {
	
	
	

	@Autowired
    private MemberRepository memeberRepository;
	
	@Autowired
	private AESEncryptionUtil encryptionUtil;
	
	public boolean createMember(MemberModel member) {
		try {
			member.setPassword(encryptionUtil.encrypt(member.getPassword()));
			if(null == member.getReferenceMember()) {
				member.setReferenceMember(ChunksFinanceConstants.PRIMARY);
			}
			memeberRepository.save(member);
			return true;
		}catch(Exception exception) {
			return false;
		}
	}
	
	public List<String> getAllPrimaryMemeber(){
		List<MemberModel> primaryMembersMemMdl = memeberRepository.findByMemberType(ChunksFinanceConstants.PRIMARY);
		List<String> primaryMembers = new ArrayList<String>(); 
		for (MemberModel memberModel : primaryMembersMemMdl) {
			primaryMembers.add(memberModel.getMemberName());
		}
		return primaryMembers;
	}
	

}

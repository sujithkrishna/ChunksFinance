package com.finance.service;

import java.math.BigDecimal;
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
import com.finance.model.AccountModel;
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;
import com.finance.repository.AccountRepository;
import com.finance.repository.FinanceRepository;
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
	private FinanceRepository financeRepository;
	
	@Autowired
	private AccountRepository accountRepository;

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
				// Adding Primary members to Primary Finance Account
				if(MemberModel.MemberType.PRIMARY.equals(member.getMemberType())) {
					// Find all the primary Finance
					List<FinanceModel> finModels = financeRepository.findActivePrimaryFinances( FinanceModel.FinanceType.PRIMARY,FinanceModel.FinanceStatus.ACTIVE);
					Integer currentAccountMaxId = accountRepository.findMaxAccountNo();
					++currentAccountMaxId;
					for (FinanceModel financeModel : finModels) {
						AccountModel aModel = new AccountModel();
						aModel.setId(currentAccountMaxId++);
						aModel.setAccountHolderName(member);
						aModel.setFinanceType(financeModel);
						aModel.setCurrentBalance(BigDecimal.ZERO);
						aModel.setBalanceIncludingInterest(BigDecimal.ZERO);
						accountRepository.save(aModel);
					}
					
				}
				
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
	
	public List<MemberModel> getSecondaryMembers(MemberModel referenceMember) {
	    return memberRepository.findSecondaryMembers(referenceMember);
	}
	

}

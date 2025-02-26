package com.finance.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.exception.PasswordWrongException;
import com.finance.exception.UserNotFoundException;
import com.finance.model.CurrentUser;
import com.finance.model.MemberModel;
import com.finance.repository.MemberRepository;
import com.finance.security.Base64EncryptionUtil;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Service
public class LoginService {
	
	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private Base64EncryptionUtil encryptionUtil;
	
	@Autowired
	private CurrentUser currentUser;
	
	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean validateLogin(HttpServletRequest request, MemberModel member) {
		Optional<MemberModel> user= memberRepository.findByEmailId(member.getEmailId());
		 String decryptedStoredPassword = null;
		if (user.isPresent()) {
			try {
				decryptedStoredPassword = encryptionUtil.decrypt(user.get().getPassword());
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (decryptedStoredPassword != null && decryptedStoredPassword.equals(member.getPassword())) {
				System.out.println("User Login is sucessfull---"+member.toString()+"At :"+LocalDate.now());
				populateCurrentUser(currentUser,user.get());
			    return true;
			} else {
			    throw new PasswordWrongException();
			}
		} else {
			return false;
		}
		
	}
	
	public void populateCurrentUser(CurrentUser currentUser,MemberModel member) {
		currentUser.setLoggedIn(true);
		currentUser.setEmailId(member.getEmailId());
		currentUser.setPassword(member.getPassword());
		currentUser.setMemberType(member.getMemberType().name());
		currentUser.setMemberName(member.getMemberName());
		if(null != member.getReferenceMember()) {
			currentUser.setReferenceMember(member.getReferenceMember().getMemberName());	
		}else{
			currentUser.setReferenceMember(null);
		}
		currentUser.setMemberDOB(member.getMemberDOB());
		currentUser.setMobileNumber(member.getMobileNumber());
		currentUser.setAddress1(member.getAddress1());
		currentUser.setPlace(member.getPlace());
		currentUser.setTaluk(member.getTaluk());
		currentUser.setDistrict(member.getDistrict());
		currentUser.setState(member.getState());
		currentUser.setPincode(member.getPincode());
		currentUser.setCurrentUser(member);
	
	}

}

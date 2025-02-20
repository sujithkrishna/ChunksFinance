package com.finance.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public boolean validateLogin(HttpServletRequest request, MemberModel member) {
	
		List<MemberModel> user= memberRepository.findByEmailId(member.getEmailId());
		if(user.size()==0) {
			throw new UserNotFoundException();
		}else if(user.size()==1) {
		        String decryptedStoredPassword = null;
			try {
				decryptedStoredPassword = encryptionUtil.decrypt(user.get(0).getPassword());
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (decryptedStoredPassword != null && decryptedStoredPassword.equals(member.getPassword())) {
				populateCurrentUser(currentUser,user.get(0));
			    return true;
			} else {
			    throw new PasswordWrongException();
			}
		}else {
			System.out.println("Mutiple Users are getting....");
			return false;
		}
	}
	
	public void populateCurrentUser(CurrentUser currentUser,MemberModel member) {
		currentUser.setLoggedIn(true);
		currentUser.setEmailId(member.getEmailId());
		currentUser.setPassword(member.getPassword());
		currentUser.setMemberType(member.getId().getMemberType());
		currentUser.setMemberName(member.getId().getMemberName());
		currentUser.setReferenceMember(member.getReferenceMember());
		currentUser.setMemberDOB(member.getMemberDOB());
		currentUser.setMobileNumber(member.getMobileNumber());
		currentUser.setAddress1(member.getAddress1());
		currentUser.setPlace(member.getPlace());
		currentUser.setTaluk(member.getTaluk());
		currentUser.setDistrict(member.getDistrict());
		currentUser.setState(member.getState());
		currentUser.setPincode(member.getPincode());		
	}

}

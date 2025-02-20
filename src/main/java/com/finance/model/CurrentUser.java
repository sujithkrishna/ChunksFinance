package com.finance.model;

import java.time.LocalDate;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

import lombok.Data;
import lombok.ToString;

/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Component
@SessionScope
@Data
@ToString
public class CurrentUser {
	
    private String emailId;
    private String password;
    private String memberType;
    private String memberName;
    private String referenceMember;
    private LocalDate memberDOB;
    private String mobileNumber;
    private String address1;
    private String place;
    private String taluk;
    private String district;
    private String state;
    private String pincode;
    private boolean isLoggedIn;
    
}

package com.finance.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Data
@Entity
@ToString
@Table(name = "member") // Optional: Specify table name if different
public class MemberModel {
	
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-increment for databases like MySQL
    @Column(name = "member_id") // Map to the correct column name if different in DB
	private int memberId;
	
	@Column(name = "member_type", nullable = false)
	private String memberType;
	
	@Column(name = "member_name", nullable = false)
	private String memberName;
	
	@Column(name = "reference_member")
	private String referenceMember;
	
	@Column(name = "memeber_dob")
	private LocalDate memberDOB;
	
	@Column(name = "mobile_number")
	private String mobileNumber;
	
	@Column(name = "login", nullable = false)
	private String emailId;
	
	@Column(name = "password", nullable = false)
	private String password;
	
	@Column(name = "address1")
	private String address1;
	
	@Column(name = "place")
	private String place;
	
	@Column(name = "taluk")
	private String taluk;
	
	@Column(name = "district")
	private String district;
	
	@Column(name = "state")
	private String state;
	
	@Column(name = "pincode")
	private String pincode;
	
}

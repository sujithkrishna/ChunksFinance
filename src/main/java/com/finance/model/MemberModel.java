package com.finance.model;

import java.io.Serializable;
import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
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
@Table(name = "member", uniqueConstraints = {
	    @UniqueConstraint(columnNames = "emailId") // Ensure emailId is unique
	})
public class MemberModel {
	
	
	@EmbeddedId
    private MemberId id;

    @Column(name = "reference_member")
    private String referenceMember;

    @Column(name = "memeber_dob")
    private LocalDate memberDOB;

    @Column(name = "mobile_number")
    private String mobileNumber;

    @Column(name = "email_id", nullable = false, unique = true)
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
    
    @Embeddable
    @Data
    public static class MemberId implements Serializable {
        private static final long serialVersionUID = 1L;

        @Column(name = "member_type", nullable = false)
        private String memberType;

        @Column(name = "member_name", nullable = false)
        private String memberName;

    }
	
}

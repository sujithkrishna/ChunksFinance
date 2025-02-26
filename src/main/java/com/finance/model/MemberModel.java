package com.finance.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import jakarta.persistence.Version;
import lombok.Data;
/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Data
@Entity
@Table(name = "members",
    uniqueConstraints = {
        @UniqueConstraint(columnNames = "emailId"),
        @UniqueConstraint(
            name = "uniq_member_composite",
            columnNames = {"memberName", "memberType", "reference_member_no"}
        )
    })
public class MemberModel {

    public enum MemberType {
        PRIMARY, SECONDARY
    }

    @Id
    @Column(nullable = false)
    private Integer no;

    @Column(nullable = false)
    private String memberName;

    @Column(name = "email_id",nullable = false, unique = true)
    private String emailId;

    @Column(name = "password", nullable = false)
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private MemberType memberType;

    @ManyToOne
    @JoinColumn(name = "reference_member_no")
    private MemberModel referenceMember;

    @Column(name = "member_dob")
    private LocalDate memberDOB;

    @Column(name = "mobile_number")
    private String mobileNumber;

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
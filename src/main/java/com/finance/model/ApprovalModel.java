package com.finance.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Data
@Entity
@Table(name = "approval")
public class ApprovalModel {
	
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // This is for ApprovalModel's primary key
    private Long approvalId;
    
    @Column(name = "approval_type", nullable = false)
    private String approvalType;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "revenue_number", referencedColumnName = "revenue_number", nullable = false)
    private RevenueModel revenueModel; 
    
    @Column(name = "approval_status", nullable = false)
    private String approvalStatus;

    @Column(name = "approver_name", nullable = false)
    private String approverName;

    @Column(name = "approval_date", nullable = false)
    private LocalDate approvalDate;

}

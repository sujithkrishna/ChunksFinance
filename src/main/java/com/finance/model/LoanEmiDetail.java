package com.finance.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

/**
 * @author Sujith Krishna
 *
 * 27 Feb 2025
 *
 */
@Entity
@Table(name = "loan_emi_detail")
@Data
@ToString(exclude = "loan") // Add this
public class LoanEmiDetail {

	public enum CurrentStatus {
		REQUESTED, 
		INITIAL_APPROVAL,
	    INPROGRESS, 
	    PAYMENT_INITIATED,
	    PAYMENT_SUBMITTED,
	    PAYMENT_INITIAL_APPROVAL,
	    PAYMENT_SECOND_APPROVAL,
	    PAID,   
	    PRECLOSE,   
	}
    
	@Id
	@Column(name = "emi_id")
	private Integer id;
	 
    @Column(name = "emi_number")
    private Integer emiNumber;  // 1-17
    
    @Column(name = "paid_on_time")
    private Boolean paidOnTime;
    
    @Column(name = "payment_date_time")
    private LocalDateTime paymentDateAndTime;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "current_status", nullable = false)
    private CurrentStatus currentStatus = CurrentStatus.REQUESTED;       
    
    @Column(name = "emi_date")
    private LocalDate emiDate;    

    @Column(name = "emi_amount", precision = 19, scale = 2)
    private BigDecimal emiAmount;
    
    @Column(name = "paid_amount", precision = 19, scale = 2)
    private BigDecimal paidAmount;    

    @ManyToOne
    @JoinColumn(name = "loan_no", referencedColumnName = "loan_no")
    private LoanModel loan;
    
    @ManyToOne
    @JoinColumn(name = "first_approver_member_no", referencedColumnName = "no")
    private MemberModel firstapproverName;
    
    @ManyToOne
    @JoinColumn(name = "second_approver_member_no", referencedColumnName = "no")
    private MemberModel secondapproverName;
    
    @Column(name = "first_approval_date_time")
    private LocalDateTime firstApprovalTime;
    
    @Column(name = "second_approval_date_time")
    private LocalDateTime secondApprovalTime;
    
}

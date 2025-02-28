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

/**
 * @author Sujith Krishna
 *
 * 27 Feb 2025
 *
 */
@Entity
@Table(name = "loan_emi_detail")
@Data
public class LoanEmiDetail {

	public enum CurrentStatus {
	    INPROGRESS,  // Note: Just created
	    PAID,   // Note: First Approval
	    PRECLOSE,   // Note: First Approval Rejected
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
    private CurrentStatus currentStatus = CurrentStatus.INPROGRESS;       
    
    @Column(name = "emi_date")
    private LocalDate emiDate;    

    @Column(name = "amount", precision = 19, scale = 2)
    private BigDecimal amount;

    @ManyToOne
    @JoinColumn(name = "loan_no", referencedColumnName = "loan_no")
    private LoanModel loan;
    
    @ManyToOne
    @JoinColumn(name = "first_approver_member_no", referencedColumnName = "no")
    private MemberModel firstapproverName;
    
    @ManyToOne
    @JoinColumn(name = "second_approver_member_no", referencedColumnName = "no")
    private MemberModel secondapproverName;
    
    
}

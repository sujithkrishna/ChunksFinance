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
 * 28 Feb 2025
 *
 */
@Entity
@Table(name = "chits_emi_detail")
@ToString(exclude = {"chits"}) 
@Data
public class ChitsEmiDetail {

	public enum CurrentStatus {
		REQUESTED, 
	    INPROGRESS, 
	    INITIAL_APPROVAL,
	    PAID  
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

    @Column(name = "amount", precision = 19, scale = 2)
    private BigDecimal amount;

    @ManyToOne
    @JoinColumn(name = "chits_no", referencedColumnName = "chits_no")
    private ChitsModel chits;
    
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

package com.finance.model;

import java.math.BigDecimal;
import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;

/**
 * @author Sujith Krishna
 *
 * 7 Mar 2025
 *
 */
@Entity
@Table(name = "loan_enquires")
@Data
public class LoanEnquiresModel {
	
	public enum CurrentStatus {
	        OPEN,
	        CLOSE
	}
	
	@Id
	@Column(name = "loan_enquires_id")
	private Integer id;
	
    @ManyToOne
    @JoinColumn(name = "loan_enquires_reference_name", referencedColumnName = "no")       
    private MemberModel loanEnquiresReferenceName;
    
    @Column(name = "loan_enquires_date")
    private LocalDate loanEnquiresDate;
    
    @Column(name = "enquires_applicant_name")
    private String applicantName;

    @Column(name = "loan_amount", precision = 19, scale = 2)
    private BigDecimal loanAmount;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "current_status", nullable = false)
    private CurrentStatus currentStatus = CurrentStatus.OPEN;
    
    @Transient
    private boolean status;

}

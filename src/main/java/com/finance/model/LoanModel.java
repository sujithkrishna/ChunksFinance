package com.finance.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

/**
 * @author Sujith Krishna
 *
 * 22 Feb 2025
 *
 */
@Data
@Entity
@ToString(exclude = "emiDetails") // Add this
@Table(name = "loan")
public class LoanModel {
	
    public enum CurrentStatus {
        REQUESTED,  
        INITIAL_APPROVAL,  
        REJECTED,   
        INPROGRESS,    
        CLOSED,
        PRE_REQUEST,
        PRE_REQUEST_INITIAL_APPROVAL,
        PRE_CLOSED,
    }	
   
    @Id
    @Column(name = "loan_no", unique = true)
    private Integer loanNo;
    
    @ManyToOne
    @JoinColumn(name = "finance_id", referencedColumnName = "id")
    private FinanceModel financeType;
    
    @ManyToOne
    @JoinColumn(name = "loan_reference_name", referencedColumnName = "no")       
    private MemberModel loanReferenceName;

    @ManyToOne
    @JoinColumn(name = "loan_applicant_name", referencedColumnName = "no")    
    private MemberModel loanApplicantName;

    @Column(name = "loan_amount", precision = 19, scale = 2)
    private BigDecimal loanAmount;

    @Column(name = "loan_date")
    private LocalDate loanDate;
    
    @Column(name = "loan_start_date")
    private LocalDate loanStartDate;
    
    @Column(name = "loan_end_date")
    private LocalDate loanEndDate;
    
    @Column(name = "loan_preclosure_date")
    private LocalDate loanPreclosureDate;

    // Disbursement section
    @Column(name = "disbursement_amount", precision = 19, scale = 2)
    private BigDecimal disbursementAmount;
    
    @Column(name = "interest_amount", precision = 19, scale = 2)
    private BigDecimal interestAmount;
    
    @Column(name = "received_amount", precision = 19, scale = 2)
    private BigDecimal receivedAmount;
    
    @Column(name = "remaining_balance", precision = 19, scale = 2)
    private BigDecimal remainingBalance;
    
    @Column(name = "preclosure_amount", precision = 19, scale = 2)
    private BigDecimal preclosureAmount;
    
    
    @Enumerated(EnumType.STRING)
    @Column(name = "current_status", nullable = false)
    private CurrentStatus currentStatus = CurrentStatus.REQUESTED;    

    // EMI Details (1-17 EMIs)
    @OneToMany(mappedBy = "loan", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<LoanEmiDetail> emiDetails;
    
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


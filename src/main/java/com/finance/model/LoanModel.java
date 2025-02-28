package com.finance.model;

import java.math.BigDecimal;
import java.time.LocalDate;
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
@ToString
@Table(name = "loan")
public class LoanModel {
	
    public enum CurrentStatus {
        REQUESTED,  // Note: Just created
        APPROVED,   // Note: First Approval
        REJECTED,   // Note: First Approval Rejected
        ISSUED,    // Note: Second Approval Granted
        CLOSED,
        PRE_CLOSED,
    }	
   
    @Id
    @Column(name = "loan_no", unique = true)
    private Integer loanNo;
    
    @ManyToOne
    @JoinColumn(name = "finance_id", referencedColumnName = "id")
    private FinanceModel financeType;
    
    @Column(name = "loan_reference_name")
    private String loanReferenceName;

    @Column(name = "loan_applicant_name")
    private String loanApplicantName;

    @Column(name = "loan_amount", precision = 19, scale = 2)
    private BigDecimal loanAmount;

    @Column(name = "loan_date")
    private LocalDate loanDate;
    
    @Column(name = "loan_repayment_date")
    private LocalDate loanRepaymentDate;

    // Disbursement section
    @Column(name = "disbursement_amount", precision = 19, scale = 2)
    private BigDecimal disbursementAmount;
    
    @Column(name = "interest_amount", precision = 19, scale = 2)
    private BigDecimal interestAmount;
    
    @Column(name = "received_amount", precision = 19, scale = 2)
    private BigDecimal receivedAmount;
    
    @Column(name = "yet_to_receive_amount", precision = 19, scale = 2)
    private BigDecimal yetToReceiveAmount;
    
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
    
}


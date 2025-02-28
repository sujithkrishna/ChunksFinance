package com.finance.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
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
   
    @Id
    @Column(name = "loan_no", unique = true)
    private Integer loanNo;
    
    @Column(name = "loan_reference_name")
    private String loanReferenceName;

    @Column(name = "loan_applicant_name")
    private String loanApplicantName;

  
    @Column(name = "loan_amount", precision = 19, scale = 2)
    private BigDecimal loanAmount;

    @Column(name = "loan_date")
    private LocalDate loanDate;

    // Disbursement section
    @Column(name = "disbursement_amount", precision = 19, scale = 2)
    private BigDecimal disbursementAmount;
    
    @Column(name = "interest_amount", precision = 19, scale = 2)
    private BigDecimal interestAmount;
    
    @Column(name = "received_amount", precision = 19, scale = 2)
    private BigDecimal receivedAmount;
    
    @Column(name = "yet_to_receive_amount", precision = 19, scale = 2)
    private BigDecimal yetToReceiveAmount;

    // EMI Details (1-17 EMIs)
    @OneToMany(mappedBy = "loan", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<EmiDetail> emiDetails;
}


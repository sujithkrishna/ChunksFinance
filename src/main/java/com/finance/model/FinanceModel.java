package com.finance.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@ToString(exclude = {"loans"})
@Entity
@Table(name = "finance",
uniqueConstraints = {
    @UniqueConstraint(
        name = "uniq_finance_composite",
        columnNames = {"finance_type", "finance_name", "finance_owner_no"}
    )
})
public class FinanceModel {

    public enum FinanceType {
        PRIMARY, SECONDARY
    }
    
    public enum FinanceStatus {
        ACTIVE, CLOSED
    }

    @Id
    @Column(nullable = false)
    private Integer id;

    @Enumerated(EnumType.STRING)
    @Column(name = "finance_type", nullable = false)
    private FinanceType financeType;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private FinanceStatus status  = FinanceStatus.ACTIVE;

    @Column(name = "finance_name", nullable = false)
    private String financeName;

    @ManyToOne
    @JoinColumn(name = "finance_owner_no", referencedColumnName = "no")
    private MemberModel financeOwner;

    @Column(name = "finance_creationdate", nullable = false)
    private LocalDate financeCreationDate;

    @Column(name = "finance_amount")
    private Double financeAmount;

    @Column(name = "current_balance")
    private Double currentBalance;
    
    @Column(name = "loan_priority_order_number")
    private Integer loanPriorityOrderNumber;

    @Column(name = "interest_amount")
    private Double interestAmount;
    
}
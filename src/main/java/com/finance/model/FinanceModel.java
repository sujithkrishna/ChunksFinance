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

/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Data
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

    @Id
    @Column(nullable = false)
    private Integer id;

    @Enumerated(EnumType.STRING)
    @Column(name = "finance_type", nullable = false)
    private FinanceType financeType;

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

    
}
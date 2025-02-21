package com.finance.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
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
@Entity
@ToString
@Table(name = "finance")
@IdClass(FinanceModelId.class) // Specify the composite key class
public class FinanceModel {

    @Id
    @Column(name = "finance_type", nullable = false)
    private String financeType;

    @Id
    @Column(name = "finance_name", nullable = false)
    private String financeName;

    @Id
    @Column(name = "finance_ownername", nullable = false)
    private String financeOwnerName;

    @Column(name = "finance_creationdate", nullable = false)
    private LocalDate financeCreationDate;

    @Column(name = "finance_amount")
    private Double financeAmount;

    @Column(name = "current_balance")
    private Double currentBalance;
}

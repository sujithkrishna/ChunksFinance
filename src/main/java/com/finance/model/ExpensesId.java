package com.finance.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Data
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class ExpensesId implements Serializable {

    @Id
    @Column(name = "expenses_number")
    private Long expensesNumber;

    @Id
    @Column(name = "finance_type")
    private String financeType;

    @Id
    @Column(name = "spender_name")
    private String spenderName;
}
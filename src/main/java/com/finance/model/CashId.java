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
public class CashId implements Serializable {

    @Id
    @Column(name = "cash_number")
    private Long cashNumber;

    @Id
    @Column(name = "finance_type")
    private String financeType;

    @Id
    @Column(name = "spender_name")
    private String spenderName;
}
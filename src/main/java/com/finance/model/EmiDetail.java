package com.finance.model;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

/**
 * @author Sujith Krishna
 *
 * 27 Feb 2025
 *
 */
@Entity
@Table(name = "emi_detail")
@Data
public class EmiDetail {

	@Id
	@Column(name = "emi_id")
	private Integer id;
	 

    @Column(name = "emi_number")
    private Integer emiNumber;  // 1-17

    @Column(name = "amount", precision = 19, scale = 2)
    private BigDecimal amount;

    @ManyToOne
    @JoinColumn(name = "loan_no", referencedColumnName = "loan_no")
    private LoanModel loan;
}

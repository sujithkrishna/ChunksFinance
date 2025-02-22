package com.finance.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Data
@Entity
@ToString
@Table(name = "expenses")
@IdClass(ExpensesId.class) // Specify the composite key class
public class ExpensesModel {

	 	@Id
	    @Column(name = "expenses_number", nullable = false)
	    private Long expensesNumber;

	    @Id
	    @Column(name = "finance_type", nullable = false)
	    private String financeType;

	    @Id
	    @Column(name = "spender_name", nullable = false)
	    private String spenderName;

	    @Column(name = "spender_details", nullable = false)
	    private String spenderDetails;

	    @Column(name = "spend_date", nullable = false)
	    private LocalDate spendDate;

	    @Column(name = "spend_amount", nullable = false)
	    private Double spendAmount;

	    @Column(name = "current_status", nullable = false)
	    private String currentStatus;

	    @Column(name = "approver_name")
	    private String approverName;
    
}

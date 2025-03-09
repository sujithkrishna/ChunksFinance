package com.finance.model;

import java.math.BigDecimal;

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
 * 10 Mar 2025
 *
 */
@Data
@Entity
@Table(name = "account",uniqueConstraints = @UniqueConstraint(columnNames = {"account_holder_name", "finance_id"}))
public class AccountModel {
	
    public enum CurrentStatus {
        ACTIVE,  
        CLOSED
    }
    
	@Id
	@Column(name = "account_id")
	private Integer id;
	
    @ManyToOne
    @JoinColumn(name = "account_holder_name", referencedColumnName = "no")    
    private MemberModel accountHolderName;
    
    @ManyToOne
    @JoinColumn(name = "finance_id", referencedColumnName = "id")
    private FinanceModel financeType;    
    
    @Enumerated(EnumType.STRING)
    @Column(name = "current_status", nullable = false)
    private CurrentStatus currentStatus = CurrentStatus.ACTIVE;   
    
    @Column(name = "balance_amount", precision = 19, scale = 2)
    private BigDecimal currentBalance;    
    
    @Column(name = "balance_amount_including_interest", precision = 19, scale = 2)
    private BigDecimal balanceIncludingInterest; 
    
        

}

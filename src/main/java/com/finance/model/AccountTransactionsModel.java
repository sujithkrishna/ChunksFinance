package com.finance.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

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
 * 10 Mar 2025
 *
 */
@Data
@Entity
@Table(name = "account_transactions")
public class AccountTransactionsModel {
	
	@Id
	@Column(name = "account_transactions_id")
	private Integer id;
	
    @ManyToOne
    @JoinColumn(name = "account_holder_name", referencedColumnName = "no")    
    private MemberModel accountHolderName;
    
    @ManyToOne
    @JoinColumn(name = "finance_id", referencedColumnName = "id")
    private FinanceModel financeType;   
    
    @Column(name = "total_amount", precision = 19, scale = 2)
    private BigDecimal totalAmount;   
    
    @Column(name = "paid_amount", precision = 19, scale = 2)
    private BigDecimal paidAmount;     
    
    @Column(name = "payment_date")
    private LocalDate paymentDate;
    
    @ManyToOne
    @JoinColumn(name = "first_approver_member_no", referencedColumnName = "no")
    private MemberModel firstapproverName;
    
    @ManyToOne
    @JoinColumn(name = "second_approver_member_no", referencedColumnName = "no")
    private MemberModel secondapproverName;
    
    @Column(name = "first_approval_date_time")
    private LocalDateTime firstApprovalTime;
    
    @Column(name = "second_approval_date_time")
    private LocalDateTime secondApprovalTime;    

}

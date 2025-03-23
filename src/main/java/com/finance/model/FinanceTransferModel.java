package com.finance.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.finance.model.ExpensesModel.CurrentStatus;
import com.finance.model.FinanceModel.FinanceType;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

/**
 * @author Sujith Krishna
 *
 * 21 Mar 2025
 *
 */
@Data
@Entity
@ToString
@Table(name = "finance_transfer")
public class FinanceTransferModel {

    public enum CurrentStatus {
    	REQUESTED, 
    	INITIAL_APPROVAL,  
        REJECTED,
        PENDING,
        CLOSED 
    }
    
   	@Id
    @Column(nullable = false)
    private Integer id;
   
    @ManyToOne
    @JoinColumn(name = "source_finance_type", referencedColumnName = "id")
    private FinanceModel sourceFinanceType;
    
    @ManyToOne
    @JoinColumn(name = "destination_finance_type", referencedColumnName = "id")
    private FinanceModel destinationFinanceType;

    
    @Column(name = "finance_amount")
    private Double financeAmount;	   

    @Column(name = "finance_transfer_date", nullable = false)
    private LocalDate financeTransferDate;	
    
    @Enumerated(EnumType.STRING)
    @Column(name = "current_status", nullable = false)
    private CurrentStatus currentStatus = CurrentStatus.REQUESTED;     
    
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

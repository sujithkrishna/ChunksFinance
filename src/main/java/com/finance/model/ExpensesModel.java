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
public class ExpensesModel {

    public enum CurrentStatus {
        INPROGRESS,  // Note: Might want to rename to IN_PROGRESS for correctness
        APPROVED,    // Note: Likely a typo, should be APPROVED
        REJECTED
    }
    
    @Id
    @Column(name = "expenses_number", nullable = false)
    private Integer expensesNumber;	 	

    @ManyToOne
    @JoinColumn(name = "finance_id", referencedColumnName = "id")
    private FinanceModel financeType;

    @ManyToOne
    @JoinColumn(name = "spender_member_no", referencedColumnName = "no")
    private MemberModel spenderName;
    
    @Column(name = "spender_details")
    private String spenderDetails;

    @Column(name = "spend_date", nullable = false)
    private LocalDate spendDate;

    @Column(name = "spend_amount", nullable = false)
    private Double spendAmount;

    @Enumerated(EnumType.STRING)
    @Column(name = "current_status", nullable = false)
    private CurrentStatus currentStatus = CurrentStatus.INPROGRESS;

    @ManyToOne
    @JoinColumn(name = "first_approver_member_no", referencedColumnName = "no")
    private MemberModel firstapproverName;
    
    @ManyToOne
    @JoinColumn(name = "second_approver_member_no", referencedColumnName = "no")
    private MemberModel secondapproverName;
    
}

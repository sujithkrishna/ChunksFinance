package com.finance.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.ToString;

/**
 * @author Sujith Krishna
 *
 * 28 Feb 2025
 *
 */
@Data
@Entity
@ToString(exclude = {"emiDetails", "chitsNameOf"})
@Table(name = "chits")
public class ChitsModel {

    public enum CurrentStatus {
    	REQUESTED, 
    	INITIAL_APPROVAL,  
        REJECTED,
        INPROGRESS,
        CLOSED 
    }	
    @Id
    @Column(name = "chits_no", unique = true)
    private Integer chitsNo;
    
    @ManyToOne
    @JoinColumn(name = "chits_name_of", referencedColumnName = "no")
    private MemberModel chitsNameOf;  

    @Column(name = "chits_start_date")
    private LocalDate chitsStartDate; 
    
    @Column(name = "total_chits_number")
    private Integer totalChitsNo;    
    
    @Column(name = "total_chits_amount")
    private Integer totalChitsAmount;   

    @ManyToOne
    @JoinColumn(name = "finance_id", referencedColumnName = "id")
    private FinanceModel financeType;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "current_status", nullable = false)
    private CurrentStatus currentStatus = CurrentStatus.REQUESTED; 
    
    // EMI Details (1-17 EMIs)
    @OneToMany(mappedBy = "chits", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ChitsEmiDetail> emiDetails;
    
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

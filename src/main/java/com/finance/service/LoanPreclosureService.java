package com.finance.service;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.FinanceModel;
import com.finance.model.LoanModel;
import com.finance.model.MemberModel;
import com.finance.repository.LoanRepository;
import com.finance.repository.MemberRepository;
import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 * 19 Mar 2025
 *
 */
@Service
public class LoanPreclosureService {
	
	@Autowired
	private CreateFinanceService createFinanceService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private LoanRepository loanRepository;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
	
	
	@Autowired
	private CreateFinanceService financeService;
	
	public void populatePreClosureData(MemberDetails currentUserModel, Model model) {
		if (currentUserModel != null) {
            MemberModel currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
            List<FinanceModel> activeFinancesWithOwner = financeService.getActiveFinancesWithOwner(currentUser);
            if(null != activeFinancesWithOwner && activeFinancesWithOwner.size() >=1) {
            	model.addAttribute(ChunksFinanceConstants.FINANCE_OWNER, Boolean.TRUE);
            }
		}
		
		List<FinanceModel> allActiveFinance = createFinanceService.getAllFinanceRecords();
		model.addAttribute(ChunksFinanceConstants.ALL_ACTIVE_FINANCE, allActiveFinance);
		
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute(ChunksFinanceConstants.PRIMARY_MEMBERS,primaryMembers);
		
		List<MemberModel> secondaryMembers = memberService.getAllSecondaryMemeber();
		model.addAttribute(ChunksFinanceConstants.SECONDARY_MEMBERS,secondaryMembers);
	}
	
	
	public boolean populateLoanData(String loanpersonsNo, Model model) {
		if(null != loanpersonsNo) {
			Optional<MemberModel> byMemberName = memberRepository.findById(Integer.parseInt(loanpersonsNo));
			if(null != byMemberName && byMemberName.isPresent()) {
				List<LoanModel> byLoanApplicantName = loanRepository.findByLoanApplicantName(byMemberName.get());
				if(null != byLoanApplicantName && byLoanApplicantName.size() >=1) {
					if(LoanModel.CurrentStatus.PRECLOSURE_REQUEST.equals(byLoanApplicantName.get(0).getCurrentStatus())) {
						model.addAttribute(ChunksFinanceConstants.ERROR, propertyService.getFormattedProperty(ChunksFinanceConstants.LOAN_PRECLOSURE_REQUEST_ALREADY_UNDERPROCESS_MESSAGE,byLoanApplicantName.get(0).getLoanApplicantName().getMemberName()) );
						return false;
					}else {
						model.addAttribute(ChunksFinanceConstants.LOAN_ITEM,byLoanApplicantName.get(0));
						return true;
					}
				}else {
					System.out.println("ELSE CASE");
					StringBuffer errorMessage = new StringBuffer(propertyService.getFormattedProperty(ChunksFinanceConstants.NO_LOAN_FOUND_MESSAGE));
					model.addAttribute(ChunksFinanceConstants.ERROR, errorMessage);
					return false;
				}
			}
			
		}
		return false;
	}
	
	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public void requestPreclosure(String loanNo,Model model) {
		if(null != loanNo) {
			//Preclosure the loan
			Optional<LoanModel> loanItem = loanRepository.findById(Integer.parseInt(loanNo));
			if(null != loanItem && loanItem.isPresent()) {
				if(loanItem.get().getCurrentStatus().equals(LoanModel.CurrentStatus.PRECLOSURE_REQUEST)) {
					model.addAttribute(ChunksFinanceConstants.ERROR, propertyService.getFormattedProperty(ChunksFinanceConstants.LOAN_PRECLOSURE_REQUEST_ALREADY_UNDERPROCESS_MESSAGE,loanItem.get().getLoanApplicantName().getMemberName()) );
				}else {
					loanItem.get().setCurrentStatus(LoanModel.CurrentStatus.PRECLOSURE_REQUEST);
					loanItem.get().setLoanPreclosureRequestDate(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDate());
					loanItem.get().setFirstApprovalTime(null);
					loanItem.get().setSecondApprovalTime(null);
					loanItem.get().setSecondapproverName(null);
					loanRepository.save(loanItem.get());
					model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.LOAN_PRECLOSURE_REQUEST_MESSAGE,loanItem.get().getLoanApplicantName().getMemberName()) );
				}
				
			}
		}
		
	}

}

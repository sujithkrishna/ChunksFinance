package com.finance.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
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

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.FinanceModel;
import com.finance.model.LoanEnquiresModel;
import com.finance.model.MemberModel;
import com.finance.repository.LoanEnquiresRepository;
import com.finance.repository.MemberRepository;
import com.finance.user.MemberDetails;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 * 7 Mar 2025
 *
 */
@Service
public class LoanEnquiresService {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private LoanEnquiresRepository loanEnquiresRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private CreateFinanceService financeService;
	
	public Integer getMaxLoanNumber() {
        return loanEnquiresRepository.findMaxNo(); 
    }
	
	public void populateLoanEnquiresPageDetails(MemberDetails currentUserModel, Model model) {
		MemberModel currentUser = null;
		if (currentUserModel != null) {
			currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
            List<FinanceModel> activeFinancesWithOwner = financeService.getActiveFinancesWithOwner(currentUser);
            if(null != activeFinancesWithOwner && activeFinancesWithOwner.size() >=1) {
            	model.addAttribute(ChunksFinanceConstants.FINANCE_OWNER, Boolean.TRUE);
            }
		}	
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute(ChunksFinanceConstants.PRIMARY_MEMBERS,primaryMembers);
		List<MemberModel> secondaryMembers = memberService.getAllSecondaryMemeber();
		model.addAttribute(ChunksFinanceConstants.SECONDARY_MEMBERS,secondaryMembers);
		Integer maxEnquires = getMaxLoanNumber();
		if(null == maxEnquires) {
			model.addAttribute(ChunksFinanceConstants.LOANENQUIRES_NO,ChunksFinanceConstants.NUMBER_ONE);
		}else {
			++maxEnquires;
			model.addAttribute(ChunksFinanceConstants.LOANENQUIRES_NO,maxEnquires);
		}
		model.addAttribute(ChunksFinanceConstants.PRIMARY_MEMBERS,primaryMembers);
		
	}

	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean createLoanEnquires(MemberDetails currentUserModel, HttpServletRequest request ,LoanEnquiresModel loanEnquiresModel) {
		Integer currentMaxNumber = getMaxLoanNumber();
		if(null == currentMaxNumber) {
			loanEnquiresModel.setId(1);
		}else {
			++currentMaxNumber;
			loanEnquiresModel.setId(currentMaxNumber);
		}
		String loanEnquiresApplicantName = request.getParameter(ChunksFinanceConstants.LOAN_ENQUIRES_APPLICANT_NAME1);
		if(null != loanEnquiresApplicantName && ChunksFinanceConstants.OTHERS.equals(loanEnquiresApplicantName)) {
			loanEnquiresModel.setApplicantName(request.getParameter(ChunksFinanceConstants.OTHERS_NAME));
		}else if(null != loanEnquiresApplicantName) {
			Optional<MemberModel> member = memberRepository.findById(Integer.parseInt(request.getParameter(ChunksFinanceConstants.LOAN_ENQUIRES_APPLICANT_NAME1)));
			if(member.isPresent()) {
				loanEnquiresModel.setApplicantName(member.get().getMemberName());
			}else {
				loanEnquiresModel.setApplicantName(ChunksFinanceConstants.SELF);
			}
		}
		//Date Validation
		LocalDate loanEnquiresDate = loanEnquiresModel.getLoanEnquiresDate();
		if (loanEnquiresDate != null) {
	        if (loanEnquiresDate.getDayOfWeek() != DayOfWeek.SUNDAY) {
	            int daysUntilSunday = DayOfWeek.SUNDAY.getValue() - loanEnquiresDate.getDayOfWeek().getValue();
	            if (daysUntilSunday <= 0) { 
	                daysUntilSunday += 7;
	            }
	            loanEnquiresDate = loanEnquiresDate.plusDays(daysUntilSunday);
	        }
	        loanEnquiresModel.setLoanEnquiresDate(loanEnquiresDate);
	    }
		loanEnquiresRepository.save(loanEnquiresModel);
		return true;
		
	}
	
	
	public List<LoanEnquiresModel> getLoanEnquiresForDashboard(){
		 LocalDateTime localDateTimeInIST = ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime();
		 LocalDate currentDate = localDateTimeInIST.toLocalDate();		 
		 LocalDate startDate = currentDate.with(DayOfWeek.MONDAY);
	     if (currentDate.getDayOfWeek() == DayOfWeek.SUNDAY) {
	        startDate = startDate.minusWeeks(1); 
	     }
		 LocalDate endDate = startDate.plusWeeks(3).with(DayOfWeek.SUNDAY);
		return loanEnquiresRepository.findByCurrentStatusAndLoanEnquiresDateBetween(LoanEnquiresModel.CurrentStatus.OPEN,startDate,endDate);
	}
	
	
	
	
}

package com.finance.service;

import java.math.BigDecimal;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.DuplicateLoanException;
import com.finance.model.FinanceModel;
import com.finance.model.LoanEmiDetail;
import com.finance.model.LoanModel;
import com.finance.model.MemberModel;
import com.finance.model.SettingsModel;
import com.finance.repository.LoanEmiDetailRepository;
import com.finance.repository.LoanRepository;
import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 * 27 Feb 2025
 *
 */
@Service
public class LoanService {

	@Autowired
	private LoanRepository loanRepository;
	
	@Autowired
	private LoanEmiDetailRepository loanEmiDetailRepository; 
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SettingsService settingsService;
	
	@Autowired
	private CreateFinanceService financeService;
	
	
	
	public Integer getMaxLoanNumber() {
        return loanRepository.findMaxNo(); 
    }
	
	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean createLoan(LoanModel loanModel) {
		BigDecimal loanAmount = loanModel.getLoanAmount();
		BigDecimal percentage = new BigDecimal(ChunksFinanceConstants.SIX_HUNDREDTHS);
		BigDecimal emiAmt = loanAmount.multiply(percentage);
		BigDecimal total16EMI = new BigDecimal(ChunksFinanceConstants.SIXTEEN);
		BigDecimal EmiAmtfor16 = emiAmt.multiply(total16EMI);
		BigDecimal lastEmiAmt = loanAmount.subtract(EmiAmtfor16);
        List<LoanEmiDetail> emiDetails = new ArrayList<LoanEmiDetail>();
        MemberModel loanReferenceName = loanModel.getLoanReferenceName();
        MemberModel loanApplicantName = loanModel.getLoanApplicantName();
        List<LoanModel> inProgressLoans = getInProgressLoans(loanReferenceName,loanApplicantName);
        if(null != inProgressLoans && inProgressLoans.size() >= 1) {
        	//Check with the team
        	throw new DuplicateLoanException();
        }
        
        Integer currentLoanNumber = getMaxLoanNumber();
        int startEmiId = 1;
        if (currentLoanNumber != null) {
            startEmiId = currentLoanNumber * 17 + 1; // For example, loan #1 starts at ID 18, loan #2 at ID 35, etc.
        }
        LocalDate loanRepaymentDate = loanModel.getLoanStartDate();
        loanRepaymentDate = loanRepaymentDate.minusDays(7);
        for (int i = 1; i <= 17; i++) {
            LoanEmiDetail emi = new LoanEmiDetail();
            emi.setId(startEmiId + i - 1);
            emi.setEmiNumber(i);
            emi.setEmiDate(loanRepaymentDate.plusDays(i * 7));
            emi.setFirstapproverName(loanModel.getFinanceType().getFinanceOwner());
            if(i!=17) {
            	emi.setEmiAmount(emiAmt);
            }else {
            	emi.setEmiAmount(lastEmiAmt);
            }
            emi.setLoan(loanModel);
            emi.setPaidAmount(new BigDecimal(0));
            emiDetails.add(emi);
        }
        if(null == currentLoanNumber) {
        	loanModel.setLoanNo(1);
		} else {
			loanModel.setLoanNo(++currentLoanNumber);
		}
        loanModel.setLoanEndDate(emiDetails.get(16).getEmiDate());
        loanModel.setEmiDetails(emiDetails);
        loanModel.setFirstapproverName(loanModel.getFinanceType().getFinanceOwner());
		loanRepository.save(loanModel);
		return true;
		
	}
	
	public void populateLoanPageDetails(MemberDetails currentUserModel, Model model) {
		if (currentUserModel != null) {
            MemberModel currentUser = currentUserModel.getMember();
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
		
		Integer currentLonNumber = getMaxLoanNumber();
		if(null == currentLonNumber) {
			model.addAttribute(ChunksFinanceConstants.LOAN_NUMBER,ChunksFinanceConstants.NUMBER_ONE);
		}else {
			++currentLonNumber;
			model.addAttribute(ChunksFinanceConstants.LOAN_NUMBER,currentLonNumber);
		}
		
		List<FinanceModel> financeModel = financeService.getAllFinanceRecords();
		if(financeModel.size()==0) {
			financeModel = null;
		}
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
	}
	
	public List<LoanEmiDetail> findAllLoansForCurrentUser(MemberDetails currentUserModel){
		LocalDateTime localDateTimeInIST = ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime();
		LocalDate currentDate = localDateTimeInIST.toLocalDate();		
	    LocalDate givenDate = currentDate.getDayOfWeek() == DayOfWeek.SUNDAY ? currentDate : currentDate.with(TemporalAdjusters.next(DayOfWeek.SUNDAY));
	    // Issue here...
		return loanEmiDetailRepository.findEmiDetailsByLoanReferenceNameAndStatusAndEmiDate(currentUserModel.getMember().getNo(),givenDate);
	}
	
	public List<LoanModel> findLoansByStatusAndApprover(LoanModel.CurrentStatus currentStatus, MemberModel currentUser){
		 if(currentUser.getRole().equals(MemberModel.ROLE.SUPER_ADMIN)) {
			 SettingsModel settingModelData = settingsService.getSettingByName(ChunksFinanceConstants.APPROVAL_PROCESS);
			 String approvalProcessStatus = null;
			 if(null != settingModelData) {
				 approvalProcessStatus = settingModelData.getSettingsValue();
			 }
			 List<LoanModel.CurrentStatus> statusList = List.of(LoanModel.CurrentStatus.REQUESTED, LoanModel.CurrentStatus.INITIAL_APPROVAL);
			 if(ChunksFinanceConstants.APPROVAL_PROCESS_SEQUENTIAL.equals(approvalProcessStatus)) {
				 return loanRepository.findLoansByStatusWithBothApprovals(statusList);
			 }else {
				 return loanRepository.findLoansByStatusWithSecondApproval(statusList);
			 }
		 }else {
			 List<LoanModel.CurrentStatus> statusList = List.of(LoanModel.CurrentStatus.REQUESTED, LoanModel.CurrentStatus.INITIAL_APPROVAL);
			 return loanRepository.findLoansByStatusesAndApprover(statusList,currentUser.getNo());
		 }
	}
	
	 public List<LoanModel> getAllLoanRecords() {
	        return loanRepository.findAll();
	 }
	
	 public List<LoanModel> getAllPreclosureLoanForAdminParallel() {
		 List<LoanModel.CurrentStatus> statusList = List.of(LoanModel.CurrentStatus.PRECLOSURE_REQUEST,LoanModel.CurrentStatus.PRECLOSURE_INITIAL_APPROVAL);
	     return loanRepository.findLoansByPreclosureAdminParallel(statusList);
	 }
	
	 public List<LoanModel> getAllPreclosureLoanForAdminSequential() {
		 List<LoanModel.CurrentStatus> statusList = List.of(LoanModel.CurrentStatus.PRECLOSURE_REQUEST,LoanModel.CurrentStatus.PRECLOSURE_INITIAL_APPROVAL);
	     return loanRepository.findLoansByPreclosureAdminSequential(statusList);
	 }
	 
	 public List<LoanModel> getAllPreclosureLoanForFinOwner(MemberModel currentUser) {
		 List<LoanModel.CurrentStatus> statusList = List.of(LoanModel.CurrentStatus.PRECLOSURE_REQUEST,LoanModel.CurrentStatus.PRECLOSURE_INITIAL_APPROVAL);
	     return loanRepository.findLoansByPreclosure(statusList,currentUser.getNo());
	 }
	 
	 public List<LoanModel> getInProgressLoans(MemberModel loanReference, MemberModel loanApplicant) {
	        return loanRepository.findInProgressLoans(loanReference, loanApplicant);
	    }
	

}

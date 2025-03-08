package com.finance.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.LoanEmiDetail;
import com.finance.model.FinanceModel;
import com.finance.model.LoanModel;
import com.finance.model.MemberModel;
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
	private MemberService memberService;
	
	@Autowired
	private CreateFinanceService financeService;
	
	public Integer getMaxLoanNumber() {
        return loanRepository.findMaxNo(); 
    }
	
	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean createLoan(LoanModel loanModel) {
		BigDecimal loanAmount = loanModel.getLoanAmount();
		BigDecimal percentage = new BigDecimal("0.06");
		BigDecimal emiAmt = loanAmount.multiply(percentage);
		BigDecimal total16EMI = new BigDecimal("16");
		BigDecimal EmiAmtfor16 = emiAmt.multiply(total16EMI);
		BigDecimal lastEmiAmt = loanAmount.subtract(EmiAmtfor16);
        List<LoanEmiDetail> emiDetails = new ArrayList<LoanEmiDetail>();
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
            	emi.setAmount(emiAmt);
            }else {
            	emi.setAmount(lastEmiAmt);
            }
            emi.setLoan(loanModel); 
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
	
	public void populateLoanPageDetails(MemberDetails currenUser, Model model) {
		if (currenUser != null) {
            MemberModel currentUser = currenUser.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}
		
		
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute("primaryMembers",primaryMembers);
		List<MemberModel> secondaryMembers = memberService.getAllSecondaryMemeber();
		model.addAttribute("secondaryMembers",secondaryMembers);
		
		Integer currentLonNumber = getMaxLoanNumber();
		if(null == currentLonNumber) {
			model.addAttribute("loanNumber",ChunksFinanceConstants.NUMBER_ONE);
		}else {
			++currentLonNumber;
			model.addAttribute("loanNumber",currentLonNumber);
		}
		
		List<FinanceModel> financeModel = financeService.getAllFinanceRecords();
		if(financeModel.size()==0) {
			financeModel = null;
		}
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
	}
	
	 public List<LoanModel> getAllLoanRecords() {
	        return loanRepository.findAll();
	 }
	
	

}

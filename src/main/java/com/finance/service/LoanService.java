package com.finance.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.model.EmiDetail;
import com.finance.model.LoanModel;
import com.finance.repository.LoanRepository;

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
        List<EmiDetail> emiDetails = new ArrayList<>();
        Integer currentLoanNumber = getMaxLoanNumber();
        int startEmiId = 1;
        if (currentLoanNumber != null) {
            startEmiId = currentLoanNumber * 17 + 1; // For example, loan #1 starts at ID 18, loan #2 at ID 35, etc.
        }
        
        for (int i = 1; i <= 17; i++) {
            EmiDetail emi = new EmiDetail();
            emi.setId(startEmiId + i - 1);
            emi.setEmiNumber(i);
            if(i!=17) {
            	emi.setAmount(emiAmt);
            }else {
            	emi.setAmount(lastEmiAmt);
            }
            emi.setLoan(loanModel); 
            emiDetails.add(emi);
        }
        loanModel.setEmiDetails(emiDetails);
		loanRepository.save(loanModel);
		return true;
		
	}

}

package com.finance.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.ExpensesModel;
import com.finance.repository.ExpensesRepository;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Service
public class ExpensesService {
	
	@Autowired
    private ExpensesRepository expensesRepository;
	
	public Long getMaxExpensesNumber() {
        return expensesRepository.findMaxExpensesNumber(); 
    }

	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean createExpenses(HttpServletRequest request, ExpensesModel expenses) {
		expenses.setCurrentStatus(ChunksFinanceConstants.IN_PROGRESS);
		if(null != expenses.getFinanceType()) {
			String[] financeTypeDataSplit = expenses.getFinanceType().split(ChunksFinanceConstants.FINANCETYPE_SPLIT_REGEX);
			String financeOwnerName = financeTypeDataSplit[2];
			expenses.setApproverName(financeOwnerName);		
		}else {
			// Its going to Default Approver
			
		}
		try {
			Long maxExpensesNum = getMaxExpensesNumber();
			if(null != maxExpensesNum && maxExpensesNum>=expenses.getExpensesNumber()) {
				expenses.setExpensesNumber(++maxExpensesNum);
			}
			expensesRepository.save(expenses);
			return true;
		} catch (Exception exception) {
			return false;
		}
		
	}
	
	 public List<ExpensesModel> getExpensesFromMondayToGivenDate(LocalDate givenDate) {
	        LocalDate startOfWeek = givenDate.with(DayOfWeek.MONDAY);
	        String currentUserName = null;
	        return expensesRepository.findExpensesByDateRangeAndStatusAndApprover(startOfWeek, givenDate,ChunksFinanceConstants.IN_PROGRESS,currentUserName);
	    }
	
	
}

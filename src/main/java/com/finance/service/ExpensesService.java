package com.finance.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;

import org.springframework.aot.hint.ExecutableMode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.ExpensesModel;
import com.finance.model.FinanceModel;
import com.finance.model.MemberModel;
import com.finance.repository.ExpensesRepository;
import com.finance.user.MemberDetails;

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
	private CreateFinanceService financeService;
	
	@Autowired
    private ExpensesRepository expensesRepository;
	
	public Integer getMaxExpensesNumber() {
        return expensesRepository.findMaxNo(); 
    }

	@Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	public boolean createExpenses(MemberDetails currentUser,ExpensesModel expenses) {
		//expenses.setCurrentStatus(ChunksFinanceConstants.IN_PROGRESS);
		try {
			Integer maxExpensesNum = getMaxExpensesNumber();
			if(null != maxExpensesNum && maxExpensesNum>=expenses.getExpensesNumber()) {
				expenses.setExpensesNumber(++maxExpensesNum);
			}
			expenses.setSpenderName(currentUser.getMember());
			expenses.setApproverName(expenses.getFinanceType().getFinanceOwner());
			expensesRepository.save(expenses);
			return true;
		} catch (Exception exception) {
			return false;
		}
		
	}
	
	public void populatingFields(Model model) {
		List<FinanceModel> financeModel = financeService.getAllFinanceRecords();
		if(financeModel.size()==0) {
			financeModel = null;
		}
		model.addAttribute(ChunksFinanceConstants.ALL_FINANCE, financeModel);
		Integer currentExpensedNumber = getMaxExpensesNumber();
		// Check here what you are doing....
		if(null == currentExpensedNumber) {
			model.addAttribute(ChunksFinanceConstants.EXPENSES_NUMBER, ChunksFinanceConstants.NUMBER_ONE);
		}else {
			++currentExpensedNumber;
			model.addAttribute(ChunksFinanceConstants.EXPENSES_NUMBER, currentExpensedNumber);
		}
	}
	
	
	
	
	
	 public List<ExpensesModel> getExpensesFromMondayToGivenDate(LocalDate givenDate,MemberModel currentUser) {
	        LocalDate startOfWeek = givenDate.with(DayOfWeek.MONDAY);
	        return expensesRepository.findExpensesByDateRangeAndStatusAndApprover(startOfWeek, givenDate,ExpensesModel.CurrentStatus.INPROGRESS,currentUser);
	    }
	
	
}

package com.finance.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.AlreadyApprovedException;
import com.finance.exception.DateExpiredException;
import com.finance.model.ExpensesModel;
import com.finance.model.FinanceModel;
import com.finance.model.RevenueModel;
import com.finance.repository.ExpensesRepository;
import com.finance.repository.FinanceRepository;
import com.finance.repository.RevenueRepository;

import jakarta.servlet.http.HttpServletRequest;





/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Service
public class ApprovalsService {

	
	@Autowired
    private RevenueRepository revenueRepository;
	
	@Autowired
    private ExpensesRepository expensesRepository;
	
	@Autowired
    private FinanceRepository financeRepository;
	
	 	 
	 @Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	 public boolean processApprovels(HttpServletRequest request) {
		
		 String currentType =request.getParameter(ChunksFinanceConstants.CURRENT_TYPE);
		 String idNumber =request.getParameter(ChunksFinanceConstants.CURRENT_ID);
		 String status =request.getParameter(ChunksFinanceConstants.STATUS);
		 if(ChunksFinanceConstants.REVENUE.equals(currentType) && null != idNumber) {
			 try {
				 	Integer revenueNum = Integer.parseInt(idNumber);
				 	Optional<RevenueModel> revenueOptional = revenueRepository.findById(revenueNum);
	                if (revenueOptional.isPresent()) {
	                    RevenueModel revenueModel = revenueOptional.get();
	                    if(!isBussinessExipredRule(revenueModel.getSpendDate())) {
	                    	throw new DateExpiredException(); 
	                    }
	                    if(revenueModel.getCurrentStatus().equals(ChunksFinanceConstants.APPROVED)) {
	                    	throw new AlreadyApprovedException();  
	                    }else {
	                    	revenueModel.setCurrentStatus(RevenueModel.CurrentStatus.valueOf(status.toUpperCase()));
	                    	revenueRepository.save(revenueModel);
	  	                    if(null != status && ChunksFinanceConstants.APPROVED.equals(status)) {
	  	                    	// Process the amount from existing fund of the type he submitted.
	  	                    	if(null != revenueModel.getFinanceType()) {
	  	                    		FinanceModel currentModel = revenueModel.getFinanceType();
	  	                    		if(null != currentModel) {
	  	                    			Double currentBalance = currentModel.getCurrentBalance() + revenueModel.getSpendAmount();
	  	                    			currentModel.setCurrentBalance(currentBalance);
	  	                    			financeRepository.save(currentModel);
	  	                    			// If this is approved then save this to approval Model.
	  	                    		}
	  	                    	}
	  	                    }
	  	                    return true;
	                    }
	                }
	            } catch (NumberFormatException exception) {
	                
	            }
		 }else if(ChunksFinanceConstants.EXPENSES.equals(currentType) && null != idNumber) {
			 try {
				 	Integer expensesNum = Integer.parseInt(idNumber);
	                Optional<ExpensesModel> expensesOptional = expensesRepository.findById(expensesNum);
	                if (expensesOptional.isPresent()) {
	                	ExpensesModel expensesModel = expensesOptional.get();
	                	if(!isBussinessExipredRule(expensesModel.getSpendDate())) {
	                    	throw new DateExpiredException(); 
	                    }
	                    if(expensesModel.getCurrentStatus().equals(ChunksFinanceConstants.APPROVED)) {
	                    	throw new AlreadyApprovedException();  
	                    }else {
	                    	expensesModel.setCurrentStatus(ExpensesModel.CurrentStatus.valueOf(status.toUpperCase()));
	                    	expensesRepository.save(expensesModel);
	  	                    if(null != status && ChunksFinanceConstants.APPROVED.equals(status)) {
	  	                    	// Process the amount from existing fund of the type he submitted.
	  	                    	if(null != expensesModel.getFinanceType()) {
	  	                    		FinanceModel currentModel = expensesModel.getFinanceType();
	  	                    		if(null != currentModel) {
	  	                    			Double currentBalance = currentModel.getCurrentBalance() - expensesModel.getSpendAmount();
	  	                    			currentModel.setCurrentBalance(currentBalance);
	  	                    			financeRepository.save(currentModel);
	  	                    			// If this is approved then save this to approval Model.
	  	                    		}
	  	                    	}
	  	                    }
	  	                    return true;
	                    }
	                }
	            } catch (NumberFormatException exception) {
	                
	            }
		 }
		 return false;
	 }
	 
	 private boolean isBussinessExipredRule(LocalDate spendDate) {
		 if(null != spendDate) {
			 LocalDate today = LocalDate.now();
             LocalDate lastMonday = today.with(DayOfWeek.MONDAY);
             LocalDate upcomingSunday = today.with(DayOfWeek.SUNDAY);
             return (spendDate.isEqual(lastMonday) || spendDate.isAfter(lastMonday)) && (spendDate.isEqual(upcomingSunday) || spendDate.isBefore(upcomingSunday));
		 }else {
			 return false;
		 }
	 }
	

}

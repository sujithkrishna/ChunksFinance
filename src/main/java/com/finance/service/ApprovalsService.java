package com.finance.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.AlreadyApprovedException;
import com.finance.model.RevenueModel;
import com.finance.model.CurrentUser;
import com.finance.model.ExpensesModel;
import com.finance.model.FinanceModel;
import com.finance.repository.RevenueRepository;
import com.finance.repository.ExpensesRepository;
import com.finance.repository.FinanceRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
	
	@Autowired
    private CurrentUser currentUser;
	
	 public List<RevenueModel> getAllNonApprovedRevenueForMyApproval() {
		 	String currentUserName = null;
		 	if(null != currentUser  && !currentUser.isLoggedIn()) {
		 		currentUserName = ChunksFinanceConstants.SILENT_WATCHER;
			}else {
				currentUserName = currentUser.getMemberName();
			}
	        return revenueRepository.findByCurrentStatusAndApproverName(ChunksFinanceConstants.IN_PROGRESS,currentUserName);
	  }
	 
	 public List<ExpensesModel> getAllNonApprovedExpensesForMyApproval() {
		 	String currentUserName = null;
		 	if(null != currentUser  && !currentUser.isLoggedIn()) {
		 		currentUserName = ChunksFinanceConstants.SILENT_WATCHER;
			}else {
				currentUserName = currentUser.getMemberName();
			}
	        return expensesRepository.findByCurrentStatusAndApproverName(ChunksFinanceConstants.IN_PROGRESS,currentUserName);
	  }
	 
	 
	 @Transactional(isolation = Isolation.SERIALIZABLE, propagation = Propagation.REQUIRED)
	 public boolean processApprovels(HttpServletRequest request,HttpServletResponse response) {
		 String currentType =request.getParameter(ChunksFinanceConstants.CURRENT_TYPE);
		 String idNumber =request.getParameter(ChunksFinanceConstants.CURRENT_ID);
		 String status =request.getParameter(ChunksFinanceConstants.STATUS);
		 if(ChunksFinanceConstants.REVENUE.equals(currentType) && null != idNumber) {
			 try {
	                Long revenueNum = Long.parseLong(idNumber);
	                Optional<RevenueModel> revenueOptional = revenueRepository.findByRevenueNumber(revenueNum);
	                if (revenueOptional.isPresent()) {
	                    RevenueModel revenueModel = revenueOptional.get();
	                    if(revenueModel.getCurrentStatus().equals(ChunksFinanceConstants.APPROVED)) {
	                    	throw new AlreadyApprovedException();  
	                    }else {
	                    	revenueModel.setCurrentStatus(status);
	                    	revenueRepository.save(revenueModel);
	  	                    if(null != status && ChunksFinanceConstants.APPROVED.equals(status)) {
	  	                    	// Process the amount from existing fund of the type he submitted.
	  	                    	if(null != revenueModel.getFinanceType()) {
	  	                    		String[] financeTypeDataSplit = revenueModel.getFinanceType().split(ChunksFinanceConstants.FINANCETYPE_SPLIT_REGEX);
	  	                    		String financeType = financeTypeDataSplit[0];
	  	                    		String financeName = financeTypeDataSplit[1];
	  	                    		String financeOwnerName = financeTypeDataSplit[2];
	  	                    		FinanceModel currentModel = financeRepository.findByFinanceTypeAndFinanceNameAndFinanceOwnerName(financeType, financeName, financeOwnerName);
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
	                Long expensesNum = Long.parseLong(idNumber);
	                Optional<ExpensesModel> expensesOptional = expensesRepository.findByExpensesNumber(expensesNum);
	                if (expensesOptional.isPresent()) {
	                	ExpensesModel expensesModel = expensesOptional.get();
	                    if(expensesModel.getCurrentStatus().equals(ChunksFinanceConstants.APPROVED)) {
	                    	throw new AlreadyApprovedException();  
	                    }else {
	                    	expensesModel.setCurrentStatus(status);
	                    	expensesRepository.save(expensesModel);
	  	                    if(null != status && ChunksFinanceConstants.APPROVED.equals(status)) {
	  	                    	// Process the amount from existing fund of the type he submitted.
	  	                    	if(null != expensesModel.getFinanceType()) {
	  	                    		String[] financeTypeDataSplit = expensesModel.getFinanceType().split(ChunksFinanceConstants.FINANCETYPE_SPLIT_REGEX);
	  	                    		String financeType = financeTypeDataSplit[0];
	  	                    		String financeName = financeTypeDataSplit[1];
	  	                    		String financeOwnerName = financeTypeDataSplit[2];
	  	                    		FinanceModel currentModel = financeRepository.findByFinanceTypeAndFinanceNameAndFinanceOwnerName(financeType, financeName, financeOwnerName);
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

}

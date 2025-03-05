package com.finance.service;

import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finance.model.ChitsEmiDetail;
import com.finance.model.ChitsModel;
import com.finance.repository.ChitsRepository;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Sujith Krishna
 *
 *         28 Feb 2025
 *
 */
@Service
public class ChitsService {

	@Autowired
	private ChitsRepository chitsRepository;

	public Integer getMaxChitsNumber() {
		return chitsRepository.findMaxChitsNo();
	}

	public boolean createChits(ChitsModel chitsModel, HttpServletRequest request) {

		Integer currentChitsNumber = getMaxChitsNumber();
		List<ChitsEmiDetail> emiDetails = new ArrayList<ChitsEmiDetail>();
		int startEmiId = 1;
		if (currentChitsNumber == null || currentChitsNumber == 0) {
			startEmiId = 1;
		} else {
			startEmiId = currentChitsNumber * 20 + 1;
		}
		if (null == currentChitsNumber) {
			chitsModel.setChitsNo(1);
		} else {
			chitsModel.setChitsNo(++currentChitsNumber);
		}
		for (int i = 1; i <= 20; i++) {
			ChitsEmiDetail currentEMI = new ChitsEmiDetail();
			// Change this.
			currentEMI.setId(startEmiId + i - 1);
			currentEMI.setChits(chitsModel);
			currentEMI.setEmiNumber(i);
			currentEMI.setFirstapproverName(chitsModel.getFinanceType().getFinanceOwner());
			currentEMI.setEmiDate(chitsModel.getChitsStartDate().plusMonths(i * 1));
			String paramValue = request.getParameter("chits-" + i);
			currentEMI.setAmount(new BigDecimal(paramValue != null ? paramValue : "0"));
			emiDetails.add(currentEMI);
		}
		chitsModel.setEmiDetails(emiDetails);
		chitsRepository.save(chitsModel);
		return true;
	}

	public List<ChitsModel> getChitsByFinanceOwnerAndStatus(Integer financeOwnerNo) {
		return chitsRepository.findByFinanceOwnerAndStatus(financeOwnerNo);
	}

	
	public List<ChitsModel> getAllChitsNotApproved(Integer financeOwnerNo) {
		return chitsRepository.findByChitsNotApprovedANDByFinanceOwner(financeOwnerNo);
	}
	
	
	
	
}

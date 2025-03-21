package com.finance.service;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.FinanceTransferModel;
import com.finance.repository.FinanceTransferRepository;

/**
 * @author Sujith Krishna
 *
 * 21 Mar 2025
 *
 */

@Service
public class FinanceTransferService {
	
	@Autowired
	private FinanceTransferRepository financeTransferRepository;
	
	public boolean createFinanceTransfer(FinanceTransferModel financeTransferModel) {
		int maxCount  = 1;
		Optional<Integer> maxNo = financeTransferRepository.findMaxId();
		if(null != maxNo && maxNo.isPresent()) {
			maxCount = maxNo.get();
		}
		financeTransferModel.setId(maxCount);
		financeTransferModel.setFinanceTransferDate(ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDate());
		financeTransferRepository.save(financeTransferModel);
		return true;
	}

}

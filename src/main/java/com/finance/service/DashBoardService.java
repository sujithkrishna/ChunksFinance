package com.finance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finance.model.FinanceModel;
import com.finance.repository.FinanceRepository;

/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@Service
public class DashBoardService {

	@Autowired
	private FinanceRepository financeRepository;
	
   
}

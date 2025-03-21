package com.finance.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.FinanceModel;
import com.finance.model.FinanceTransferModel;
import com.finance.model.MemberModel;
import com.finance.service.CreateFinanceService;
import com.finance.service.FinanceTransferService;
import com.finance.service.MemberService;
import com.finance.user.MemberDetails;

/**
 * @author Sujith Krishna
 *
 * 21 Mar 2025
 *
 */
@Controller
public class FinanceTransferController {
	
	@Autowired
	private CreateFinanceService createFinanceService ;
	
	@Autowired
	private ChunksFinancePropertyService propertyService;
		
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FinanceTransferService financeTransferService;


	@PostMapping(path = {"/finance-transfer"})
	public String handleDashboard(@AuthenticationPrincipal MemberDetails currentUserModel,FinanceTransferModel financeTransferModel,Model model) {
		if (currentUserModel != null) {
            MemberModel currentUser = currentUserModel.getMember();
            model.addAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
		}		
		List<MemberModel> primaryMembers = memberService.getAllPrimaryMemeber();
		model.addAttribute(ChunksFinanceConstants.PRIMARY_MEMBERS,primaryMembers);
		
		List<FinanceModel> sourceFinance = createFinanceService.getActiveFinancesWithOwner(currentUserModel.getMember());
		model.addAttribute(ChunksFinanceConstants.SOURCE_FINANCE,sourceFinance);
		
		List<FinanceModel> destinationFinance = createFinanceService.getActiveFinancesWithOwnerNotOwner(currentUserModel.getMember());
		model.addAttribute(ChunksFinanceConstants.DESTINATION_FINANCE,destinationFinance);
		
		model.addAttribute(ChunksFinanceConstants.FINANCE_TRANSFER, Boolean.TRUE);
		boolean status = financeTransferService.createFinanceTransfer(financeTransferModel);
		if(status) {
			model.addAttribute(ChunksFinanceConstants.SUCCESS, propertyService.getFormattedProperty(ChunksFinanceConstants.FINANCE_FUND_TRANSFER_MESSAGE,financeTransferModel.getSourceFinanceType().getFinanceName(),financeTransferModel.getDestinationFinanceType().getFinanceName()));
		}
        return "createFinance";
	}
}

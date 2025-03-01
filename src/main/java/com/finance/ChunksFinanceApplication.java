package com.finance;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.finance.model.ChitsModel;
import com.finance.model.ExpensesModel;
import com.finance.model.FinanceModel;
import com.finance.model.LoanModel;
import com.finance.model.MemberModel;
import com.finance.model.RevenueModel;
import com.finance.service.AllExportService;

@SpringBootApplication
@EnableTransactionManagement
public class ChunksFinanceApplication {

	public static void main(String[] args) {

		ApplicationContext context = SpringApplication.run(ChunksFinanceApplication.class, args);

		
		// Get the FinanceService bean from the context
		AllExportService financeService = context.getBean(AllExportService.class);
		String eportData = "member";
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Data");
		List<MemberModel> fullMemberList = financeService.getAllMembers();
		List<ChitsModel> fullChitsList = financeService.getAllChits(); 
		List<ExpensesModel> fullExpensesList =financeService.getAllExpenses();
		List<FinanceModel> fullFinanceList =financeService.getAllFinances();
		List<LoanModel> fullLoanList =financeService.getAllLoans();
		List<RevenueModel> fullRevenueList =financeService.getAllRevenue(); 
		
		
		if(eportData.equals("member")) {
				String excelFilePath_Member = "exported_member.xlsx";
				Row headerRow = sheet.createRow(0);
				String[] headers = { "ID", "Name", "Email", "Password","MobileNumber","DOB","RefferenceNumber","Address1","Place","Taluk","District","State","PINCode","MemberType","Role" };
				for (int i = 0; i < headers.length; i++) {
					headerRow.createCell(i).setCellValue(headers[i]);
				}
				int rowIndex = 1;
				for (MemberModel member : fullMemberList) {
					Row row = sheet.createRow(rowIndex++);
					row.createCell(0).setCellValue(member.getNo());
					row.createCell(1).setCellValue(member.getMemberName());
					row.createCell(2).setCellValue(member.getEmailId());
					row.createCell(3).setCellValue(member.getPassword());
					row.createCell(4).setCellValue(member.getMobileNumber());
					row.createCell(5).setCellValue(member.getMemberDOB());
					row.createCell(6).setCellValue(member.getReferenceMember()+"");
					row.createCell(7).setCellValue(member.getAddress1());
					row.createCell(8).setCellValue(member.getPlace());
					row.createCell(9).setCellValue(member.getTaluk());
					row.createCell(10).setCellValue(member.getDistrict());
					row.createCell(11).setCellValue(member.getState());
					row.createCell(12).setCellValue(member.getPincode());
					row.createCell(13).setCellValue(member.getMemberType()+"");
					row.createCell(14).setCellValue(member.getRole()+"");
				}
				try (FileOutputStream fileOut = new FileOutputStream(excelFilePath_Member)) {
					workbook.write(fileOut);
				} catch (FileNotFoundException e) {
				} catch (IOException e) {
				}
		} else if(eportData.equals("chits")) {
			String excelFilePath_Member = "exported_chits.xlsx";
			Row headerRow = sheet.createRow(0);
			String[] headers = { "ChitsNo", "Name" };
			for (int i = 0; i < headers.length; i++) {
				headerRow.createCell(i).setCellValue(headers[i]);
			}
			int rowIndex = 1;
			for (ChitsModel chits : fullChitsList) {
				Row row = sheet.createRow(rowIndex++);
				row.createCell(0).setCellValue(chits.getChitsNo());
				row.createCell(1).setCellValue(chits.getChitsNameOf().getMemberName());
				
			}
			try (FileOutputStream fileOut = new FileOutputStream(excelFilePath_Member)) {
				workbook.write(fileOut);
			} catch (FileNotFoundException e) {
			} catch (IOException e) {
			}
		}
		
		
		try {
			workbook.close();
		} catch (IOException e) {
		}
		System.out.println("Data exported to Excel successfully!");
	
	}

}

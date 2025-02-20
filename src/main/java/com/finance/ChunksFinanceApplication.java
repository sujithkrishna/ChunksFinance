package com.finance;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class ChunksFinanceApplication {

	public static void main(String[] args) {
		SpringApplication.run(ChunksFinanceApplication.class, args);
	}

}

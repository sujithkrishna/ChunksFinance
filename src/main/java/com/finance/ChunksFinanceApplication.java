package com.finance;

import java.util.TimeZone;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import jakarta.annotation.PostConstruct;

@SpringBootApplication
@EnableTransactionManagement
public class ChunksFinanceApplication {

	@PostConstruct
    void started() {
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Kolkata"));
    }
	
	public static void main(String[] args) {
		SpringApplication.run(ChunksFinanceApplication.class, args);
	}

}

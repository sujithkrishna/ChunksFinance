package com.finance;

import java.util.TimeZone;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.finance.constant.ChunksFinanceConstants;

import jakarta.annotation.PostConstruct;

@SpringBootApplication
@EnableTransactionManagement
public class ChunksFinanceApplication  extends SpringBootServletInitializer {

	@PostConstruct
    void started() {
        TimeZone.setDefault(TimeZone.getTimeZone(ChunksFinanceConstants.ASIA_KOLKATA));
    }
	
	 @Override
	    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
	        return builder.sources(ChunksFinanceApplication.class);
	    }
	
	public static void main(String[] args) {
		SpringApplication.run(ChunksFinanceApplication.class, args);
	}

}

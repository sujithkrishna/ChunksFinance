package com.finance.config;

import java.text.MessageFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Service
public class ChunksFinancePropertyService {

	 	@Autowired
	    private Environment environment;

	    public String getProperty(String key) {
	        return environment.getProperty(key);
	    }

	    public String getProperty(String key, String defaultValue) {
	        return environment.getProperty(key, defaultValue);
	    }
	    public String getFormattedProperty(String key, Object... args) {
	        String template = environment.getProperty(key);
	        return (template != null) ? MessageFormat.format(template, args) : "";
	    }
}

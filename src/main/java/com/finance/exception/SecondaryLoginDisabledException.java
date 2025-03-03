package com.finance.exception;

import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * @author Sujith Krishna
 *
 * 27 Feb 2025
 *
 */
public class SecondaryLoginDisabledException extends UsernameNotFoundException  {

	private static final long serialVersionUID = 1L;
	
	public SecondaryLoginDisabledException(String message) {
		super(message);
	}

}

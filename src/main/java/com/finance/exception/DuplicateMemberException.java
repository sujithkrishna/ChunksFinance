package com.finance.exception;
/**
 * @author Sujith Krishna
 *
 * 27 Feb 2025
 *
 */
public class DuplicateMemberException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	public DuplicateMemberException(String message) {
		super(message);
	}

}

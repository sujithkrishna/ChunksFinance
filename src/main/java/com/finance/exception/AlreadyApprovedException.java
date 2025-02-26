package com.finance.exception;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import lombok.NoArgsConstructor;

/**
 * @author Sujith Krishna
 *
 * 21 Feb 2025
 *
 */
@NoArgsConstructor
@Component
@Scope(value = WebApplicationContext.SCOPE_REQUEST, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class AlreadyApprovedException extends RuntimeException{

	private static final long serialVersionUID = 1L;

	public AlreadyApprovedException(String message) {
		super(message);
	}
}

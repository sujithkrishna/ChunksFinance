package com.finance.exception;

import java.io.IOException;

import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Sujith Krishna
 *
 * 27 Feb 2025
 *
 */
@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
	
	
	
	private ChunksFinancePropertyService propertyService;
	
	public CustomAuthenticationFailureHandler(ChunksFinancePropertyService propertyService) {
		this.propertyService= propertyService;
	}

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, 
                                        HttpServletResponse response,
                                        AuthenticationException exception) throws IOException {
    	String errorMessage = propertyService.getProperty(ChunksFinanceConstants.USER_PASSWORD_WRONG_ERROR);

        Throwable cause = exception.getCause();
        if (exception instanceof InternalAuthenticationServiceException) {
            while (cause != null) {
                if (cause instanceof SecondaryLoginDisabledException) {
                    errorMessage = cause.getMessage();
                    break;
                }
                cause = cause.getCause();
            }
        } else if (exception instanceof UsernameNotFoundException) {
            errorMessage = exception.getMessage();
        }

        request.getSession().setAttribute(ChunksFinanceConstants.LOGIN_ERROR, errorMessage);
        response.sendRedirect(ChunksFinanceConstants.FINANCE_LOGIN_ERROR);
    }
}
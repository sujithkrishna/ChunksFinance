package com.finance.handler;

import java.io.IOException;
import java.time.ZoneId;
import java.time.ZonedDateTime;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.model.MemberModel;
import com.finance.user.MemberDetails;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Sujith Krishna
 *
 * 27 Feb 2025
 *
 */
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, 
                                        HttpServletResponse response,
                                        Authentication authentication) {
        MemberDetails memberDetails = (MemberDetails) authentication.getPrincipal();
        MemberModel currentUser = memberDetails.getMember();
        request.getSession().setAttribute(ChunksFinanceConstants.CURRENT_USER, currentUser);
        System.out.println("You are sucessfully logged in at "+ZonedDateTime.now(ZoneId.of(ChunksFinanceConstants.ASIA_KOLKATA)).toLocalDateTime() + " User : "+currentUser.getMemberName());
        try {
			response.sendRedirect("/dashboard");
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
} 
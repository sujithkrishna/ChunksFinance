package com.finance.security;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.finance.config.ChunksFinancePropertyService;
import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.SecondaryLoginDisabledException;
import com.finance.service.MemberDetailsService;

/**
 * @author Sujith Krishna
 *
 * 3 Mar 2025
 *
 */
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private final MemberDetailsService memberDetailsService;
    private final PasswordEncoder passwordEncoder;
    private ChunksFinancePropertyService propertyService;

    public CustomAuthenticationProvider(MemberDetailsService memberDetailsService, PasswordEncoder passwordEncoder,ChunksFinancePropertyService propertyService) {
        this.memberDetailsService = memberDetailsService;
        this.passwordEncoder = passwordEncoder;
        this.propertyService =propertyService;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String emailId = authentication.getName();
        String password = authentication.getCredentials().toString();

        try {
            UserDetails user = memberDetailsService.loadUserByUsername(emailId);

            if (!passwordEncoder.matches(password, user.getPassword())) {
                throw new BadCredentialsException(propertyService.getProperty(ChunksFinanceConstants.USER_PASSWORD_WRONG_ERROR));
            }

            return new UsernamePasswordAuthenticationToken(user, password, user.getAuthorities());

        } catch (SecondaryLoginDisabledException ex) {
            throw ex;  // Ensure your exception is thrown as is
        } catch (UsernameNotFoundException ex) {
            throw new BadCredentialsException(propertyService.getProperty(ChunksFinanceConstants.USER_PASSWORD_WRONG_ERROR));
        }
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
    }

}

package com.finance.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.finance.constant.ChunksFinanceConstants;
import com.finance.exception.CustomAuthenticationFailureHandler;
import com.finance.handler.LoginSuccessHandler;
import com.finance.service.MemberDetailsService;

/**
 * @author Sujith Krishna
 *
 *         20 Feb 2025
 *
 */
@Configuration
@EnableWebSecurity
public class FinanceSecurityConfig {

	private final MemberDetailsService memberDetailsService;

	private final CustomAuthenticationFailureHandler customFailureHandler;

	private final LoginSuccessHandler loginSuccessHandler;

	public FinanceSecurityConfig(MemberDetailsService memberDetailsService,
			CustomAuthenticationFailureHandler customFailureHandler, LoginSuccessHandler loginSuccessHandler) {
		this.memberDetailsService = memberDetailsService;
		this.customFailureHandler = customFailureHandler;
		this.loginSuccessHandler = loginSuccessHandler;
	}

	@SuppressWarnings("removal")
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
	    http
	        .authorizeHttpRequests(auth -> auth
	            .requestMatchers(
	                "/", "/views/**", "/financeLogin", "/index", "/about", 
	                "/services", "/contact", "/assets/**", "/vendor/**", 
	                "/assets/css/**", "/assets/fonts/**", "/assets/js/**", 
	                "/assets/images/**", "/h2-console/**"  // Permit H2 Console
	            ).permitAll()
	            .requestMatchers("/test-ping").permitAll()
	            .requestMatchers("/secure/**", "/member/**").authenticated()
	            .requestMatchers("/enrolment/**", "/member/**", "/chits/**", "/settings/**")
	                .hasRole(ChunksFinanceConstants.SUPER_ADMIN)
	            .anyRequest().authenticated()
	        )
	        .formLogin(form -> form
	            .loginPage("/index")
	            .loginProcessingUrl("/perform_login")
	            .successHandler(loginSuccessHandler)
	            .failureHandler(customFailureHandler)
	            .permitAll()
	        )
	        .logout(logout -> logout
	            .logoutUrl("/perform_logout")
	            .logoutSuccessUrl("/financeLogin?logout")
	            .deleteCookies("JSESSIONID")
	            .invalidateHttpSession(true)
	        ) // Closing parenthesis for logout()
	        .csrf(csrf -> csrf
	            .csrfTokenRepository(new HttpSessionCsrfTokenRepository())
	            .ignoringRequestMatchers("/h2-console/**")  // Correct CSRF config
	        )
	        .headers(headers -> headers
	            .frameOptions().disable()  // Allow H2 frames
	        )
	        .userDetailsService(memberDetailsService); // Correct placement

	    http.exceptionHandling(exception -> exception
	        .accessDeniedPage("/error")
	    );

	    return http.build();
	}

	
	
	@Bean
	public SavedRequestAwareAuthenticationSuccessHandler savedRequestSuccessHandler() {
		SavedRequestAwareAuthenticationSuccessHandler handler = new SavedRequestAwareAuthenticationSuccessHandler();
		handler.setDefaultTargetUrl("/dashboard"); // Fallback URL after login
		handler.setAlwaysUseDefaultTargetUrl(false); // Respect saved request
		return handler;
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new Base64PasswordEncoder();
	}

}

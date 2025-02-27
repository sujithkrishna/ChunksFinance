package com.finance.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

import com.finance.exception.CustomAuthenticationFailureHandler;
import com.finance.handler.LoginSuccessHandler;
import com.finance.service.MemberDetailsService;
/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Configuration
public class FinanceSecurityConfig {

	private final MemberDetailsService memberDetailsService;
	
	private final CustomAuthenticationFailureHandler customFailureHandler;
	
	private final LoginSuccessHandler loginSuccessHandler;
	

	
    public FinanceSecurityConfig(MemberDetailsService memberDetailsService,CustomAuthenticationFailureHandler customFailureHandler,LoginSuccessHandler loginSuccessHandler) {
        this.memberDetailsService = memberDetailsService;
        this.customFailureHandler = customFailureHandler;
        this.loginSuccessHandler = loginSuccessHandler;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    	 http
         .authorizeHttpRequests(auth -> auth
             .requestMatchers("/views/**", "/financeLogin", "/css/**", "/js/**", "/images/**").permitAll()
             .requestMatchers("/test-ping").permitAll()
             .requestMatchers("/h2-console/**", "/secure/**", "/member/**").authenticated()
             .anyRequest().authenticated() // Secure all other endpoints
         )
         .formLogin(form -> form
             .loginPage("/financeLogin") // UNCOMMENTED: Custom login page
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
             .permitAll()
         )
         .csrf(csrf -> csrf
             .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
             .ignoringRequestMatchers("/h2-console/**")
         )
         .headers(headers -> headers
             .frameOptions().disable()
         )
         .userDetailsService(memberDetailsService); // Use custom UserDetailsService

     return http.build();
    }
    
    @Bean
    public SavedRequestAwareAuthenticationSuccessHandler savedRequestSuccessHandler() {
        SavedRequestAwareAuthenticationSuccessHandler handler = 
            new SavedRequestAwareAuthenticationSuccessHandler();
        handler.setDefaultTargetUrl("/dashboard"); // Fallback URL after login
        handler.setAlwaysUseDefaultTargetUrl(false); // Respect saved request
        return handler;
    }
    
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new Base64PasswordEncoder();
    }

}

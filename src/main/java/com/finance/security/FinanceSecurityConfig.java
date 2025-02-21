package com.finance.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Configuration
public class FinanceSecurityConfig {

	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
			http
	        .authorizeHttpRequests(auth -> auth
	            .requestMatchers("/views/**", "/financeLogin", "/css/**", "/js/**", "/images/**").permitAll()
	            .requestMatchers("/test-ping").permitAll()
	            .requestMatchers("/h2-console/**", "/secure/**","/member/**"	).authenticated()
	            .anyRequest().permitAll()
	        )
	        .formLogin(form -> form
	            //.loginPage("/login")  // UNCOMMENT THIS LINE ⭐️ KEY FIX ⭐️
	            .loginProcessingUrl("/perform_login")
	            .successHandler(savedRequestSuccessHandler())
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
                // Disable CSRF for H2 console if needed
                .ignoringRequestMatchers("/h2-console/**")
            )
            .headers(headers -> headers
                // Disable X-Frame-Options for H2 console
                .frameOptions().disable()
            );

        return http.build();
    }

    @Bean
    public SavedRequestAwareAuthenticationSuccessHandler savedRequestSuccessHandler() {
        SavedRequestAwareAuthenticationSuccessHandler handler = 
            new SavedRequestAwareAuthenticationSuccessHandler();
        handler.setDefaultTargetUrl("/"); // Fallback URL after login
        handler.setAlwaysUseDefaultTargetUrl(false); // Respect saved request
        return handler;
    }
}

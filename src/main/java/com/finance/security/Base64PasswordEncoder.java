package com.finance.security;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @author Sujith Krishna
 *
 * 27 Feb 2025
 *
 */
public class Base64PasswordEncoder implements PasswordEncoder {

    @Override
    public String encode(CharSequence rawPassword) {
        return Base64.getEncoder().encodeToString(rawPassword.toString().getBytes(StandardCharsets.UTF_8));
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        String rawEncoded = encode(rawPassword);
        return rawEncoded.equals(encodedPassword);
    }

}

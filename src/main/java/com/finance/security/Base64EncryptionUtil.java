package com.finance.security;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import org.springframework.stereotype.Component;
/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Component
public class Base64EncryptionUtil  {
	
	 /**
     * Encodes a plain text string using Base64.
     */
    public static String encrypt(String plainText) {
        return Base64.getEncoder().encodeToString(plainText.getBytes(StandardCharsets.UTF_8));
    }

    /**
     * Decodes a Base64 encoded string back to plain text.
     */
    public static String decrypt(String encodedText) {
        byte[] decodedBytes = Base64.getDecoder().decode(encodedText);
        return new String(decodedBytes, StandardCharsets.UTF_8);
    }
}

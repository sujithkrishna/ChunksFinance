package com.finance.security;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import org.springframework.stereotype.Component;
/**
 * @author Sujith Krishna
 *
 * 20 Feb 2025
 *
 */
@Component
public class AESEncryptionUtil {
	
	 private static final String AES = "AES";
	 private static SecretKey secretKey;

	    static {
	        try {
	            KeyGenerator keyGenerator = KeyGenerator.getInstance(AES);
	            keyGenerator.init(256);
	            secretKey = keyGenerator.generateKey();
	        } catch (Exception e) {
	            throw new RuntimeException("Error initializing AES key", e);
	        }
	    }

	    public  String encrypt(String plainText) throws Exception {
	        Cipher cipher = Cipher.getInstance(AES);
	        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
	        byte[] encryptedBytes = cipher.doFinal(plainText.getBytes());
	        return Base64.getEncoder().encodeToString(encryptedBytes);
	    }

	    public  String decrypt(String encryptedText) throws Exception {
	        Cipher cipher = Cipher.getInstance(AES);
	        cipher.init(Cipher.DECRYPT_MODE, secretKey);
	        byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedText));
	        return new String(decryptedBytes);
	    }

}

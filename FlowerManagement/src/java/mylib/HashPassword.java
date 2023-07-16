/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mylib;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Arrays;
import java.util.Base64;
import java.util.StringTokenizer;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 *
 * @author linh1
 */
public class HashPassword {
    public static String hashPassword (String passwordPara) throws NoSuchAlgorithmException, InvalidKeySpecException {
        SecureRandom random = new SecureRandom();
        byte[] saltByte = new byte[8];
        random.nextBytes(saltByte);
        
        KeySpec spec = new PBEKeySpec(passwordPara.toCharArray(), saltByte, 65536, 128);
        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        
        byte [] hashed = factory.generateSecret(spec).getEncoded();
        String hashedString = Base64.getEncoder().encodeToString(hashed);
        String salt = Base64.getEncoder().encodeToString(saltByte);
        return salt + ":" + hashedString;
        
    }
    
    public static String splitPassword(String password) {
        String result = null;
        StringTokenizer tokenizer = new StringTokenizer(password, ":");
        while (tokenizer.hasMoreTokens()) {
            String s = tokenizer.nextToken();
            result = String.valueOf(s.substring(0));
        }
        return result;
    }
    
    public static String Split2 (String password) {
        String [] arrStr = password.split(":");
        return arrStr[0];
    }
    public static String Split3 (String password) {
        String [] arrStr = password.split(":");
        return arrStr[1];
    }
    
    public static boolean checkPassword (String password, String hashedPassword) {
        String saltString = Split2(hashedPassword);
        String hashPassword  = Split3(hashedPassword);
        if (password == null || hashedPassword == null) {
            return false;
        }
        byte [] saltByte = Base64.getDecoder().decode(saltString);
        try {
            KeySpec spec = new PBEKeySpec(password.toCharArray(), saltByte, 65536, 128);
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
            byte [] hashed = factory.generateSecret(spec).getEncoded();
            String hashString = Base64.getEncoder().encodeToString(hashed);
            String fullHash = saltString + ":" + hashString;
            if (fullHash.equals(hashedPassword)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}

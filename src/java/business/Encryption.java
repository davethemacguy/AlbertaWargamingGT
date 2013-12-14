package business;

import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryption {

    private String passWordHash;

    public Encryption() {
        this.passWordHash = null;
    }


    public String getPassWordHash() {
        return this.passWordHash;
    }

    public void setPassWordHash(int iterationNb, String password, long salt) throws
            NoSuchAlgorithmException, UnsupportedEncodingException {

        byte[] rawSalt = ByteBuffer.allocate(8).putLong(salt).array();
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        digest.reset();
        digest.update(rawSalt);
        byte[] input = digest.digest(password.getBytes("UTF-8"));
        for (int i = 0; i < iterationNb; i++) {
            digest.reset();
            input = digest.digest(input);
        }

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < input.length; i++) {
            sb.append(Integer.toString((input[i] & 0xff) + 0x100, 16).substring(1));
        }
        this.passWordHash = sb.toString();
    }
}
package package1;

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
public class enterkey {
   // String ptext="rahul";
    String text="asdf";
    byte[] encrypted;
    public String cipertext(String a){
        try{
        text=a;
        String key="Bar12345Bar12345";
        Key aesKey=new SecretKeySpec(key.getBytes(),"AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, aesKey);
        encrypted = cipher.doFinal(text.getBytes());
       // System.out.println(encrypted);
       text=new String(encrypted);
    }
    catch(Exception e){
      e.printStackTrace();
    }
       return text;
    } 
}

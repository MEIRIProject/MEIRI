package com.meiri.jsp.common;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {

    public EncryptWrapper(HttpServletRequest request) {
        super(request);
    }

    @Override
    public String getParameter(String name) {
        // 사용자가 입력한 값 중 비밀번호만 따로 빼내서
        // 암호화 처리 후 다시 덮어 씌우는 작업
        if (name != null && name.equals("userPwd")) {
            // 암호화 코드 실행
            return getSHA512(super.getParameter(name));
        } else {
            return super.getParameter(name);
        }
    }

    // 암호화를 위한 SHA-512 로직 작성
    private static String getSHA512(String pwd) {

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
            md.update(bytes);

            return Base64.getEncoder().encodeToString(md.digest());

        } catch (NoSuchAlgorithmException e) {

            System.out.println("암호화 에러 발생!");
            e.printStackTrace();

            return null;
        }
    }

}

package com.meiri.jsp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {
   
   private static final long serialVersionUID = 1004L;
   
   private String userId;   
   private String passWord;  
   private String userName;
   private String address;   
   private String email;    
   private int birth;         
   private String phone;    
   
   public Member() { }
   

   public Member(String userId, String passWord) {
	super();
	this.userId = userId;
	this.passWord = passWord;
}

public Member(String userId, String passWord, String userName, String address, String email, int birth, String phone) {
	super();
	this.userId = userId;
	this.passWord = passWord;
	this.userName = userName;
	this.address = address;
	this.email = email;
	this.birth = birth;
	this.phone = phone;
}

@Override
public String toString() {
	return "Member [userId=" + userId + ", passWord=" + passWord + ", userName=" + userName + ", address=" + address
			+ ", email=" + email + ", birth=" + birth + ", phone=" + phone + "]";
}

public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
}

public String getPassWord() {
	return passWord;
}

public void setPassWord(String passWord) {
	this.passWord = passWord;
}

public String getUserName() {
	return userName;
}

public void setUserName(String userName) {
	this.userName = userName;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public int getBirth() {
	return birth;
}

public void setBirth(int birth) {
	this.birth = birth;
}

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}
   
   
public String randomPwd() {
	 char pwCollection1[] = new char[] { 
                      '1','2','3','4','5','6','7','8','9','0'};
    char pwCollection2[] = new char[] { 
                      'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', 
                      'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
    char pwCollection3[] = new char[] { 
                      '!','@','#','$','%','^','=','*','-','?'};
    String u_pwd1 = "";
    String u_pwd2 = "";
    String u_pwd3 = "";
    for (int i = 0; i < 3; i++) {
    int selectRandomPw1 = (int)(Math.random()*(pwCollection1.length));//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다. 
        u_pwd1 += pwCollection1[selectRandomPw1]; 
    }
    for (int i = 0; i < 3; i++) {
    int selectRandomPw2 = (int)(Math.random()*(pwCollection2.length));//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다. 
    u_pwd2 += pwCollection2[selectRandomPw2]; 
    }  
    for (int i = 0; i < 3; i++) {
    int selectRandomPw3 = (int)(Math.random()*(pwCollection3.length));//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다. 
    u_pwd3 += pwCollection3[selectRandomPw3]; 
    }
    return u_pwd1+u_pwd2+u_pwd3; 
}
  
}
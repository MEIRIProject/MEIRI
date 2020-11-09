package com.meiri.jsp.inquiry.model.vo;

import java.io.Serializable;

public class inquiry implements Serializable {

	private static final long serialVersionUID = 11010L;
	
	/**
	 * 만약 DB 테이블의 정보와 다르게
	 * VO에 더 많은 값을 담아야 하거나,
	 * DB의 JOIN한 결과를 담고자 한다면
	 * VO의 필드 변수는 관련 테이블과 반드시 1:1
	 * 로 연결 시키지 않아도 된다.
	 * 즉, 컬럼 : 필드 변수 != 1 : 1
	 */
	private int cCode;			// 문의글 번호           
	private String userId;         	// 사용자 아이디
	private String adminId;     	// 관리자 아이디
	private String cTitle;    // 제목
	private String cContent;   	// 내용
	
	public inquiry() {}
	
	public inquiry(int cCode, String userId, String adminId, String cTitle, String cContent) {
		super();
		this.cCode = cCode;
		this.userId = userId;
		this.adminId = adminId;
		this.cTitle = cTitle;
		this.cContent = cContent;
	}

	@Override
	public String toString() {
		return "inquiry [cCode=" + cCode + ", userId=" + userId + ", adminId=" + adminId + ", cTitle=" + cTitle
				+ ", cContent=" + cContent + "]";
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}

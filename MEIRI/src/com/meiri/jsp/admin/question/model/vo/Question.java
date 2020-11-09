package com.meiri.jsp.admin.question.model.vo;

import java.io.Serializable;

public class Question implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int qno;
	private String qwriter;	// ADMINID
	private String qtitle;	// QTITLE
	private String qanswer;	// QCONTENT
	
	
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Question(int qno, String qwriter, String qtitle, String qanswer) {
		super();
		this.qno = qno;
		this.qwriter = qwriter;
		this.qtitle = qtitle;
		this.qanswer = qanswer;
	}
	

	public Question(String qwriter, String qtitle, String qanswer) {
		super();
		this.qwriter = qwriter;
		this.qtitle = qtitle;
		this.qanswer = qanswer;
	}


	public int getQno() {
		return qno;
	}


	public void setQno(int qno) {
		this.qno = qno;
	}


	public String getQwriter() {
		return qwriter;
	}


	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}


	public String getQtitle() {
		return qtitle;
	}


	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}


	public String getQanswer() {
		return qanswer;
	}


	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}
}

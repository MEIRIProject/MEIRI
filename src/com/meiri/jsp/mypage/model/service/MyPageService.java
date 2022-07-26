package com.meiri.jsp.mypage.model.service;

import static com.meiri.jsp.common.JDBCTemplate.close;
import static com.meiri.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.meiri.jsp.mypage.model.dao.MyPageDAO;
import com.meiri.jsp.review.model.vo.Review;
import com.meiri.jsp.review.model.vo.ReviewView;

public class MyPageService {
	
	private Connection con;
    private MyPageDAO mDAO = new MyPageDAO();
    
	public ArrayList<ReviewView> mypageSelectReview(String userid) {
		con = getConnection();
		
		ArrayList<ReviewView> rlist = mDAO.mypageSelectReview(con, userid);
		
		close(con);
		
		return rlist;
	}
    
    
}
	

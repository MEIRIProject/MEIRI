package com.meiri.jsp.review.model.service;


import static com.meiri.jsp.common.JDBCTemplate.close;
import static com.meiri.jsp.common.JDBCTemplate.commit;
import static com.meiri.jsp.common.JDBCTemplate.getConnection;
import static com.meiri.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.meiri.jsp.review.model.dao.ReviewDAO;
import com.meiri.jsp.review.model.vo.Review;
import com.meiri.jsp.review.model.vo.ReviewView;
import com.meiri.jsp.review.model.vo.reviewFile;

public class ReviewService {
	
	private Connection con;
	private ReviewDAO rDAO = new ReviewDAO();
	


	public ArrayList<ReviewView> selectList(int pcode) {
		con = getConnection();
		
		ArrayList<ReviewView> list = rDAO.selectList(con, pcode);
		
		close(con);
		return list;
	}
	


	public int insertReview(Review r, reviewFile rF) {
		con = getConnection();
		int result = 0;
		// 저장해야 될 것 이 두 가지 ( 사진 게시글 , 첨부파일 여러 개) 
		// 1. 사진 게시글 저장
		int result1 = rDAO.insertReview(con, r);
		
		
		if(result1 > 0) {
			int rcode = rDAO.getCurrentRcode(con);
			
			rF.setRcode(rcode);
		}

		int result2 = 0;
		
		if(rF.getChangename() != null) {
			result2 = rDAO.insertReviewFile(con, rF);
		}
		
		result = result1 * result2;
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);	
		
		
		return result;
		
	}
	
}

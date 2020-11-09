package com.meiri.jsp.review.model.service;


import static com.meiri.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.meiri.jsp.review.model.dao.ReviewDAO;
import com.meiri.jsp.review.model.vo.Review;
import com.meiri.jsp.review.model.vo.productFile;

public class ReviewService {
	
	private Connection con;
	private ReviewDAO rDAO = new ReviewDAO();
	


	public ArrayList<Review> selectList(int pcode) {
		con = getConnection();
		
		ArrayList<Review> list = rDAO.selectList(con, pcode);
		
		close(con);
		return list;
	}
	


	public int insertReview(Review r, ArrayList<productFile> list) {
		con = getConnection();
		
		
		
		// 저장해야 될 것 이 두 가지 ( 사진 게시글 , 첨부파일 여러 개) 
		// 1. 사진 게시글 저장
		int result = rDAO.insertReview(con, r);	
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);	
		
		
		return result;
		
	}




	

	
	
}

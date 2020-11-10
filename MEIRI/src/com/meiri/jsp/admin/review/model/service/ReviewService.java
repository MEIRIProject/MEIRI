package com.meiri.jsp.admin.review.model.service;

import static com.meiri.jsp.common.JDBCTemplate.close;
import static com.meiri.jsp.common.JDBCTemplate.commit;
import static com.meiri.jsp.common.JDBCTemplate.getConnection;
import static com.meiri.jsp.common.JDBCTemplate.rollback;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;

import com.meiri.jsp.admin.review.model.dao.ReviewDAO;
import com.meiri.jsp.review.model.vo.ReviewView;
import com.meiri.jsp.review.model.vo.reviewFile;

public class ReviewService {
	
	private Connection con;
	private ReviewDAO rdao = new ReviewDAO();
	
	public int getListCount() {
		
		con = getConnection();
		
		int result = rdao.getListCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<ReviewView> selectList(int currentPage, int limit) {
		
		con = getConnection();
		
		ArrayList<ReviewView> r = rdao.selectList(currentPage, limit, con);
		
		close(con);
		
		return r;
	}


	public int deleteReview(int rno, String savePath) {
		
		con = getConnection();
		int result2 = 0;
		// 리뷰 파일 조회 해야돼
		reviewFile rf = rdao.selectReviewFile(rno, con);
		
		if(rf.getChangename() != null) {
			
			result2 = rdao.deleteReviewFile(rno, con);
			
		} else {
			result2 = 1;
		}
		
		int result = 0;
		
		if(result2 > 0) {
			
			result = rdao.deleteReview(rno, con);
			 if(result > 0) {
				 commit(con);
				 
				 File f = new File(savePath + rf.getChangename());
					
				 f.delete();
				 
			 } else {
				 rollback(con);
			 }
		}
			
		
		close(con);
		
		int result3 = result*result2;
		
		System.out.println("result3 = " + result3);
		
		return result3;
	} 
	
}

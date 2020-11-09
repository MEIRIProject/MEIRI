package com.meiri.jsp.admin.review.model.service;

import static com.meiri.jsp.common.JDBCTemplate.close;
import static com.meiri.jsp.common.JDBCTemplate.commit;
import static com.meiri.jsp.common.JDBCTemplate.getConnection;
import static com.meiri.jsp.common.JDBCTemplate.rollback;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.meiri.jsp.admin.review.model.dao.ReviewDAO;
import com.meiri.jsp.admin.review.model.vo.Attachment;
import com.meiri.jsp.admin.review.model.vo.Review;

public class ReviewService {
	
	private Connection con;
	private ReviewDAO rdao = new ReviewDAO();
	
	public int getListCount() {
		
		con = getConnection();
		
		int result = rdao.getListCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Review> selectList(int currentPage, int limit) {
		
		con = getConnection();
		
		ArrayList<Review> r = rdao.selectList(currentPage, limit, con);
		
		close(con);
		
		return r;
	}

	public HashMap<String, Object> selectOne(int rno) {

		con = getConnection();
		
		HashMap<String, Object> r = rdao.selectOne(rno, con);
		
		close(con);
		
		return r;
	}

	public int deleteReview(int rno, String savePath) {
		
		con = getConnection();
		
		HashMap<String, Object> hmap = rdao.selectOne(rno, con);
		
		int result = rdao.deleteReview(rno, con);
		
		if(result > 0) {
			// 게시글 삭제가 완료되었다면, 첨부파일도 삭제한다.
			
			ArrayList<Attachment> list = (ArrayList<Attachment>)hmap.get("attachment");
			
			for(Attachment a : list) {
				File f = new File(savePath + a.getChangename());
				
				f.delete();
			}
			
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	} 
	
}

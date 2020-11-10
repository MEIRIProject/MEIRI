package com.meiri.jsp.admin.product.model.service;

import static com.meiri.jsp.common.JDBCTemplate.close;
import static com.meiri.jsp.common.JDBCTemplate.commit;
import static com.meiri.jsp.common.JDBCTemplate.getConnection;
import static com.meiri.jsp.common.JDBCTemplate.rollback;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.meiri.jsp.admin.product.model.dao.ProductDAO;
import com.meiri.jsp.admin.product.model.vo.Product;
import com.meiri.jsp.admin.product.model.vo.ProductFile;

public class ProductService {
	private Connection con;
	private ProductDAO pDAO = new ProductDAO();
	
	
	public int getListCount() {
		
		con = getConnection();
		
		int result = pDAO.getListCount(con);
		
		close(con);
		
		return result;
	}


	public ArrayList<Product> selectList(int currentPage, int limit) {
		con = getConnection();
		
		ArrayList<Product> list = pDAO.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}


	public int insertProduct(Product t, ProductFile[] list, String aid, String content) {
		
		con = getConnection();
		int result = 0;
		
		// 1. 사진 게시글 저장
		int result1 = pDAO.insertProduct(con, t, content, aid);
		
		if(result1 > 0) {
			int bno = pDAO.getCurrentBno(con);
			
			for(int i = 0; i < list.length; i++) {
				list[i].setPcode(bno);
			}
		}
			
		// 2. 첨부파일 여러개 저장
		int result2 = 0;
		for(int i = 0 ; i < list.length; i++) {
			// 첫번째 이미지는 대표 이미지 (flevel = 0 )
			// 중간은 서브이미지 (flevel = 1 )
			// 마지막 이미지는 설명 이미지 (flevel = 2 )
			
			if (list[i].getChangename() != null) {
			
				if(i == 0)
					list[i].setFlevel(0);
				else if(i == 4)
					list[i].setFlevel(2);
				else
					list[i].setFlevel(1);
				
				result2 = pDAO.insertProductFile(con, list[i]);
				
				if( result2 == 0 ) break; // 잘못 실행된 행이 있다면 반복(insert) 취소! 
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
			
		return result;
		
	}


	public HashMap<String, Object> selectOne(int pno) {
		
		con = getConnection();
		
		HashMap<String,Object> hmap = pDAO.selectOne(con, pno);
		
		close(con);
		
		return hmap;
	}


	public HashMap<String, Object> getUpdateView(int pno) {
		con = getConnection();
		
		HashMap<String, Object> hmap = pDAO.selectOne(con, pno);
		
		close(con);
		
		return hmap;
	}


	public int updateProduct(Product t, ProductFile[] list, String aid, String content) {
		int totalResult = 0;
		
		con = getConnection();
		
		int result1 = pDAO.updateProduct(con , t, aid, content);
		
		System.out.println("result1 = " + result1);
		
		int pno = t.getPno();
		
		if(result1 > 0 ) {
			int result2 = 0;
			
			result2 = pDAO.deleteProductFile(con, pno);
			
			for(int i = 0 ; i < list.length; i++) {
				// 첫번째 이미지는 대표 이미지 (flevel = 0 )
				// 중간은 서브이미지 (flevel = 1 )
				// 마지막 이미지는 설명 이미지 (flevel = 2 )
				if(list[i] != null) {
					list[i].setPcode(pno);
					if(i == 0)
						list[i].setFlevel(0);
					else if(i == 4)
						list[i].setFlevel(2);
					else
						list[i].setFlevel(1);
					
					result2 = pDAO.insertProductFile(con, list[i]);
					
					if( result2 == 0 ) break; // 잘못 실행된 행이 있다면 반복(insert) 취소! 
				}
			}
			
			if(result2 > 0) {
				commit(con);
				totalResult = 1;
			} else rollback(con);
		}
		
		close(con);
		
		return totalResult;
	}


	public int deleteProduct(int pno, String savePath, String aid, String content) {
		
		con = getConnection();
		
		int result2 = 0;
		int result = 0;
		
		HashMap<String, Object> hmap = pDAO.selectOne(con, pno);
		
		ProductFile[] list = 
				(ProductFile[])hmap.get("productfile");
		
		result = pDAO.deleteProductFile(con, pno);
		
		System.out.println("result = " + result);
		
		if(result > 0) {
			
			result2 = pDAO.deleteProduct(con, pno, aid, content);
			
			if(result2 > 0) {
				
				for(ProductFile a : list) {
					if(a != null) {
						File f = new File(savePath + a.getChangename());
						
						f.delete();
					}
				}
				commit(con);
			} else {
				rollback(con);
			}
			
			
		} else {
			rollback(con);
		}
		
		close(con);
		
		int result3 = result*result2;
		
		System.out.println("result3 = " + result3);
		
		return result3;	
	}

}

package com.meiri.jsp.product.model.service;

import static com.meiri.jsp.common.JDBCTemplate.close;
import static com.meiri.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.meiri.jsp.product.model.dao.ProductDAO;
import com.meiri.jsp.product.model.vo.Product;
import com.meiri.jsp.product.model.vo.ProductFilesList;
import com.meiri.jsp.product.model.vo.ProductView;

public class ProductService {
   private Connection con;
   private ProductDAO pDAO = new ProductDAO();
   

      
      public Product selectOne(int pcode) {
         con = getConnection();
         
         Product p = pDAO.selectOne(con,pcode);
         
         close(con);
         return p;
      }
	

      public ArrayList<ProductView> productSelectList() {
    	  con = getConnection();
    	  
    	  ArrayList<ProductView> pvlist = pDAO.productSelectList(con);
    	  
    	  close(con);
		return pvlist;
	}


	public ProductFilesList productDetailImageList1(int pcode) {
		con = getConnection();
		
		ProductFilesList pf1 = pDAO.productDetailImageList1(con, pcode);
		
		
		
		close(con);
		
		return pf1;
	}


	public ArrayList<ProductFilesList> productDetailImageList2(int pcode) {
		con = getConnection();
		
		ArrayList<ProductFilesList> pf2 = pDAO.productDetailImageList2(con, pcode);
		
		close(con);
		return pf2;
	}


	public ProductFilesList productDetailImageList3(int pcode) {
		con = getConnection();
		
		ProductFilesList pf3 = pDAO.productDetailImageList3(con, pcode);
		
		close(con);
		return pf3;
	}
	

	public ProductFilesList[] selectList(int pcode) {
		
		con = getConnection();
		
		ProductFilesList[] list = new ProductFilesList[5];
		
		list = pDAO.PFselectList(con, pcode);
		
		close(con);
				
		return list;
	}
      
   
   
}
      
   
   

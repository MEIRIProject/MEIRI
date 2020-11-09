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
      
   
   
}
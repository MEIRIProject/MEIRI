package com.meiri.jsp.product.model.dao;
   
   import static com.meiri.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meiri.jsp.product.model.vo.Product;
import com.meiri.jsp.product.model.vo.ProductFilesList;
import com.meiri.jsp.product.model.vo.ProductView;
   
   public class ProductDAO {
   private Properties prop;
      
      public ProductDAO() {
         prop = new Properties();
         
         String filePath = ProductDAO.class
                             .getResource("/config/product-sql.properties")
                                 .getPath(); 
         
         try {
            prop.load(new FileReader(filePath));
         } catch (FileNotFoundException e) {
            e.printStackTrace();
         } catch (IOException e) {
            e.printStackTrace();
         }
         
      }
   
      public Product selectOne(Connection con, int pcode) {
         
         Product p = null;
         PreparedStatement pstmt = null;
         ResultSet rset = null;
         
   
         String sql = prop.getProperty("productSelectOne");
         
         try {
            pstmt = con.prepareStatement(sql);
            
            pstmt.setInt(1, pcode);
            
            rset = pstmt.executeQuery();
            
            if ( rset.next() ) {
               p = new Product();
               
               p.setPcode(         rset.getInt("pcode"));
               p.setPname(     rset.getString("pname"));
               p.setPrice(      rset.getInt("price"));
               p.setPtypea(      rset.getString("ptypea"));
               p.setPtypeb(      rset.getString("ptypeb"));
               p.setPtypec(      rset.getString("ptypec"));
               p.setPcolor(    rset.getString("pcolor"));
               p.setPtitle( rset.getNString("ptitle"));
               
               
            }
            
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            close(rset);
            close(pstmt);
         }      
         System.out.println(p);
         return p;
      }

	public ArrayList<ProductView> productSelectList(Connection con) {
			ArrayList<ProductView> pvlist = new ArrayList<>();
			 ProductView pv = null;
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;

	         String sql = prop.getProperty("productSelectList");
	         
	         try {
	        	pstmt = con.prepareStatement(sql);
	        	 
				rset = pstmt.executeQuery();
				
				while ( rset.next() ) {
		               pv = new ProductView();
		               
		               pv.setPcode(rset.getInt("pcode"));
		               pv.setPname(rset.getString("pname"));
		               pv.setPtitle(rset.getString("ptitle"));
		               pv.setChangename(rset.getString("changename"));
		               
		               pvlist.add(pv);
		         }
				
				System.out.println(pvlist);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
	         
	         
		return pvlist;
	}

	public ProductFilesList productDetailImageList1(Connection con, int pcode) {
		ProductFilesList pf1 = new ProductFilesList();
        PreparedStatement pstmt = null;
        ResultSet rset = null;
		
        String sql = prop.getProperty("productDetailImageList1");
        
        try {
        	pstmt = con.prepareStatement(sql);
        	
        	pstmt.setInt(1, pcode);
        	
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pf1.setFcode(rset.getInt("fcode"));
				pf1.setPcode(rset.getInt("pcode"));
				pf1.setFilepath(rset.getString("filepath"));
				pf1.setOriginname(rset.getString("originname"));
				pf1.setChangename(rset.getString("changename"));
				pf1.setFlevel(rset.getInt("flevel"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
        
		
		return pf1;
	}

	public ArrayList<ProductFilesList> productDetailImageList2(Connection con, int pcode) {
		ArrayList<ProductFilesList> pf2 = new ArrayList<ProductFilesList>();
		ProductFilesList pfl = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("productDetailImageList2");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pcode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pfl = new ProductFilesList();
				
				pfl.setFcode(rset.getInt("fcode"));
				pfl.setPcode(rset.getInt("pcode"));
				pfl.setFilepath(rset.getString("filepath"));
				pfl.setOriginname(rset.getString("originname"));
				pfl.setChangename(rset.getString("changename"));
				pfl.setFlevel(rset.getInt("flevel"));
				
				pf2.add(pfl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return pf2;
	}

	public ProductFilesList productDetailImageList3(Connection con, int pcode) {
		ProductFilesList pf3 = new ProductFilesList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("productDetailImageList3");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pcode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pf3.setFcode(rset.getInt("fcode"));
				pf3.setPcode(rset.getInt("pcode"));
				pf3.setFilepath(rset.getString("filepath"));
				pf3.setOriginname(rset.getString("originname"));
				pf3.setChangename(rset.getString("changename"));
				pf3.setFlevel(rset.getInt("flevel"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return pf3;
	}
       }
package com.meiri.jsp.admin.product.model.dao;

import static com.meiri.jsp.common.JDBCTemplate.close;
import static com.meiri.jsp.common.JDBCTemplate.rollback;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.meiri.jsp.admin.product.model.vo.Product;
import com.meiri.jsp.admin.product.model.vo.ProductFile;

public class ProductDAO {
private Properties prop;
	
	public ProductDAO() {
		prop = new Properties();
		
		String filePath = ProductDAO.class
								  .getResource("/config/product-sql.properties")
				                  .getPath(); // DB 완성 후 작성
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public int getListCount(Connection con) {
		int result = 0; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 이거 DB 완성 후 작성
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Product> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 이거 DB 완성 후 작성
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Product p = new Product();
				
				p.setPno(	rset.getInt("pcode"));
				p.setPname(	rset.getString("pname"));
				p.setPprice(rset.getInt("price"));
				p.setPtypea(rset.getString("ptypea"));
				p.setPtypeb(rset.getString("ptypeb"));
				p.setPtypec(rset.getString("ptypec"));
				p.setPcolor(rset.getString("pcolor"));
				p.setPtitle(rset.getString("ptitle"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return list;
	}


	public int insertProduct(Connection con, Product p, String pmc, String aid) {
		
		int result = 0;
		int result1 = 0;
		
		PreparedStatement pstmt = null;
		
		String sql1 = prop.getProperty("insertProduct");
		
		try {
			pstmt = con.prepareStatement(sql1);
			
			pstmt.setString( 1, p.getPname());
			pstmt.setInt(	 2, p.getPprice());
			pstmt.setString( 3, p.getPtypea());
			pstmt.setString( 4, p.getPtypeb());
			pstmt.setString( 5, p.getPtypec());
			pstmt.setString( 6, p.getPcolor());
			pstmt.setString( 7, p.getPtitle());
			
			result1 = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		int result2 = 0;
		String sql2 = prop.getProperty("insertInPmanage");
		
		if(result1 > 0) {
		
			try {
				pstmt = con.prepareStatement(sql2);
				
				pstmt.setString(1, aid);
				pstmt.setString(2, pmc);
				
				
				result2 = pstmt.executeUpdate();
				
			} catch (SQLException e) {
	
				e.printStackTrace();
				rollback(con);
			} finally {
				close(pstmt);
			}
		}
		
		result = result1 * result2;
		
		return result;
	}
	
	public int getCurrentBno(Connection con) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("currentBno");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return result;
	}
	
	public int insertProductFile(Connection con, ProductFile productFile) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProductFile");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(	1, productFile.getPcode());
			pstmt.setString(2, productFile.getFilepath());
			pstmt.setString(3, productFile.getOriginname());
			pstmt.setString(4, productFile.getChangename());
			pstmt.setInt(	5, productFile.getFlevel());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}
	
	
	public HashMap<String, Object> selectOne(Connection con, int pno) {
		
		HashMap<String, Object> hmap = new HashMap<>();
		ProductFile[] list = new ProductFile[5];
		Product t = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			
			rset = pstmt.executeQuery();
			int a = 0;
			while(rset.next()) {
				
				t = new Product();
				
				t.setPno(pno);
				t.setPname(  rset.getString("pname"));
				t.setPtitle( rset.getString("ptitle"));
				t.setPprice( Integer.parseInt(rset.getString("price")));
				t.setPtypea( rset.getString("ptypea"));
				t.setPtypeb( rset.getString("ptypeb"));
				t.setPtypec( rset.getString("ptypec"));
				t.setPcolor( rset.getString("pcolor"));
				
				
				
				// ---- 여기까지가 게시글 내용
				
				ProductFile at = new ProductFile();
				
				at.setFcode( 	  rset.getInt("fcode"));
				at.setPcode( 	  pno );
				at.setOriginname( rset.getString("originname"));
				at.setChangename( rset.getString("changename"));
				at.setFilepath(   rset.getString("filepath"));
				at.setFlevel(     rset.getInt("flevel"));
				
				if(rset.getInt("flevel") == 2) {
					list[4] = at;
				} else {
					list[a] = at;
				}
				
				a++;
			}
			
			hmap.put("product", t);
			hmap.put("productfile", list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return hmap;
	}
	
	public int updateProduct(Connection con, Product p, String aid, String content) {
		int result = 0;
		int result1 = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateProduct");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString( 1, p.getPname());
			pstmt.setInt(	 2, p.getPprice());
			pstmt.setString( 3, p.getPtypea());
			pstmt.setString( 4, p.getPtypeb());
			pstmt.setString( 5, p.getPtypec());
			pstmt.setString( 6, p.getPcolor());
			pstmt.setString( 7, p.getPtitle());
			pstmt.setInt(	 8, p.getPno());
			
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int result2 = 0;
		String sql2 = prop.getProperty("insertPmanage");
		
		if(result1 > 0) {
		
			try {
				pstmt = con.prepareStatement(sql2);
				
				pstmt.setString(1, aid);
				pstmt.setInt(	2, p.getPno());
				pstmt.setString(3, content);
				
				
				result2 = pstmt.executeUpdate();
				
			} catch (SQLException e) {
	
				e.printStackTrace();
				rollback(con);
			} finally {
				close(pstmt);
			}
		}
		
		result = result1 * result2;
		
		return result;
	}
	public int deleteProductFile(Connection con, int pno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteProductFile");
		System.out.println("pno = " + pno);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteProduct(Connection con, int pno, String aid, String content) {
		
		int result1 = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPmanage");
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, aid);
			pstmt.setInt(	2, pno);
			pstmt.setString(3, content);
			
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		int result2 = 0;
		String sql2 = prop.getProperty("deleteProduct");
		
		if(result1 > 0) {
		
			try {
				pstmt = con.prepareStatement(sql2);
				
				pstmt.setInt(1, pno);
				
				result2 = pstmt.executeUpdate();
				
			} catch (SQLException e) {
	
				e.printStackTrace();
				rollback(con);
			} finally {
				close(pstmt);
			}
		}
		
		int result = result1 * result2;
		
		return result;
	}
	
}

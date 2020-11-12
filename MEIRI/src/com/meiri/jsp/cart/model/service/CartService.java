package com.meiri.jsp.cart.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.meiri.jsp.cart.model.dao.CartDAO;
import com.meiri.jsp.cart.model.vo.Cart;
import com.meiri.jsp.cart.model.vo.CartView;

import static com.meiri.jsp.common.JDBCTemplate.*;

public class CartService {
	
	private Connection con;
	private CartDAO cDAO = new CartDAO();
	
	public String InsertCart(Cart ca) {
		
		con = getConnection();
		
		// 이전에 같은 상품을 장바구니에 담았는지 확인
		int result1 = cDAO.selectCartQuantity(con, ca);
		
		int result2 = 0;
		
		String result = "";
		
		if(result1 > 0) {
			// 이전에 같은 상품을 장바구니에 담았었음
			// 이전에 담은 장바구니에 수량만 증가시킴
			result2 = cDAO.updateCartCount(con, ca, result1);
			
			if(result2 > 0) {
				// 수량만 증가시킴
				result = "한 번 더 담으셨네요!\n장바구니 수량이 " + result1 
					   + "개가 되었습니다";
				commit(con);
			} else {
				// 수량 증가 못시킴
				result = "장바구시 수량 증가를 실패했습니다";
				rollback(con);
			}
			
		} else {
			// 이 제품을 장바구니에 처음 담음
			result2 = cDAO.insertCart(con, ca);
			
			if(result2 > 0) {
				// 장바구니에 새 제품 잘 넣음
				result = "장바구니에 상품이 담겼습니다";
				commit(con);
			} else {
				// 잘 못넣음
				result = "장바구니 추가에 실패하였습니다";
				rollback(con);
			}
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<CartView> selectCartList(String userid) {
		
		ArrayList<CartView> cav = null;
		
		con = getConnection();
		
		cav = cDAO.selectCartList(userid, con);
		
		close(con);
		
		return cav;
	}

	public String deleteCart(int cartcode) {
		
		con = getConnection();
		String yes = "";
		int result = cDAO.deleteCart(con, cartcode);
		
		if(result > 0) {
			yes = "상품이 삭제되었습니다";
		} else {
			yes = "상품 삭제를 실패하였습니다";
		}
		
		close(con);
		
		return yes;
	}
	
}

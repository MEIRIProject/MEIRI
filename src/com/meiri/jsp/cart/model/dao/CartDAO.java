package com.meiri.jsp.cart.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meiri.jsp.cart.model.vo.Cart;
import com.meiri.jsp.cart.model.vo.CartView;

import static com.meiri.jsp.common.JDBCTemplate.close;

public class CartDAO {

    private Properties prop;

    public CartDAO() {

        prop = new Properties();

        String filePath = CartDAO.class
                .getResource("/config/cart-sql.properties")
                .getPath();

        try {
            prop.load(new FileReader(filePath));

        } catch (FileNotFoundException e) {

            e.printStackTrace();
        } catch (IOException e) {

            e.printStackTrace();
        }
    }

    public int insertCart(Connection con, Cart ca) {

        int result = 0;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("insertCart");

        try {
            pstmt = con.prepareStatement(sql);


            pstmt.setString(1, ca.getUserid());
            pstmt.setInt(2, ca.getFcode());
            pstmt.setInt(3, ca.getPcode());
            pstmt.setInt(4, ca.getQuantity());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }

    public int selectCartQuantity(Connection con, Cart ca) {

        ResultSet rset = null;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("selectCart");

        int Qcount = 0;

        try {
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, ca.getPcode());
            pstmt.setString(2, ca.getUserid());

            rset = pstmt.executeQuery();

            if (rset.next()) {
                Qcount = rset.getInt("c_quantity") + ca.getQuantity();
                close(rset);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }
        return Qcount;
    }

    public int updateCartCount(Connection con, Cart ca, int result1) {

        int result = 0;
        PreparedStatement pstmt = null;
        String sql = prop.getProperty("updateCartCount");

        try {
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, result1);
            pstmt.setInt(2, ca.getPcode());
            pstmt.setString(3, ca.getUserid());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }

    public ArrayList<CartView> selectCartList(String userid, Connection con) {

        ArrayList<CartView> cav = new ArrayList<>();
        ResultSet rset = null;
        PreparedStatement pstmt = null;
        CartView ca = null;

        String sql = prop.getProperty("selectCartList");

        try {
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, userid);

            rset = pstmt.executeQuery();

            while (rset.next()) {
                ca = new CartView();

                ca.setPcode(rset.getInt("pcode"));
                ca.setCartcode(rset.getInt("cartcode"));
                ca.setChangename(rset.getString("changename"));
                ca.setPname(rset.getString("pname"));
                ca.setPprice(rset.getInt("price"));
                ca.setPtitle(rset.getString("ptitle"));
                ca.setQuantity(rset.getInt("c_quantity"));

                cav.add(ca);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return cav;
    }


    public int deleteCart(Connection con, int cartcode) {

        int result = 0;
        PreparedStatement pstmt = null;

        String sql = prop.getProperty("deleteCart");

        try {
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, cartcode);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }


}

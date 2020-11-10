package com.meiri.jsp.member.model.service;

import static com.meiri.jsp.common.JDBCTemplate.*;


import java.sql.Connection;

import com.meiri.jsp.common.exception.MemberException;
import com.meiri.jsp.member.model.dao.MemberDAO;
import com.meiri.jsp.member.model.vo.Member;

public class MemberService {
   // 1. 찾아갈 데이터베이스 객체 선언
      private Connection con;
      private MemberDAO mDAO = new MemberDAO();
      
      public Member selectMember(Member m) {
         
         con = getConnection();
         
         Member result = mDAO.selectMember(con, m);
         
         close(con);
         
         return result;
         
      }

      public int insertMember(Member joinMember) throws MemberException {
         
         con = getConnection();
         int result = mDAO.insertMember(con, joinMember);
         
         if( result > 0 ) { // 회원 가입 성공!
            commit(con);
         } else {           // 회원 가입 실패...
            rollback(con);
         }
         
         close(con);
         
         return result;
      }

      public int updateMember(Member m) throws MemberException { 
         con = getConnection(); 
         
         int result = mDAO.updateMember(con, m); 
         
         if(result > 0) { 
            commit(con);
         } else {
            rollback(con);
         } 
         
         close(con);
         
         return result;
      }

      public int deleteMember(String userId) throws MemberException {
         
         con = getConnection();
         
         int result = mDAO.deleteMember(con, userId);
         
         if( result > 0 ) {
            commit(con);
         } else {
            rollback(con);
         }
         
         close(con);
         
         return result;
      }

      public int idDupCheck(String id) {
         con = getConnection();
         
         int result = mDAO.idDupCheck(con, id);
         
         close(con);
         
         return result;
      }

      public Member findId(Member m) throws MemberException {
         con = getConnection();
         Member result = mDAO.selectMember(con, m);
         
         close(con);
         
         if(result == null) throw new MemberException("아이디를 찾을 수 없습니다.");
         
         return result;
      }

      public Member findPwd(String userName, String email, String userId) throws MemberException {
         Connection con = getConnection();
         
         Member m = mDAO.findPwd(con, userName, email, userId);
         
         if(m == null) throw new MemberException("비밀번호를 찾을 수 없습니다.");
         
         commit(con);
         close(con);
         
         return m;
      }
      
      public int emailDupCheck(String email) {
		     con = getConnection();
		     
		     int result = mDAO.emailDupCheck(con, email);
		     
		     close(con);
		     
			return result;
		}
		public int updatePwd (Member m) throws MemberException {
			con = getConnection();
			
			int result = mDAO.updatePwd(con, m);
			
			if (result > 0) commit(con);
			else {
				rollback(con);
				throw new MemberException("비밀번호를 찾을 수 없습니다.");
			}
			
		    close(con);
		    
		    return result;
		}
   }


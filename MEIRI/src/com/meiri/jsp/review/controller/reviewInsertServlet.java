package com.meiri.jsp.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.meiri.jsp.common.MyRenamePolicy;
import com.meiri.jsp.review.model.service.ReviewService;
import com.meiri.jsp.review.model.vo.Review;
import com.meiri.jsp.review.model.vo.reviewFile;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class reviewInsertServlet
 */
@WebServlet("/insert.re")
public class reviewInsertServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // 1. 전달 받을 파일의 크기 설정 
            int maxSize = 1024 * 1024 * 10; // 10MB
            
            // 2. 멀티파트 전달 확인 
            if(! ServletFileUpload.isMultipartContent(request)) {
               request.setAttribute("exception", new Exception("사진 게시글 등록 오류"));
               request.setAttribute("error-msg", "멀티파트 형식이 아니다.");
               
               request.getRequestDispatcher("views/common/errorPage.jsp")
                                             .forward(request, response);
            }
            
            // 3. 저장할 경로 설정
            String root = request.getServletContext().getRealPath("");
            System.out.println("root dir : "+root);
            String savePath = root+"resources"+File.separator+"reviewUploadFiles"+File.separator;
            
            // 4. 멀티파트 객체 준비 
            MultipartRequest mre = new MultipartRequest(request, savePath, maxSize, "UTF-8", 
                                 new MyRenamePolicy());
            
            // 다중 파일 업로드 처리하기 
            // 원본 파일 명과 변경된 파일 명 담기 (개발자는 헷갈리지않게 원본 파일 명도 같이)
            String originNames = null;
            String changeNames = null;
            
            // 화면에서 전달한 파일 이름 가져오기 
            Enumeration<String> files = mre.getFileNames();
            
            
               String tagName = files.nextElement();
               
               originNames = mre.getOriginalFileName(tagName);
               changeNames = mre.getFilesystemName(tagName);
               
               /*
               System.out.println("tagName : " + tagName);
               System.out.println(originNames);
               System.out.println(changeNames);
               */
            
            
               
            // 썸네일 게시글 저장하기 
            Review r = new Review();
            r.setPcode(Integer.parseInt(mre.getParameter("pcode")));
            r.setUserid(mre.getParameter("userId"));
            r.setRcontent(mre.getParameter("rcontent"));
            
            
            reviewFile rF = new reviewFile();
            
            
               
               rF.setFilepath(savePath);
               rF.setOriginname(originNames);
               rF.setChangename(changeNames);
               
               
            
            ReviewService rs = new ReviewService();
            
            int result = rs.insertReview(r, rF);
            
            if( result > 0) {
               response.sendRedirect("index.jsp");
            } else {
               request.setAttribute("exception", new Exception("사진 추가 에러 !"));
               request.setAttribute("error-msg", "게시글 저장 실패 ");
            
               request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
            }
            
            
   
   
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}
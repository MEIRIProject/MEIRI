package com.meiri.jsp.admin.product.controller;

import com.meiri.jsp.admin.product.model.service.ProductService;
import com.meiri.jsp.admin.product.model.vo.Product;
import com.meiri.jsp.admin.product.model.vo.ProductFile;
import com.meiri.jsp.common.MyRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
//import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

/**
 * Servlet implementation class QuestionInsert
 */
@WebServlet("/insert.pr")
public class ProductInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 전달받을 파일의 크기 설정
		int maxSize = 1024 * 1024 * 10; // 10MB
		
		// 2. 멀티파트 전달 확인
//		if(! ServletFileUpload.isMultipartContent(request)) {
//
//			request.setAttribute("exception", new Exception("사진 게시글 등록 오류"));
//			request.setAttribute("error-msg", "멀티파트 전송이 아니네요!");
//
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
//		}
		
		// 3. 저장할 경로 설정
		String root = request.getServletContext().getRealPath("/resources");
		String savePath = root + "/productUploadFiles/";
		
		// 4. 멀티파트 객체 준비
		MultipartRequest mre = new MultipartRequest(
				                   request, savePath, maxSize, "UTF-8",
				                   new MyRenamePolicy() );
		
		// 다중 파일 업로드 처리하기
		// 원본 파일 명과 변경된 파일 명 담기
		ArrayList<String> originNames = new ArrayList<>();
		ArrayList<String> changeNames = new ArrayList<>();
		
		// 화면에서 전달한 파일 이름 가져오기
		Enumeration<String> files = mre.getFileNames();
		
		while(files.hasMoreElements()) {
			// 가져온 파일 하나씩 꺼내옴
			String tagName = files.nextElement();
			
			originNames.add(mre.getOriginalFileName(tagName));
			changeNames.add(mre.getFilesystemName(tagName));
		
		
			System.out.println("tagName : " + tagName);
			System.out.println(originNames);
			System.out.println(changeNames);
			
		}
		
		// --------------- 여기까지 문제 없었음! ( 중간 토나오는 시점 ) ---------------- //
		
		// 썸네일 게시글 저장하기
		Product t = new Product();
		
		t.setPname(  mre.getParameter("name") );
		t.setPtitle( mre.getParameter("title") );
		t.setPprice( Integer.parseInt(mre.getParameter("price")));
		t.setPtypea( mre.getParameter("typeA") );
		t.setPtypeb( mre.getParameter("typeB") );
		t.setPtypec( mre.getParameter("typeC") );
		t.setPcolor( mre.getParameter("color") );

		// Attachment 객체 생성 후 파일 정보 저장하기
		ProductFile[] list = new ProductFile[5];
		
		// 리스트에 파일 목록을 하나씩 저장
		for(int i = originNames.size() - 1 ; i >= 0 ; i--) {
	         // 기존에 역순으로 가져온 파일들을 올바른 순서로 재정렬하는 반복문
	         
	         int j = originNames.size() - 1 - i;
	         
	         ProductFile at = new ProductFile();
	         
	         at.setFilepath(savePath);
	         at.setOriginname(originNames.get(i));
	         at.setChangename(changeNames.get(i));
	         
	         list[j] = at;
	      }
		
		String aid = mre.getParameter("aid");
		String content = mre.getParameter("content");
		
		
		ProductService ts = new ProductService();
		int result = ts.insertProduct(t, list, aid, content);
		
		if( result > 0 ) { 
			response.sendRedirect("productList.pr");
		} else {
			request.setAttribute("exception", new Exception("사진 추가 에러!"));
			request.setAttribute("error-msg", "사진 추가에 실패하였습니다. 관리자에게 문의하세요.");
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

package com.meiri.jsp.admin.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.meiri.jsp.admin.product.model.service.ProductService;
import com.meiri.jsp.admin.product.model.vo.Product;
import com.meiri.jsp.admin.product.model.vo.ProductFile;
import com.meiri.jsp.common.MyRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProductUpdate
 */
@WebServlet("/update.pr")
public class ProductUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdate() {
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
		
		int pno = Integer.parseInt(mre.getParameter("pno"));
		
		ProductService ps = new ProductService();
		
		HashMap<String, Object> hmap = ps.selectOne(pno);
		
		// 다중 파일 업로드 처리하기
		// 원본 파일 명과 변경된 파일 명 담기
		ArrayList<String> originFiles = new ArrayList<>();
		ArrayList<String> saveFiles = new ArrayList<>();
		
		// 화면에서 전달한 파일 이름 가져오기
		Enumeration<String> files = mre.getFileNames();
		
		while(files.hasMoreElements()) {
			// 가져온 파일 하나씩 꺼내옴
			String tagName = files.nextElement();
			
			originFiles.add(mre.getOriginalFileName(tagName));
			saveFiles.add(mre.getFilesystemName(tagName));
				
			System.out.println("tagName : " + tagName);
			System.out.println(originFiles);
			System.out.println(saveFiles);
			
		}
		
		
		Product t = (Product)hmap.get("product");
		
		t.setPno( Integer.parseInt(mre.getParameter("pno")));
		t.setPname(  mre.getParameter("name") );
		t.setPtitle( mre.getParameter("title") );
		t.setPprice( Integer.parseInt(mre.getParameter("price")));
		t.setPtypea( mre.getParameter("typea") );
		t.setPtypeb( mre.getParameter("typeb") );
		t.setPtypec( mre.getParameter("typec") );
		t.setPcolor( mre.getParameter("color") );

		
		// 가지고 있던 파일들
		ProductFile[] list = (ProductFile[])hmap.get("productfile");
		
		// 새로 받은 파일들
		// originFiles
		
		
		// 리스트에 파일 목록을 하나씩 저장
		for(int i = originFiles.size() - 1 ; i >= 0 ; i--) {
			
			int j = originFiles.size() - 1 - i;
			
			if(originFiles.get(i) != null) {
				
				if(list[j] != null) {
					new File(savePath + list[j].getChangename()).delete();
				}
				
				ProductFile pf = new ProductFile();
				
				pf.setFilepath(savePath);
				pf.setOriginname(originFiles.get(i));
				pf.setChangename(saveFiles.get(i));
				
				list[j] = pf;
				
			}
			
		}
		
		String aid = mre.getParameter("aid");
		String content = mre.getParameter("content");
		
		
		int result = ps.updateProduct(t, list, aid, content);
		
		System.out.println("result = " + result);
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

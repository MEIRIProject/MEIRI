package com.meiri.jsp.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.admin.notice.model.service.NoticeService;
import com.meiri.jsp.admin.notice.model.vo.Notice;

/**
 * Servlet implementation class noticeUpdate
 */
@WebServlet("/update.no")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 질문 코드, 변경할 제목과 내용
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		NoticeService ns = new NoticeService();
		
		Notice n = ns.selectOne(nno);
		
		n.setNtitle(title);
		n.setNcontent(content);
		
		int result = ns.updateNotice(n);
		
		if( result > 0) {
			response.sendRedirect("noticeList.no");
		} else {
			request.setAttribute("error-msg", "자주 묻는 질문 수정 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp")
			       .forward(request, response);
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

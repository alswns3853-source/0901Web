package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 브라우저 주소창에 입력했을때 연결할 주소
@WebServlet("/12/AnnoMapping.do")
public class AnnoMapping extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	// HttpServletRequest : 내장객체 request와 같은 객체를 의미
	// HttpServletResponse : 내장객체 response와 같은 객체를 의미
	
	// get 메서드(a태그, 주소창에서 바로 실행) 로 실행했을 때 실행하는 메서드
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		req.setAttribute("message", "@WebServelt으로 매핑");
		req.getRequestDispatcher("/12/AnnoMapping.jsp")
		 .forward(req, resp);
	}
	// post메서드(form태그)로 실행한 경우 실행되는 메서드
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}

package member.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Logout.do")
public class LogoutController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 각각의 세션 데이터 삭제
		HttpSession session = req.getSession();
		session.removeAttribute("UserId");
		session.removeAttribute("UserName");
		// 세션의 전체 데이터 삭제
		session.invalidate();
		System.out.println(req.getContextPath());
		// 세션 데이터 삭제 후 로그인 페이지로 이동
		resp.sendRedirect("/MustHaveJSP/Login.do");
	}
}

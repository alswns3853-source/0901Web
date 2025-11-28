package member.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.service.LoginService;
import membership.MemberDTO;

// Webservlet에서 /를 사용하더라도 주소앞에 프로젝트명이 설정됨
// http://localhost:8080/MustHaveJSP/login.do
@WebServlet("/Login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginService service = new LoginService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 화면만을 출력하는 doGet
		req.getRequestDispatcher("/12_1/LoginForm.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// request에서 id, pw를 저장
		String userId = req.getParameter("user_id");
		String userPwd = req.getParameter("user_pw");
		MemberDTO dto = service.getMember(userId, userPwd);
		if (dto.getId() != null) {
			req.getSession().setAttribute("UserId", dto.getId());
			req.getSession().setAttribute("UserName", dto.getName());
			// sendredirect 사용시 WebServlet에 사용한 주소를 입력
			// /login.do : http://localhost:8080/login.do
			// login.do : http://localhost:8080/MustHaveJSP/login.do
			resp.sendRedirect("/MustHaveJSP/Login.do");
		} else {
			// 일치하지 않으면 로그인 오류 출력
			req.setAttribute("LoginErrMsg", "로그인 오류입니다.");
			// forward에는 반드시 JSP의 정확한 경로를 입력해야함
			// webapp을 기준으로 jsp파일의 위치를 작성
			// 슬러시(/) 하나만 했을경우에 webapp에 위치하게 됨
			req.getRequestDispatcher("/12_1/LoginForm.jsp")
				.forward(req, resp);
		}
	}
}

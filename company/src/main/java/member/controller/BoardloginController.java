package member.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.service.MemberService;
import membership.MemberDTO;

@WebServlet("/boardlogin.do")
public class BoardloginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, 
						IOException {
		req.getRequestDispatcher("/login.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, 
						IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("userid");
		String pass = req.getParameter("password");
		MemberDTO dto = service.getMember(id, pass);
		if (dto.getId() != null) {
			req.getSession().setAttribute("userid", dto.getId());
			req.getSession().setAttribute("name", dto.getName());
			resp.sendRedirect("boardlogin.do");
		} else {
			req.setAttribute("LoginErrMsg", "로그인 오류입니다.");
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
		}
	}
}

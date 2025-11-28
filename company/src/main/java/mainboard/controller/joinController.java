package mainboard.controller;

import java.io.IOException;

import common.DBConnPool;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.service.MemberService;

@WebServlet("/join.do")
public class joinController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.getRequestDispatcher("join.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String pass = req.getParameter("pass");
		String checkpass = req.getParameter("checkpass");
		service.addMember(id, name, pass, checkpass);
		
	    resp.sendRedirect("boardlogin.do");
	}
}

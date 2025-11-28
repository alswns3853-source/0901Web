package mainboard.controller;

import java.io.IOException;

import board.service.BoardService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model1.BoardDTO;

@WebServlet("/view.do")
public class ViewSController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String num = req.getParameter("num");
		service.editVisitCount(num);
		BoardDTO dto = service.getBoard(num, "view");
		// 다음 페이지로 데이터를 전달
		req.setAttribute("board", dto);
		// 다음 페이지 설정
		req.getRequestDispatcher("/view.jsp").forward(req, resp);
	}
}

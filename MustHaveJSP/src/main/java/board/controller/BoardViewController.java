package board.controller;

import java.io.IOException;

import board.service.BoardService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model1.BoardDTO;

@WebServlet("/boardview.do")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 상세보기 화면에서 사용할 데이터를 받아서 ViewResult.jsp로 전달하는 코드 작성하기

		// 파라미터로 가지고온 게시글 PrimaryKey를 저장
		String num = req.getParameter("num");
		service.editVisitCount(num);
		BoardDTO dto = service.getBoard(num, "view");
		// 다음 페이지로 데이터를 전달
		req.setAttribute("dto", dto);
		// 다음 페이지 설정
		req.getRequestDispatcher("/12_1/ViewResult.jsp").forward(req, resp);
	}
}

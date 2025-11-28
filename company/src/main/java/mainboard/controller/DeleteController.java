package mainboard.controller;

import java.io.IOException;
import java.io.PrintWriter;

import board.service.BoardService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model1.BoardDTO;
import utils.JSFunction;

@WebServlet("/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    doPost(req, resp);  
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html;charset=UTF-8");
		String num = req.getParameter("num");
		BoardDTO dto = service.getBoard(num, "delete");
		int delResult = 0;
		String sessionId = req.getSession().getAttribute("userid").toString();
		// 작성자와 로그인한 사용자가 일치하는지 확인
		if (sessionId.equals(dto.getId())) {
			dto.setNum(num);
			// 데이터 삭제 SQL실행

			delResult = service.delete(dto);
			if (delResult == 1) {
				JSFunction.alertLocation("삭제되었습니다.", "list.do", out);
			} else {
				JSFunction.alertBack("삭제에 실패하였습니다.", out);
			}
		} else {
			JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);

		}
	}
}

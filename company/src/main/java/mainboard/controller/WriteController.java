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

@WebServlet("/write.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/write.jsp").forward(req, resp);
		}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 서블릿에서는 JSPWriter 대신 PrintWriter를 사용
		
		PrintWriter out = resp.getWriter();
		// PrintWriter사용시 한글이 깨지기 때문에 한글이 깨지지 않도록 인코딩을 변경 
		resp.setContentType("text/html;charset=UTF-8");
		String title = req.getParameter("title");
		String content = req.getParameter("content");


        // BoardDTO 객체에 데이터 세팅
        BoardDTO dto = new BoardDTO();
        dto.setTitle(title);
        dto.setContent(content);
        dto.setId(req.getSession().getAttribute("userid").toString());

		int iResult = service.write(dto);
		if(iResult == 1){
			resp.sendRedirect("/list.do");
		} else {
			JSFunction.alertBack("글쓰기에 실패하였습니다.",out);
		}
	}
}


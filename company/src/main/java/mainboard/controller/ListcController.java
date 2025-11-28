package mainboard.controller;

import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.service.BoardService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model1.BoardDTO;
import mvcboard.MVCBoardDAO;
import utils.BoardPage;

@WebServlet("/list.do")
public class ListcController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MVCBoardDAO dao = new MVCBoardDAO();
		Map<String, Object> param = new HashMap<String, Object>();

		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if (searchWord != null) {
			param.put("searchField", searchField);
			param.put("searchWord", searchWord);
		}
		int totalCount = service.getListCount(param);
		ServletContext application = getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("POSTS_PER_BLOCK"));
		
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		param.put("start", start);
		param.put("end", end);
		List<BoardDTO> boardLists = service.getList(param);
		dao.close();
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("boardLists", boardLists);
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../mvcboard/list.do");
		param.put("pagingImg", pagingImg);
		param.put("totalCount", totalCount);
		param.put("pageSize", pageSize);
		param.put("pageNum", pageNum);
		
		req.setAttribute("boardLists", boardLists);
		// 페이지에 필요한 모든 데이터를 map으로 전송
		req.setAttribute("map", param);
		req.getRequestDispatcher("/list.jsp").forward(req, resp);
	}

}

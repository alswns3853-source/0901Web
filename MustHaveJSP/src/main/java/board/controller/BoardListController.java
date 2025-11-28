package board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.service.BoardService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model1.BoardDTO;

@WebServlet("/boardlist.do")
public class BoardListController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    BoardService service = new BoardService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// DB연결
		// BoardDAO dao = new BoardDAO();
		// Map자료구조에 검색조건을 담아서 DB에 전달
		Map<String, Object> param = new HashMap<>();
		// 제목 혹은 내용을 검색할 컬럼명 설정
		String searchField = req.getParameter("searchField");
		// 검색할 단어 설정
		String searchWord = req.getParameter("searchWord");
		// 검색할 단어가 있으면 map 자료구조에 추가
		if(searchWord != null){
			param.put("searchField", searchField);
			param.put("searchWord", searchWord);
		}
		// 검색조건을 포함하여 게시글의 개수를 저장
		int totalCount = service.getListCount(param);
		// 게시글 데이터 저장
		List<BoardDTO> boardLists = service.getList(param);
		
		// request에 화면출력에 필요한 데이터를 저장
		req.setAttribute("totalCount",totalCount);
		req.setAttribute("boardLists", boardLists);
		// 화면출력 jsp를 실행
		req.getRequestDispatcher("/12_1/ListResult.jsp")
		.forward(req, resp);	
	}
}











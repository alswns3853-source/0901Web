package model2.mvcboard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.FileUtil;
import utils.JSFunction;

@WebServlet("/mvcboard/edit.do")
@MultipartConfig (
	maxFileSize = 1024 * 1024 * 1,
	maxRequestSize = 1024 * 1024 * 10
 )
public class EditController extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);
		dao.close();
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/14/Edit.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		String originalFileName = "";
		try {
			originalFileName = FileUtil.uploadFile(req, saveDirectory);
		}
		catch (Exception e) {
			JSFunction.alertBack(resp, "파일 업로드 오류입니다.");
			return;
		}
		// 파라미터의 데이터 변수에 저장
		String idx = req.getParameter("idx");
		// 수정 전 원본파일이름
		String prevOfile = req.getParameter("prevOfile");
		// 수정 후 원본파일이름
		String prevSfile = req.getParameter("prevSfile");
		
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		// 세션에 저장된 pass데이터를 변수에 저장
		HttpSession session = req.getSession();
		String pass = (String)session.getAttribute("pass");
		
		// dto에 파라미터 저장
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPass(pass);
		// 첨부파일이 있을 경우의 if문
		if (originalFileName != "") {
			// 파일 이름을 변경
			String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			// dto에 새로운 원본파일이름 저장
			dto.setOfile(originalFileName);
			// dto에 새로운 저장된파일이름 저장
			dto.setSfile(savedFileName);
			// 이전 첨부파일을 삭제
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		} else {
			// 첨부파일을 변경하지 않은 경우
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.updatePost(dto);
		dao.close();
		
		if(result == 1) {
			// 세션에 있는 비밀번호 데이터를 삭제
			session.removeAttribute("pass");
			// 상세보기 화면으로 이동
			resp.sendRedirect("../mvcboard/view.do?idx=" + idx);
		} else {
			JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.", 
						"../mvcboard/view.do?idx= + idx");
		}
	}
}

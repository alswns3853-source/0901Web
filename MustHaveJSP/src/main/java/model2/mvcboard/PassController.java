package model2.mvcboard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.FileUtil;
import utils.JSFunction;

@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 삭제하기 => delete
		// 수정하기 => edit
		req.setAttribute("mode", req.getParameter("mode"));
		req.getRequestDispatcher("/14/Pass.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//파라미터의 데이터를 변수 저장
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		MVCBoardDAO dao = new MVCBoardDAO();
		boolean confirmed = dao.confirmPassword(pass, idx);
		dao.close();
		// 데이터가 있는 경우
		if(confirmed) {
			if(mode.equals("edit")) {
				// 세션에 pass데이터 저장
				HttpSession session = req.getSession();
				session.setAttribute("pass", pass);
				// 수정하기 화면으로 이동
				resp.sendRedirect("../mvcboard/edit.do?idx=" + idx);
			}
			else if (mode.equals("delete")) {
				dao = new MVCBoardDAO();
				// 첨부파일을 삭제하기 위해 데이터를 변수에 저장
				// DB에서 삭제한 후에는 첨부파일의 이름을 알 수 없기 때문에 먼저 저장
//				String sfile = dao.selectView(idx).getSfile();
				MVCBoardDTO dto = dao.selectView(idx);
				// 게시글 삭제
				int result = dao.deletePost(idx);
				dao.close();
				// DB에서 게시글이 삭제된 후 첨부파일 삭제
				if(result == 1) {
					String saveFilename = dto.getSfile();
					FileUtil.deleteFile(req, "/Uploads", saveFilename);
				}
				// 삭제 후 메시지 및 목록페이지 출력
				JSFunction.alertLocation(resp, "삭제되었습니다.", "../mvcboard/list.do");
			}
		}
		// 데이터가 없는 경우
		else {
			JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
		}
	}
}

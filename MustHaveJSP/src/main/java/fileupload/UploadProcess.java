package fileupload;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.FileUtil;



@WebServlet("/13/UploadProcess.do")
@MultipartConfig(
		maxFileSize = 1024*1024*1, // 파일 용량 1MB
		maxRequestSize = 1024*1024*10 // 리퀘스트의 용량 10MB
	)
public class UploadProcess extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 저장할 폴더 설정
			// getServletContext().getRealPath() : Uploads가 실제로 있는 폴더 출력
			// C드라이브, D드라이브처럼 탐색기에 나오는 경로를 설정하는 것도 가능
			String saveDirectory = getServletContext().getRealPath("/Uploads");
			// FileUtil.uploadFile(리퀘스트, 저장할 폴더 경로) : 설정한 경로에 파일을 저장하는 메서드
			String originalFileName = FileUtil.uploadFile(req, saveDirectory);
			// 파일 이름 변경 => 원본 파일이름이 간단하여 겹치는 파일이 생기면 덮어쓰기 되어 없어질 수 있기 때문에
			String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			// 데이터베이스 파일 이름 및 제목, 카테고리 저장
			insertMyFile(req,originalFileName, savedFileName);
			resp.sendRedirect("FileList.jsp");
		}catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "파일 업로드 오류");
			req.getRequestDispatcher("FileUploadMain.jsp").forward(req,resp);
		}
	}
	private void insertMyFile(HttpServletRequest req, String oFileName, String sFileName) {
		String title = req.getParameter("title");
		String[] cateArray = req.getParameterValues("cate");
		StringBuffer cateBuf = new StringBuffer();
		if(cateArray == null) {
			cateBuf.append("선택한 항목 없음");
		}else {
			for(String s : cateArray) {
				cateBuf.append(s + ",");
			}
		}
		MyFileDTO dto = new MyFileDTO();
		dto.setTitle(title);
		dto.setCate(cateBuf.toString());
		dto.setOfile(oFileName);
		dto.setSfile(sFileName);
		MyFileDAO dao = new MyFileDAO();
		dao.insertFile(dto);
		dao.close();
	}
}












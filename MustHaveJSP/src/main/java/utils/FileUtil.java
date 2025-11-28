package utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class FileUtil {
	public static String uploadFile(HttpServletRequest req, String sDirectory)
		throws ServletException, IOException {
		// Part : 파일 데이터를 사용하기 위한 변수 생성
		Part part = req.getPart("ofile");
		// partHeader=form-data;name="ofile";filename="파일이름.확장자"
		// 위의 문자열을 partHeader 변수에 저장
		String partHeader = part.getHeader("content-disposition");
		// 파일이 여러개인 경우 배열에 파일이름 저장  
		String[] phArr = partHeader.split("filename=");
		// "파일이름.확장자" 에 있는 큰따움표 삭제 후 파일이름 저장
		// phArr[0] = partHeader=form-data;name="ofile";
		// phArr[1] = "파일이름.확장자"
		String originalFileName = phArr[1].trim().replace("\"", "");
		// 파일이름이 있는지 확인하는 if문
		if (!originalFileName.isEmpty()) {
			// 파일이름이 있다면 파일 저장
			// part.write(파일을 저장할경로 + OS맞는 파일 경로 기호 + 파일이름); 
			// 프로젝트경로/Uploads/파일이름.확장자
			part.write(sDirectory+File.separator +originalFileName);
		}
		return originalFileName;
	}
	public static String renameFile(String sDirectory, String fileName) {
		// ext : 파일 확장자 저장
		String ext = fileName.substring(fileName.lastIndexOf("."));
		// now : 오늘 날짜 및 시간 문자열로 저장
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		// 새로운 이름을 저장 -> 날짜및시간.확장자
		String newFileName = now + ext;
		// 새로운 File객체를 생성
		// 원본파일 객체 생성
		File oldFile = new File(sDirectory + File.separator + fileName);
		// 새로운 파일의 객체를 생성
		File newFile = new File(sDirectory + File.separator + newFileName);
		//원본 파일의 이름을 새로운파일의 이름으로 교체
		oldFile.renameTo(newFile);
		
		return newFileName;
	}
	public static ArrayList<String> multipleFile(HttpServletRequest req, String sDirectory) 
			throws ServletException, IOException{
		// 반환값 설정
		ArrayList<String> listFileName = new ArrayList<String>();
		// request안에 있는 모든 파일을 parts 변수에 저장
		Collection<Part> parts = req.getParts();
		for(Part part : parts) {
			// ofile 아닌것은 countine를 실행하여 다음 반복으로 넘어가기
			if(!part.getName().equals("ofile"))
				continue;
			// 헤더에서 파일이름 저장하기
			String partHeader = part.getHeader("content-disposition");
			String[] phArr = partHeader.split("filename=");
			String originalFileName = phArr[1].trim().replace("\"","");
			// 파일 이름이 있으면 Uploads폴더에 파일 저장 
			if (!originalFileName.isEmpty()) {
				part.write(sDirectory+ File.separator +originalFileName);
			}
			// 원본 파일 이름을 리스트에 저장
			listFileName.add(originalFileName);
		}
		return listFileName;
	}
	public static void download(HttpServletRequest req, HttpServletResponse resp, 
						String directory, String sfileName, String ofileName) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		try {
			File file = new File(sDirectory, sfileName);
			InputStream iStream = new FileInputStream(file);
			
			String client = req.getHeader("User-Agent");
			if (client.indexOf("WOW64")== -1) {
				ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
			} else {
				ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
			}
			resp.reset();
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + ofileName + "\"");
			resp.setHeader("Content-Length", "" + file.length());
			
			OutputStream oStream = resp.getOutputStream();
			
			byte b[] = new byte[(int)file.length()];
			int readBuffer = 0;
			while((readBuffer = iStream.read(b))>0) {
				oStream.write(b, 0, readBuffer);
			}
			iStream.close();
			oStream.close();
		}
		catch (FileNotFoundException e) {
			System.out.println("파일을 찾을 수 없습니다.");
			e.printStackTrace();
		}
		catch( Exception e) {
			System.out.println("예외가 발생하였습니다.");
			e.printStackTrace();
		}
	}
	public static void deleteFile(HttpServletRequest req, 
			String directory, String filename) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		File file = new File(sDirectory + File.separator + filename);
		if(file.exists()) {
			file.delete();
		}
	}
}

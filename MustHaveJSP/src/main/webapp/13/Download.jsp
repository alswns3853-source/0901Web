<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="utils.JSFunction"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 파일이 저장된 위치
String saveDirectory = application.getRealPath("/Uploads");
// 저장시의 파일 이름
String saveFilename = request.getParameter("sName");
// 원본 파일 이름
String originalFilename = request.getParameter("oName");

try{
	// 저장된 파일이름으로 실제 파일을 찾아서 객체로 저장
	File file = new File(saveDirectory, saveFilename);
	InputStream inStream = new FileInputStream(file);
	// 파일명이 한글일 경우 깨지지 않도록 하는 설정 
	String client = request.getHeader("User-Agent");
	if (client.indexOf("WOW64") == -1) {
		originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
	} else {
		originalFilename = new String(originalFilename.getBytes("KSC5601"), "ISO-8859-1");
	}
	// 파일 다운로드용으로 사용하기위해 응답을 초기화
	response.reset();
	// 응답 내용을 설정
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
	response.setHeader("Content-Length","" + file.length() );
	// 출력 내용을 초기화
	out.clear();
	// 출력 내용을 파일로 변경
	OutputStream outStream = response.getOutputStream();
	
	byte b[] = new byte[(int)file.length()];
	int readBuffer = 0;
	while ( (readBuffer = inStream.read(b)) > 0 ) {
		outStream.write(b, 0, readBuffer);
	}
	// 사용한 스트림 닫기
	inStream.close();
	outStream.close();
} catch (FileNotFoundException e) {
	JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
	e.printStackTrace();
} catch(Exception e) {
	JSFunction.alertBack("예외가 발생하였습니다.", out);
	e.printStackTrace();
}
%>
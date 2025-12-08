<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="org.zerock.w1.smtp.NaverSMTP" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 이메일에 보낼 내용 설정
Map<String, String> emailInfo = new HashMap<>();
emailInfo.put("from", request.getParameter("from"));
emailInfo.put("to", request.getParameter("to"));
emailInfo.put("subject", request.getParameter("subject"));
String content = request.getParameter("content");
String format = request.getParameter("format");
// text형식의 이메일 데이터 설정
if(format.equals("text")){
	emailInfo.put("content", content);
	emailInfo.put("format", "text/plain;charset=UTF-8");
}else if(format.equals("html")){
	// html형식의 이메일 데이터 설정
	content = content.replace("\r\n","<br/>");
	emailInfo.put("content", content);
	String htmlContent = "";
	// MailForm.html파일을 이메일에 전송할 수 있는 문자열 데이터로 변환
	try{
		// MailForm.html 파일의 경로를 저장
		String templatePath = application.getRealPath("/17/MailForm.html");
		// MailForm.html파일을 저장
		BufferedReader br = new BufferedReader(new FileReader(templatePath));
		String oneLine;
		// MailForm.html에 문자열 데이터가 있는지 확인하는 if문
		while((oneLine = br.readLine()) != null){
			// 한줄씩 htmlContent에 저장
			htmlContent += oneLine + "\n"; 
		}
		// 저장이 끝난 후 파일을 닫기
		br.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	// EmailSendMain에서 입력한 부분 내용 부분을 html의 __CONTENT__에 치환
	htmlContent = htmlContent.replace("__CONTENT__", content);
	emailInfo.put("content", htmlContent);
	emailInfo.put("format", "text/html;charset=UTF-8");
}

try{
	// configFile의 경로를 변수에 저장
	String configPath = application.getInitParameter("configFile");
	// 파일을 fis에 객체로 저장
	FileInputStream fis = new FileInputStream(configPath);
	// properties파일을 읽을 수 있도록 객체 생성
	Properties prop = new Properties();
	// configFile.properties를 읽어 prop객체에 설정
	prop.load(fis);
	// 네이버 서버 객체 생성
	NaverSMTP smtpServer = new NaverSMTP(prop.getProperty("id"), prop.getProperty("pw"));
	// 이메일 전송 메서드 실행
	smtpServer.emailSending(emailInfo);
	out.print("이메일 전송 성공");
}catch(Exception e){
	out.print("이메일 전송 실패");
	e.printStackTrace();
}


%>
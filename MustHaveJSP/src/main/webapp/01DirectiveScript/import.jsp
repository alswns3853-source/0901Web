<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%> 
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - import 속성</title>
</head>
<body>
<%
//	클래스를 사용할 경우 임포트가 필요하고
//  클래스 이름을 적은 후 ctrl + space를 눌러 자동 임포트를 실행하여 작성
//	현재 날짜를 저장하는 변수
	Date today = new Date();
//	날짜 데이터를 출력할 문자열 포맷 설정
//	yyyy : 4자리 년도, MM:월, dd:일 , hh:시간, mm:분, ss:초
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//	날짜 데이터를 포맷에 맞게 문자열로 변경하여 저장
	String todayStr = dateFormat.format(today);
//	출력
	System.out.println("콘솔창에 출력하는 메서드");
	out.println("html안에 출력하는 메서드");
	out.println("오늘 날짜 : " + todayStr);
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String gender = request.getParameter("gerder");
// checkbox를 저장할때 사용하는 코드
// 체크박스에 체크한 데이터가 String배열로 저장됨
String[] favo = request.getParameterValues("favo");
// String배열을 하나의 문자열로 만드는 코드
String favoStr ="";
if (favo != null){
	for (int i = 0; i < favo.length; i++){
		favoStr += favo[i] + " ";
	}
}
// textarea의 엔터키를 br태그로 변환해야 html상에서 줄바꿈이 출력됨
String intro = request.getParameter("intro").replace("\r\n", "<br/>");
%>
<ul>
	<li>아이디 : <%= id %></li>
	<li>성별 : <%= gender %></li>
	<li>관심사항 : <%= favoStr %></li>
	<li>자기소개 : <%= intro %></li>
	</ul>
</body>
</html>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// jsp에서 세션을 유효기간 설정
// session.setMaxInactiveInterval();
SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
// 세션 생성 시간 출력 메서드(최초 접속 시간)
long creationTime = session.getCreationTime();
String creationTimeStr = dateFormat.format(new Date(creationTime));
// 마지막에 세션에 접속한 시간(마지막 접속 시간)
long lastTime = session.getLastAccessedTime();
String lastTimeStr = dateFormat.format(new Date(lastTime));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<h2>Session 설정 확인</h2>
	<ul>
		<li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
		<li>세션 아이디 :  <%= session.getId() %></li>
		<li>최초 요청 시각 : <%= creationTimeStr %></li>
		<li>마지막 요청 시각 : <%= lastTimeStr %><li>
	</ul>
</body>
</html>
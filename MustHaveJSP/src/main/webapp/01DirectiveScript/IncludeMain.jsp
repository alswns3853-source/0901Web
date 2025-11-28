<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IncludeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include 지시어</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%
out.println("오늘 날짜 : " + toDay);
out.println("<br>");
out.println("내일의 날짜 : " + tomorrow);
%>
<%@ include file="footer.jsp" %>
</body>
</html>
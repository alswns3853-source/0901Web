<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
	<%
		if(session.getAttribute("user_id") == null){
			response.sendRedirect("RequestMain.jsp?");
		}
	%>
	<h2>로그인 성공!!!!!!!!!!!!!!!!!</h2>
	<h3><%=session.getAttribute("user_id")%>님 반갑습니다.</h3>
</body>
</html>
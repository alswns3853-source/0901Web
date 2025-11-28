<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - Exception</title>
</head>
<body>
	<%
		int status = response.getStatus();
	if(status == 404){
		out.print("404에러가 발생하였습니다.");
		out.print("<br>파일 경로를 확인해주세요");
	}else if(status == 405){
		out.print("405에러가 발생하였습니다.");
		out.print("<br>요청 방식(get,post)을 확인해주세요");
	}else if(status == 500){
		out.print("500에러가 발생하였습니다.");
		out.print("<br>소스코드에 오류가 없는지 확인해주세요");
	}
	%>
</body>
</html>
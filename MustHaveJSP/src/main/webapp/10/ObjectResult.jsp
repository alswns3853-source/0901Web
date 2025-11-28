<%@page import="model1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 객체 매개변수</title>
</head>
<body>
	<h2>request 영역을 통해 전달된 객체 읽기</h2>
	<ul>
	<% BoardDTO dto = (BoardDTO)request.getAttribute("dto"); %>
		<li>JSP 방식 : <%=dto.getNum() %></li>
		<li>표현언어(EL) 방식
		<li>글번호 : ${dto.num }</li>
		<li>제목 : ${dto.title }</li> 
		<li>내용 : ${dto.content }</li>
		<li>작성자 : ${dto.id }</li>
		<li>작성일 : ${dto.postdate }</li>
		<li>조회수 : ${dto.visitcount }</li>
	</ul>
</body>
</html>
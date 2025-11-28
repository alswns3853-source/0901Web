<%@page import="membership.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
<%
List<MemberDTO> memberList 
	= (List<MemberDTO>)request.getAttribute("memberList");	
	for(MemberDTO dto : memberList){
%>
	<h4><%=dto.getId()%>, <%=dto.getPw()%>
		,<%=dto.getName()%>,<%=dto.getRegidate()%></h4>
<%} %>
</body>
</html>
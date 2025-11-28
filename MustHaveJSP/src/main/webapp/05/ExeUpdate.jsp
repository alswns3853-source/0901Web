<%@page import="membership.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<h2>회원 추가테스트(executeUpdate() 사용)</h2>
	<%
	String id = "test2";
	String pass = "1111";
	String name = "테스트1회원";
	// DB에 연결
	MemberDAO dao = new MemberDAO();
	dao.addMember(id, pass, name);
	// sql의 ?의미 : SQL에 설정할 동적 데이터
	out.println( "행이 입력되었습니다.");
	dao.close();
	%>
</body>
</html>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("UserId")== null){
	// 세션에 UserId가 없으면 로그인페이지로 이동시키는 if문
	JSFunction.alertLocation("로그인 후 이용해주십시오.", 
							"./12_1/LoginForm.jsp", out);
	return;
}
	%>
	
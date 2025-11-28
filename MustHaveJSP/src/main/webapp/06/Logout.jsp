<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 각각의 세션 데이터 삭제
session.removeAttribute("UserId");
session.removeAttribute("UserName");
// 세션의 전체 데이터 삭제
session.invalidate();
// 세션 데이터 삭제 후 로그인 페이지로 이동
response.sendRedirect("LoginForm.jsp");
%>
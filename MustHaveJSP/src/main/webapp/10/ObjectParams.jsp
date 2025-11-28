<%@page import="model1.BoardDTO"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// DB접속
BoardDAO dao = new BoardDAO();
// 데이터를 변수에 저장
BoardDTO dto = dao.selectView("16");
// DB종료
dao.close();
// request에 데이터 저장
request.setAttribute("dto", dto);
// 화면 출력 페이지로 데이터 전달 
request.getRequestDispatcher("ObjectResult.jsp")
	.forward(request, response);
%>
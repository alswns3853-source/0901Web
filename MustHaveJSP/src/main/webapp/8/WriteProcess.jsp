<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./ISLoggedln.jsp"%>
<%
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("UserId").toString());

BoardDAO dao = new BoardDAO();
int iResult = dao.insertWrite(dto);
dao.close();

if(iResult == 1){
	response.sendRedirect("List.jsp");
} else {
	JSFunction.alertBack("글쓰기에 실패하였습니다.",out);
}
%>
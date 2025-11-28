<%@page import="model1.BoardDTO"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 파라미터로 가지고온 게시글 PrimaryKey를 저장
String num = request.getParameter("num");
    // DB연결
    BoardDAO dao = new BoardDAO();
    // 조회수 1증가
    dao.updateVisitCount(num);
    // 게시글 데이터 조회
    BoardDTO dto = dao.selectView(num);
    dto.setContent(dto.getContent().replace("\r\n","<br/>"));
    dao.close();
    request.setAttribute("dto", dto);
    request.getRequestDispatcher("ViewResult.jsp")
    	.forward(request, response);
    %>

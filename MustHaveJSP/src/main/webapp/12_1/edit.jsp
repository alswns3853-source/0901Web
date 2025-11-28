<%@page import="utils.JSFunction"%>
<%@page import="model1.BoardDTO"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String num = request.getParameter("num");
    BoardDAO dao = new BoardDAO();
    BoardDTO dto = dao.selectView(num);
    String sessionId = session.getAttribute("UserId").toString();
    if(!sessionId.equals(dto.getId())){
    	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
    	return;
    }
    dao.close();
    // request DB데이터 담기
    request.setAttribute("dto", dto);
    // 화면출력 페이지로 이동
    request.getRequestDispatcher("EditResult.jsp")
    	.forward(request, response);
    %>
    
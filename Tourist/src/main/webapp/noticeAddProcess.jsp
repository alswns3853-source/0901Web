<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터 저장
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = session.getAttribute("user_id").toString();
	// DB연결
	BoardDAO dao = new BoardDAO();
	// 저장할 dto 생성
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(id);
	// insert문 실행
	int result = dao.insertWrite(dto);
	// 정상처리 확인
	if(result == 1){
		JSFunction.alertLocation("글이 등록되었습니다.", "notice_list.jsp", out);
	}else{
		JSFunction.alertBack("글이 등록이 실패했습니다.", out);
	}
%>













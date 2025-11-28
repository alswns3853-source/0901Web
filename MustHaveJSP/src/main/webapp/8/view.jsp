<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 상세보기 화면에서 사용할 데이터를 받아서 ViewResult.jsp로 전달하는 코드 작성하기
	
    // 파라미터로 가지고온 게시글 PrimaryKey를 저장
String num = request.getParameter("num");
    // DB연결
    BoardDAO dao = new BoardDAO();
    // 조회수 1증가
    dao.updateVisitCount(num);
    // 게시글 데이터 조회
    BoardDTO dto = dao.selectView(num);
    // content의 엔티키 <br/>태그로 변경
    dto.setContent(dto.getContent().replace("\r\n","<br/>"));
    // DB 접속 종료
    dao.close();
    // 다음 페이지로 데이터를 전달
   request.setAttribute("dto", dto);
    // 다음 페이지 설정
   request.getRequestDispatcher("ViewResult.jsp")
   		.forward(request, response);
    %>
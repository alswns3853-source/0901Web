<%@page import="utils.JSFunction"%>
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file ="./ISLoggedln.jsp" %>
<%
// 파라미터 저장
String num = request.getParameter("num");
BoardDTO dto = new BoardDTO();
BoardDAO dao = new BoardDAO();
// 데이터가 있는지 확인
dto = dao.selectView(num);

String sessionId = session.getAttribute("user_id").toString();
int delResult = 0;
//작성자와 로그인한 사용자가 일치하는지 확인
if(sessionId.equals(dto.getId())){
	dto.setNum(num);
	// 데이터 삭제 SQL실행
	delResult = dao.deletePost(dto);
	dao.close();
	if(delResult == 1){
		JSFunction.alertLocation("삭제되었습니다.", "notice_list.jsp", out);
	}else{
		JSFunction.alertBack("삭제에 실패하였습니다.", out);
	}
}else{
	JSFunction.alertBack("본인만 삭제할 수 있습니다", out);
	
	return;
}
%>
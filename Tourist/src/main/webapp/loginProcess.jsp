<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 로그인시 필요한 파라미터
String id = request.getParameter("id");
String pw = request.getParameter("pw");
// 아이디 저장 기능 활성화 여부 확인 변수
String save_check = request.getParameter("save_check");
// DB연결
MemberDAO dao = new MemberDAO();
// 검새조건 설정
MemberDTO param = new MemberDTO();
param.setEmailId(id);
param.setPassword(pw);
// 로그인 데이터 저장
MemberDTO dto = dao.login(param);

/*  if(id.equals("nova")&& pw.equals("12345")){
		if(save_check != null && save_check.equals("on")){
			CookieManager.makeCookie(response, "loginId", id , 60*60*24*7);
		}
		else{
			CookieManager.deleteCookie(response, "loginId");
		}
	session.setAttribute("user_id", id);
	response.sendRedirect("index.jsp");
}else{
	request.getRequestDispatcher("login.jsp?loginErr=1")
	.forward(request, response);
} */ 
// id와 pw가 DB와 일치하는지 확인하는 if문
if(dto.getEmailId() != null && dto.getEmailId().equals(id)){
	if (save_check != null && save_check.equals("Y")){
		CookieManager.makeCookie(response, "loginId", id, 86400);
	}else{
		CookieManager.deleteCookie(response, "loginId");
	}
	session.setAttribute("user_id", id);
	JSFunction.alertLocation("로그인에 성공했습니다.", "index.jsp", out);
}else{
	JSFunction.alertBack("로그인에 실패했습니다.",out);
}

%>
	
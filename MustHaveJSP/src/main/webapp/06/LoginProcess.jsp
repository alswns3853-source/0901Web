<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request에서 id, pw를 저장
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
//
MemberDAO dao = new MemberDAO();
//DAO에서 아이디와 패스워드를 사용하여 데이터를 받아오는 코드
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
// 아이디와 패스워드가 일치하면 session 유저데이터 저장
if(memberDTO.getId() != null){
		session.setAttribute("UserId", memberDTO.getId());
		session.setAttribute("UserName", memberDTO.getName());
		response.sendRedirect("LoginForm.jsp");
}else{
	// 일치하지 않으면 로그인 오류 출력
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	request.getRequestDispatcher("LoginForm.jsp")
		.forward(request, response);
}
%>
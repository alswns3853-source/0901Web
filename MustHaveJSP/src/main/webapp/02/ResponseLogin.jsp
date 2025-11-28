<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// HTML 코드가 없는 파일
	// 자바 코드를 이용하여 로그인 처리 및 다음페이지로의 연결 처리를 작성한 파일
	//request로 받아온 아이디,비밀번호 데이터를 변수에 저장
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd");
// 로그인 처리 -> if문을 통해 must에 1234라면 로그인 성공 페이지로 이동
if(id.equalsIgnoreCase("must")&& pwd.equalsIgnoreCase("1234")){
	// 이전에 어떤 페이지가 나왔던 상관없이 페이지를 열어주는 메서드
	// 데이터를 전달하지 않는 경우 사용
	session.setAttribute("user_id", "must");
	response.sendRedirect("ResponseWelcome.jsp");
}
else {
	// request와 response를 함꼐 전달하여 jsp를 실행하는 경우에 사용
	// request에 객체데이터, 리스트 데이터를 함께 보낼 수 있음
	request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
		.forward(request, response);
}
%>

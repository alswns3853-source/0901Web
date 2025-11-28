<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - application</title>
</head>
<body>
	<h2>web.xml에 설정한 내용 불러오기</h2>
	<!-- 스크립틀릿태그, 표현식 태그에서 사용하는 방식  -->
	초기화 매개변수 : <%=application.getInitParameter("INIT_PARAM") %>
	<h2>서버의 물리적 경로 얻어오기</h2>
	application 내장 객체 : <%=application.getRealPath("/02") %>
	<h2>선언부에서 application 내장 객체 사용하기</h2>
	<%!
	// 선언부 태그에서 사용하는 방식
		public String useImplicitObject(){
			return this.getServletContext().getRealPath("02");
	}
	public String useImplicitObject(ServletContext app){
		return app.getRealPath("/02");
	}
	%>
	<ul>
		<li>this 사용 : <%= useImplicitObject() %></li>
		<li>내장 객체를 인수로 전달 : <%=useImplicitObject(application) %></li>
	</ul>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 페이지 영역에 데이터 저장 -> 가장 작은 범위
// page < request < session < application
// pageContext.setAttribute("scopeValue", "페이지 영역");
request.setAttribute("scopeValue", "리퀘스트 영역"); // 리퀘스트 영역
session.setAttribute("sessionValue", "세션 영역"); // 세션 영역
application.setAttribute("scopeValue", "애플리케이션 영역"); // 애플리케이션 영역
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 내장 객체</title>
</head>
<body>
	<h2>ImplicitObjMain 페이지</h2>
	<h3>각 영역에 저장된 속성 읽기</h3>
	<ul>
		<!-- 각 영역의 데이터 출력 방법 -->
		<li>페이지 영역 : ${ pageScope.scopeValue }</li>
		<li>리퀘스트 영역 : ${ requestScope.scopeValue }</li>
		<li>세션 영역 : ${sessionScope.scopeValue }</li>
		<li>애플리케이션 영역 : ${applicationScope.scopeValue }</li>
	</ul>
	
	<h3>영역 지정 없이 속성 읽기</h3>
	<ul>
		<!-- 영역을 지정하지 않으면 가장 작은 영역부터 찾아서 출력 -->
		<!-- 페이지 영역은 거의 사용하지 않고 request혹은 session을 많이 사용 -->
		<li>${ scopeValue }</li>
		<li>${ sessionValue }</li>
	</ul>
	
		<%-- <jsp:forward page="ImplicitForwardResult.jsp"/>  --%>
</body>
</html>
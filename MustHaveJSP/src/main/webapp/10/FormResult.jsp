<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 폼값 처리</title>
</head>
<body>
	<h3>EL로 폼값 받기</h3>
	<ul>
		<!-- EL주의사항 : HTML,CSS,JS 코드 영역에서만 사용할 수 있음 -->
		<!-- param.key값 : 파라미터의 키에 해당하는 데이터를 출력  -->
		<li>이름 : ${param.name }, <%= request.getParameter("name") %></li>
		<li>성별 : ${param.gender }, <%= request.getParameter("gender") %></li>
		<li>학력 : ${param.grade }, <%= request.getParameter("grade") %></li>
		<!-- paramValues.key값 : 파라미터중 배열데이터를 가진 데이터 출력 -->
		<% String[] interArr = request.getParameterValues("inter"); %>
		<li>관심사항 : ${paramValues.inter[0] }<%=interArr[0] %>
					${paramValues.inter[1] }<%=interArr[1] %>
					${paramValues.inter[2] }<%=interArr[2] %>
					${paramValues.inter[3] }<%=request.getParameterValues("inter")[3] %></li>
	</ul>
</body>
</html>
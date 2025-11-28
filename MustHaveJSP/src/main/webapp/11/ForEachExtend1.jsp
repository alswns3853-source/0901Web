<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach2</title>
</head>
<body>
	<h4>향상된 for문 형태의 forEach</h4>
	<%
	String[] rgba = {"Red", "Green", "Blue", "Black"};
	%>
	<c:forEach items="<%=rgba %>" var="c">
		<span style="color":${ c };">${ c }</span>
	</c:forEach>
	
<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
	<c:forEach items="<%= rgba %>" var="c" varStatus="loop"> 
		<tr>
			<td>count : ${ loop.count }</td> <!-- 반복횟수 -->
			<td>index : ${ loop.index }</td> <!-- 현재 데이터의 인덱스 -->
			<td>current : ${ loop.current }</td><!-- 현제 데이터  -->
			<td>first : ${loop.first }</td><!-- 첫번째 데이터는 true 나머지는 false  -->
			<td>last : ${loop.last }</td><!-- 마지막 데이터는 true 나머지는 false  -->
			</tr>
	</c:forEach>
	</table>
</body>
</html>
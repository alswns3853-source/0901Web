<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach 채그</title>
</head>
<body>
	<h4>일반 for문 형태의 forEach 태그</h4>
	<c:forEach begin="1" end="3" step="1" var="i">
		<p>반복 ${ i  }입니다.</p>
	</c:forEach>
	
	<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
	<c:forEach begin="3" end="5" var="i" varStatus="loop"> 
		<tr>
			<td>count : ${ loop.count }</td> <!-- 반복횟수 -->
			<td>index : ${ loop.index }</td> <!-- 현재 데이터의 인덱스 -->
			<td>current : ${ loop.current }</td><!-- 현제 데이터  -->
			<td>first : ${loop.first }</td><!-- 첫번째 데이터는 true 나머지는 false  -->
			<td>last : ${loop.last }</td><!-- 마지막 데이터는 true 나머지는 false  -->
			</tr>
	</c:forEach>
	</table>
	
	<h4>1에서 100까지 정수 중 홀수의 합</h4>
	<c:forEach begin="1" end="100" var="j">
		<c:if test="${ j mod 2 ne 0 }">
			<c:set var="sum" value="${ sum +j }"/>
			</c:if>	
	</c:forEach>
	1~100사이의 정수 중 홀수의 합은? ${sum }
</body>
</html>
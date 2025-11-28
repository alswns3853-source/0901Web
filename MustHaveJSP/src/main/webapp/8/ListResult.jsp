<%@page import="model1.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="model1.BoardDAO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<%@ include file="../Common/Link.jsp"%>
	<h2>목록 보기(List)</h2>
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> <input type="text" name="searchWord" /> <input type="submit"
					value="검색하기" /></td>
			</tr>
		</table>
	</form>
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		<c:if test="${empty boardLists}">
			<tr>
				<td colspan="5" align="center">등록된 게시물이 없습니다^^*</td>
			</tr>
		</c:if>

		<c:if test="${not empty boardLists}">
			<c:forEach var="dto" items="${boardLists}">
				<tr align="center">
					<td>${dto.num}</td>
					<td align="left"><a href="view.jsp?num=${dto.num}">${dto.title}</a>
					</td>
					<td align="center">${dto.id}</td>
					<td align="center">${dto.visitcount}</td>
					<td align="center">${dto.postdate}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<table border="1" width="90%">
		<tr align="right">
			<td><button type="button" onclick="location.href='write.jsp';">글쓰기</button></td>
		</tr>
	</table>



</body>
</html>
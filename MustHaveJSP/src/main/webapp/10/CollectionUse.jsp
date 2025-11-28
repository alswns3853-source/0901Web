<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO();
HashMap<String,Object> param = new HashMap<>();
List<BoardDTO> dtoList = dao.selectList(param); 
request.setAttribute("list", dtoList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 컬렉션</title>
</head>
<body>
	<ul>
		<!-- 리스트 사용시에도 배열처럼 []를 이용하여 데이터를 출력 -->
		<li>0번째 요소 : ${list[0].num }, ${list[0].title}</li>
		<li>1번째 요소 : ${list[1].num }, ${list[1].title}</li>
		<!-- 없는데이터를 출력해도 에러가 발생하지 않음 -->
		<li>2000번째 요소 : ${list[2000].num }, ${list[2000].title}</li>
	</ul>
	<h2>Map 컬렉션 사용</h2>
	<%
		Map<String, String> map = new HashMap<>();
		map.put("한글", "훈민정음");
		map.put("Eng", "English");
		pageContext.setAttribute("King", map);
	%>
	<ul>
		<li>영문 Key : ${King["Eng"] }, ${ King['Eng'] }, ${ King.Eng }</li>
		<li>한글 Key : ${ King["한글"] }, ${ King['한글'] }, ${King.한글 }</li>
	</ul>
</body>
</html>
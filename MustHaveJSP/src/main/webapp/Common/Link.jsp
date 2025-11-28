<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table border="1" width="90%">
	<tr>
		<td align="center">
		<% if (session.getAttribute("UserId") == null){%>
			<a href="../06/LoginForm.jsp">로그인</a>
			<%} else { %>
				<a href="../06/Logout.jsp">로그아웃</a>
			<%} %>
			
			&nbsp;&nbsp;&nbsp;
			<a href="../8/list.jsp">게시판(페이징X)</a>
			&nbsp;&nbsp;&nbsp;
			<a href="../09/List.jsp">게시판(페이징O)</a>
			</td>
		</tr>
	</table>	
		

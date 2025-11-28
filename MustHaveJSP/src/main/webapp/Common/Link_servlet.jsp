<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table border="1" width="90%">
	<tr>
		<td align="center">
			<% if (session.getAttribute("UserId") == null){%>
				<a href="/MustHaveJSP/Login.do">로그인</a>
			<%} else { %>
				<a href="/MustHaveJSP/Logout.do">로그아웃</a>
			<%} %>
			
			&nbsp;&nbsp;&nbsp;
			<a href="/MustHaveJSP/boardlist.do">게시판(페이징X)</a>
			&nbsp;&nbsp;&nbsp;
			<a href="/MustHaveJSP/boardlist_paging.do">게시판(페이징O)</a>
			</td>
		</tr>
	</table>	
		

<%@page import="model1.BoardDTO"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
function deletePost() {
	// confirm창에서 확인 버튼을 누르면 true를 취소를 누르면 false 반환
	var confirmed = confirm("정말로 삭제하겠습니까?");
	if (confirmed){
		// form태그 저장
		var form = document.writeFrm;
		// method설정 : post,get
		form.method = "post";
		// submin시 실행할 페이지 설정
		form.action = "delect.do";
		// submin 실행
		form.submit();
	}
}
</script>
</head>
<body>
 <jsp:include page="/Common/Link_servlet.jsp"/>
<h2>회원제 게시판 - 상세 보기(View)</h2>
<form name="writeFrm">
	<!-- hidden : 보이지 않지만 submit실행시 데이터를 함께 전송하는 타입 -->
	<input type="hidden" name="num" value="${dto.num}" />
	<table border="1" width ="90%">
		<tr>
			<td>번호</td>
			<td>${dto.num } </td>
			<td>작성자</td>
			<td>${dto.name}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${dto.postdate }</td>
				<td>조회수</td>
				<td>${dto.visitcount}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3">${dto.title }</td>
					</tr>
					<tr>
					<td>내용</td>
					<td colspan="3" height="100"> 
						${dto.content }
					<%-- 	<% pageContext.setAttribute("enter", "\r\n"); %>
						<c:out value="${fn:replace(dto.content,enter,'<br/>')}"
							escapeXml = "false"/> --%>
						</td>
						</tr>
				<tr>
				<td colspan="4" align="center">
				<c:if test="${not empty UserId and UserId eq dto.id}">
					<button type="button"
						onclick = "location.href='edit.do?num=${dto.num}';">수정하기</button>
						<button type="button" onclick="deletePost();">삭제하기</button>
				</c:if>
					<button type="button"
						onclick = "location.href='boardlist.do';">
						목록보기</button>
						</td>
						</tr>
					</table>
</form>
</body>
</html>
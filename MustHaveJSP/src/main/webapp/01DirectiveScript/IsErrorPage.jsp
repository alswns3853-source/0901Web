<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 지시어 - IsErrorPage</title>
</head>
<body>
	<h2>서비스 중 오류가 발생하였습니다.</h2>
	<p>
		<!-- exception변수 : 에러페이지의 경우 자동으로 만들어지는 예외 변수 -->
		오류명 : <%=exception.getClass().getName()%>
		오류 메시지 : <%=exception.getMessage() %>
	</p>
</body>
</html>
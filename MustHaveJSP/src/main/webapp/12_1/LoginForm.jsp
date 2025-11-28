<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<%-- <jsp:include page="../Common/Link.jsp"/> --%>
	<%@ include file="/Common/Link_servlet.jsp" %>
	<h2>로그인 페이지</h2>
	<span style="color: red; font-size: 1.2em;">
		<!-- 로그인 실패시 실행할 문구 출력 -->
		${LoginErrMsg == null ? '' : LoginErrMsg}
	</span>
	<c:if test = "${UserId == null }">
	<script>
	function validateForm(form) {
		// 자바스크립트는 문자열 변수를 조건식으로 사용할 경우
		// 데이터가 있으면 trun 없으면 false를 출력
		// 아이디를 작성했는지 확인하는 if문
		if(!form.user_id.value){
			alert("아이디를 입력하세요.");
			return false;	
		}
		// 비밀번호를 작성했는지 확인하는 if문
		if (!form.user_pw.value){
			alert("패스워드를 입력하세요.");
			return false;
		}
	}
	</script>
	<!-- onsubmit="조건식" : 조건식이 trun라면 submit 실행, false라면 실행 -->
	<!-- validateForm(this) : 함수가 실행될때 매개변수로 자기자신 태그를 사용함 -->
	<form action="/MustHaveJSP/Login.do" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">
		아이디 : <input type="text" name="user_id" /><br>
		패스워드 : <input type="password" name="user_pw" /><br>
		<input type="submit" value="로그인하기" />
		</form>
		</c:if>
		<c:if test="${UserId != null}">
		
		<!-- 세션에 UserName데이터가 있을 경우 환영메시지 출력 -->
		${UserName} 회원님, 로그인하셨습니다.<br>
		<a href="/MustHaveJSP/Logout.do">[로그아웃]</a>
		
		</c:if>

	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link href="/resources/css/responsive.css" rel="stylesheet">

<style>
.login-container {
	margin-top: 100px;
	margin-bottom: 150px;
}

.login-box {
	background: #fff;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.login-box h2 {
	margin-bottom: 30px;
}

.login-btn {
	width: 100%;
	padding: 10px;
}
</style>

</head>

<body class="homepage">
	<%@ include file="../todo/header.jsp"%>
	<span style="color: red; font-size: 1.2em;"> ${errors == null ? '' : errors}
	</span>

	<script>
		function validateForm(form) {
			// 자바스크립트는 문자열 변수를 조건식으로 사용할 경우
			// 데이터가 있으면 trun 없으면 false를 출력
			// 아이디를 작성했는지 확인하는 if문
			if (!form.id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			// 비밀번호를 작성했는지 확인하는 if문
			if (!form.pass.value) {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
	</script>



	<div class="container login-container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4 wow fadeInDown">
				<div class="login-box">
					<c:if test="${id == null }">
						<h2 class="text-center">로그인</h2>

						<form action="/member/login" method="post">
							<div class="form-group">
								<label>아이디</label> <input type="text" class="form-control"
									name="id" required>
							</div>

							<div class="form-group">
								<label>비밀번호</label> <input type="password" class="form-control"
									name="pass" required>
							</div>

							<button type="submit" class="btn btn-primary login-btn">
								<i class="fa fa-sign-in"></i> 로그인
							</button>

							<hr>

							<p class="text-center">
								계정이 없나요? <a href="/member/join">회원가입</a>
							</p>
						</form>
					</c:if>
					<c:if test="${userid != null}">
                    ${name} 회원님, 로그인하셨습니다.<br>
						<a href="/member/logout">[로그아웃]</a>

					</c:if>
				</div>
			</div>
		</div>
	</div>



	<div style="height: 400px;"></div>
	<%@ include file="../todo/footer.jsp"%>

	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/main.js"></script>
	<script src="/resources/js/wow.min.js"></script>
</body>
</html>

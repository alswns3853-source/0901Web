<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

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
	<%@ include file="header.jsp"%>
	<span style="color: red; font-size: 1.2em;"> ${LoginErrMsg == null ? '' : LoginErrMsg}
	</span>

	<script>
		function validateForm(form) {
			// 자바스크립트는 문자열 변수를 조건식으로 사용할 경우
			// 데이터가 있으면 trun 없으면 false를 출력
			// 아이디를 작성했는지 확인하는 if문
			if (!form.user_id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			// 비밀번호를 작성했는지 확인하는 if문
			if (!form.user_pw.value) {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
	</script>



	<div class="container login-container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4 wow fadeInDown">
				<div class="login-box">
					<c:if test="${userid == null }">
						<h2 class="text-center">로그인</h2>

						<form action="boardlogin.do" method="post">
							<div class="form-group">
								<label>아이디</label> <input type="text" class="form-control"
									name="userid" required>
							</div>

							<div class="form-group">
								<label>비밀번호</label> <input type="password" class="form-control"
									name="password" required>
							</div>

							<button type="submit" class="btn btn-primary login-btn">
								<i class="fa fa-sign-in"></i> 로그인
							</button>

							<hr>

							<p class="text-center">
								계정이 없나요? <a href="join.jsp">회원가입</a>
							</p>
						</form>
					</c:if>
					<c:if test="${userid != null}">
                    ${name} 회원님, 로그인하셨습니다.<br>
						<a href="logout.do">[로그아웃]</a>

					</c:if>
				</div>
			</div>
		</div>
	</div>



	<div style="height: 400px;"></div>
	<%@ include file="footer.jsp"%>

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/wow.min.js"></script>
</body>
</html>

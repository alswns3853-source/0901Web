<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<style>
    .signup-container {
        margin-top: 100px;
        margin-bottom: 150px;
    }
    .signup-box {
        background: #fff;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }
    .signup-box h2 {
        margin-bottom: 30px;
    }
    .signup-btn {
        width: 100%;
        padding: 10px;
    }
</style>

</head>

<body class="homepage">

    <%@ include file="header.jsp" %>

    <div class="container signup-container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4 wow fadeInDown">
                <div class="signup-box">
                    <h2 class="text-center">회원가입</h2>

                    <form action="joinProcess.jsp" method="post">

                        <div class="form-group">
                            <label>아이디 (이메일)</label>
                            <input type="text" class="form-control" name="id" required>
                        </div>

                        <div class="form-group">
                            <label>이름</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>

                        <div class="form-group">
                            <label>비밀번호</label>
                            <input type="password" class="form-control" name="pass" required>
                        </div>

                        <div class="form-group">
                            <label>비밀번호 확인</label>
                            <input type="password" class="form-control" name="checkpass" required>
                        </div>

                        <button type="submit" class="btn btn-danger signup-btn">
                            <i class="fa fa-user-plus"></i> 회원가입
                        </button>

                        <hr>

                        <p class="text-center">
                            이미 계정이 있으신가요? <a href="login.jsp">로그인</a>
                        </p>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="js/wow.min.js"></script>

</body>
</html>

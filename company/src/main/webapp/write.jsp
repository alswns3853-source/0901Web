<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
</head>

<body>
<%@ include file="header.jsp" %>

<div class="container" style="margin-top:50px; margin-bottom:50px;">
    <h2 class="text-center">글쓰기</h2>

    <form name="writeFrm" method="post" action="write.do" 
          onsubmit="return validateForm(this);" class="mt-4">

        <div class="form-group">
            <label>제목</label>
            <input type="text" name="title" class="form-control" placeholder="제목을 입력하세요">
        </div>

        <div class="form-group mt-3">
            <label>내용</label>
            <textarea name="content" class="form-control" style="height: 400px;" placeholder="내용을 입력하세요"></textarea>
        </div>

        <!-- 버튼 영역 -->
        <div class="text-center mt-4">
            <button type="submit" class="btn btn-success" style="margin: 0 5px;">작성 완료</button>
            <button type="reset" class="btn btn-secondary" style="margin: 0 5px;">다시 입력</button>
            <a href="list.do" class="btn btn-primary" style="margin: 0 5px;">목록으로</a>
        </div>

    </form>
</div>

	<%@ include file="footer.jsp" %>
</body>
</html>

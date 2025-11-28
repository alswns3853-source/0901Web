<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세보기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <h2 class="text-center">게시물 상세보기</h2>

    <!-- 게시물 정보 표시 -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">${board.title}</h3>
        </div>
        <div class="panel-body">
            <p><strong>작성자:</strong> ${board.id}</p>
            <p><strong>작성일:</strong> <fmt:formatDate value="${board.postdate}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
            <p><strong>조회수:</strong> ${board.visitcount}</p>
            <p><strong>내용:</strong></p>
            <div class="content">
                <p>${board.content}</p>
            </div>
        </div>
    </div>

  
    <div class="text-center" style="margin-top: 20px;">

   


    <a href="edit.do?num=${board.num}" class="btn btn-warning" style="margin: 0 5px;">수정</a>

  
    <a href="delete.do?num=${board.num}" 
       class="btn btn-danger" 
       style="margin: 0 5px;"
       onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        <a href="list.do" class="btn btn-primary" style="margin: 0 5px;">목록으로</a>
</div>

</div>
<%@ include file="footer.jsp" %>
</body>
</html>

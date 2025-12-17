<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세보기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/css/animate.min.css" rel="stylesheet">
    <link href="/resources/css/prettyPhoto.css" rel="stylesheet">
    <link href="/resources/css/main.css" rel="stylesheet">
    <link href="/resources/css/responsive.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container" style="margin-top:50px; margin-bottom:50px;">
    <h2 class="text-center">게시물 상세보기</h2>


    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">${dto.title}</h3>
        </div>
        <div class="panel-body">
            <p><strong>작성자:</strong> ${dto.id}</p>
            <p><strong>작성일:</strong> <fmt:formatDate value="${dto.postdate}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
            <p><strong>조회수:</strong> ${dto.visitcount}</p>
            <p><strong>내용:</strong></p>
            <div class="content">
                <c:set var="enter" value="
"/>
                <p><c:out value="${fn:replace(dto.content, enter, '<br/>')}" escapeXml="false"/></p>
            </div>
        </div>
    </div>






<div class="text-center" style="margin-top: 20px;">




    <a href="/todo/edit?num=${dto.num}" class="btn btn-warning" style="margin: 0 5px;">수정</a>


        <form action="/todo/remove" method="post" style="display:inline;" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
            <input type="hidden" name="num" value="${dto.num}" />
            <button type="submit" class="btn btn-danger" style="margin: 0 5px;">삭제</button>
        </form>
        <a href="/todo/list" class="btn btn-primary" style="margin: 0 5px;">목록으로</a>

</div>

</div>

<div style="height: 300px;"></div>
<%@ include file="footer.jsp" %>
</body>
</html>

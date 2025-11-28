<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
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
    
    <div class="d-flex justify-content-between align-items-center">
        <h2 class="text-center">공지사항 목록</h2>
        <a href="write.do" class="btn btn-primary">글쓰기</a>
    </div>

    <table class="table table-bordered table-hover table-striped" style="margin-top:20px;">
        <thead class="thead-light">
            <tr class="info text-center">
                <th width="10%">번호</th>
                <th width="40%">제목</th>
                <th width="20%">작성자</th>
                <th width="10%">조회수</th>
                <th width="20%">작성일</th>
            </tr>
        </thead>

        <tbody>
            <c:if test="${empty boardLists}">
                <tr>
                    <td colspan="5" class="text-center text-muted">등록된 게시물이 없습니다 😊</td>
                </tr>
            </c:if>

            <c:if test="${not empty boardLists}">
                <c:forEach var="dto" items="${boardLists}" varStatus="loop">
                    <tr class="text-center">
                        <td>
						${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
						</td>

                        <td class="text-left">
                            <a href="view.do?num=${dto.num}">
                                ${dto.title}
                            </a>
                        </td>

                        <td>${dto.id}</td>
                        <td>${dto.visitcount}</td>

                        <td>
                            <fmt:formatDate value="${dto.postdate}" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </tbody>
    </table>
</div>

<div style="height: 400px;"></div>
<%@ include file="footer.jsp" %>
</body>
</html>

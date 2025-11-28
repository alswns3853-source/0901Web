<%@page import="utils.BoardPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
    <%@ include file="../Common/Link.jsp"%>

    <!-- 페이지 번호, 전체 페이지 수 표시 -->
    <h2>목록 보기(List) - 현재 페이지 : ${pageNum} (전체 : ${totalPage})</h2>

    <!-- 검색 영역 -->
    <form method="get">
        <table border="1" width="90%">
            <tr align="center">
                <td>
                    <select name="searchField">
                        <option value="title" ${param.searchField=='title' ? 'selected' : ''}>제목</option>
                        <option value="content" ${param.searchField=='content' ? 'selected' : ''}>내용</option>
                    </select>

                    <input type="text" name="searchWord" value="${param.searchWord}" />
                    <input type="submit" value="검색하기" />
                </td>
            </tr>
        </table>
    </form>

    <!-- 게시글 목록 -->
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>

        <c:choose>
            <c:when test="${empty boardLists}">
                <tr>
                    <td colspan="5" align="center">등록된 게시물이 없습니다^^*</td>
                </tr>
            </c:when>

            <c:otherwise>
                <c:forEach var="dto" items="${boardLists}" varStatus="loop">

                    <!-- 게시글 가상 번호 계산 -->
                    <c:set var="virtualNum"
                           value="${totalCount - ((pageNum - 1) * pageSize) - loop.index}" />

                    <tr align="center">
                        <td>${virtualNum}</td>

                        <td align="left">
                            <a href="View.jsp?num=${dto.num}">${dto.title}</a>
                        </td>

                        <td>${dto.id}</td>
                        <td>${dto.visitcount}</td>
                        <td>${dto.postdate}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </table>

    <!-- 페이지 네비게이션 + 글쓰기 버튼 -->
    <table border="1" width="90%">
        <tr align="center">
            <td>
                ${BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, url)}
            </td>
            <td>
                <button type="button" onclick="location.href='write.jsp';">글쓰기</button>
            </td>
        </tr>
    </table>

</body>
</html>

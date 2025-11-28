<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title> 공지사항 | 고객센터 | 투어리스트인투어 </title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="css/common.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/common.js"></script>  
<script src="js/jquery.smooth-scroll.min.js"></script> 
<!--[if lte IE 9]>
    <script src="js/html5shiv.js"></script>
	<script src="js/placeholders.min.js"></script>
<![endif]-->
</head>

<body>
<ul class="skipnavi">
    <li><a href="#container">본문내용</a></li>
</ul>
<!-- wrap -->
<div id="wrap">

	<jsp:include page="header.jsp" />
	
	<div id="container">
		<!-- location_area -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">TOURIST <span class="in">in</span> TOUR</h2>
				<p class="location">고객센터 <span class="path">/</span> 공지사항</p>
				<ul class="page_menu clear">
					<li><a href="#" class="on">공지사항</a></li>
					<li><a href="#">문의하기</a></li>
				</ul>
			</div>
		</div>	
		<!-- //location_area -->

		<!-- bodytext_area -->
		<div class="bodytext_area box_inner">
			<form action="notice_list.jsp" class="minisrch_form">
				<fieldset>
					<legend>검색</legend>
					<input type="text" class="tbox" name="searchWord" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
					<button class="btn_srch">검색</button>
					<a href="notice_add.jsp" class="btn_srch">글쓰기</a>
				</fieldset>
			</form>
			<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
				<caption class="hdd">공지사항  목록</caption>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty boardLists}">
						<tr><td>게시글이 없습니다.</td></tr>
						</c:if>
					<c:if test="${not empty boardLists}">
						<c:forEach var="dto" items="${boardLists }">
					<tr>
						<td>${dto.num }</td>
						<td class="tit_notice"><a href="notice_view.jsp?num=${dto.num}">${dto.title}</a> </td>
						<td>${dto.visitcount}</td>
						<td>${dto.postdate}</td>
					</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
			<!-- pagination -->
			<div class="pagination">
			
			<c:if test="${pageTemp != 1 }">
				<a href="notice_list.jsp?pageNum=1" class="firstpage  pbtn"><img src="img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				<a href="notice_list.jsp?pageNum=${pageTemp-1}" class="prevpage  pbtn"><img src="img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
			</c:if>
			<c:forEach begin="${pageTemp}" end="${endPage}" var="page">
				<c:if test="${page eq pageNum }"> 
					<a href="notice_list.jsp?pageNum=${page}"><span class="pagenum currentpage">${page}</span></a>
				</c:if>
				<c:if test="${pageTemp != pageNum }">
					<a href="notice_list.jsp?pageNum=${page}"><span class="pagenum">${page}</span></a>
				</c:if>
				<c:set var="blockCount" value="${blockCount+1}" />
				<c:set var="pageTemp" value="${pageTemp+1}"/>

			</c:forEach>
				<c:if test="${pageTemp <= totalPages }">
				<a href="notice_list.jsp?pageNum=${pageTemp}" class="nextpage  pbtn"><img src="img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				<a href="notice_list.jsp?pageNum=${totalPages}" class="lastpage  pbtn"><img src="img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
				</c:if>
			</div>
			<!-- //pagination -->
			
		</div>
		<!-- //bodytext_area -->

	</div>
	<!-- //container -->

	<jsp:include page="footer.jsp" />

</div>
<!-- //wrap -->

<jsp:include page="quicklink.jsp" />

</body>
</html>

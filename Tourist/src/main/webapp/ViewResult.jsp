<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title> 박물관 미션 투어 당첨자 발표 | 공지사항 | 고객센터 | 투어리스트인투어 </title>
<script>
function deletePost() {
	// confirm창에서 확인 버튼을 누르면 true를 취소를 누르면 false 반환
	var confirmed = confirm("정말로 삭제하겠습니까?");
	if (confirmed){
		// form태그 저장
		let form = document.writeFrm;
		// method설정 : post,get
		form.method = "post";
		// submin시 실행할 페이지 설정
		form.action = "deleteProcess.jsp";
		// submin 실행
		form.submit();
	}
}
</script>
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
		<form name="writeFrm">
		<input type="hidden" name="num" value="${dto.num }" />
		</form>
		<div class="bodytext_area box_inner">			
			<ul class="bbsview_list">
				<li class="bbs_title">${dto.title }</li>
				<li class="bbs_hit">작성일 : <span>${dto.postdate }</span></li>
				<li class="bbs_date">조회수 : <span>${dto.visitcount }</span></li>
				<li class="bbs_content">
					<div class="editer_content">
					   ${dto.content }
                    </div>
				</li>
			</ul>
			<p class="btn_line txt_right">
			<c:if test="${user_id != null and user_id eq dto.id}">
					<a href="Edit.jsp?num=${dto.num }" class="btn_bbs">수정하기</a>
				<button type="button" onclick="deletePost();" class="btn_bbs" >삭제하기</button>
				</c:if>
				<a href="notice_list.jsp;" class="btn_bbs" >목록</a>
				
			</p>
			<ul class="near_list mt20">
				<li><h4 class="prev">다음글</h4><a href="javascript:;">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a></li>		
				<li><h4 class="next">이전글</h4><a href="javascript:;">이번 여름 휴가 제주 갈까? 미션 투어 (여행경비 50만원 지원)</a></li>
			</ul>
		</div>
		<!-- //bodytext_area -->

	</div>
	<!-- //container -->

	<%@include file = "./footer.jsp" %>

</div>
<!-- //wrap -->

<h2 class="hdd">빠른 링크 : 전화 문의,카카오톡,오시는 길,꼭대기로</h2>
<%@include file = "./quicklink.jsp" %>

</body>
</html>

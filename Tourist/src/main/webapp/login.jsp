<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String loginId = CookieManager.readCookie(request,"loginId");

String cookieCheck = "";
if (!loginId.equals("")){
	cookieCheck = "checked";
}
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
<title> 로그인 | 투어리스트인투어 </title>
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
<script type="text/javascript">
// 현재 페이지에만 적용
$(document).ready(function(){
	$('.switch').click(function(){			// 로그인 유지 작동
		$(this).toggleClass("switchOn");
	});
	$('.quick_area').hide();				// 우측 빠른 실행 메뉴 숨김 
});
</script>
</head>

<body>
<ul class="skipnavi">
    <li><a href="#container">본문내용</a></li>
</ul>
<!-- wrap -->
<div id="wrap" class="s_point">
	
	<div id="container" id="layout0">
		
		<!-- bodytext_area -->
		<div class="bodytext_area box_inner">
			<!-- login-wrap -->
			<div class="login_wrap">
			<form action="loginProcess.jsp" method="post">
				<h1 class="loginTit"><a href="index.jsp"><img src="img/tit_login.png" alt="TOURIST IN TOUR" /></a></h1>
				<ul class="login_list">	
					<%
			String loginErr = request.getParameter("loginErr");

			%>
				 <c:if test="${loginErr != null }" >
				
			
				 </c:if> 
				
					<li><input type="text" name = "id"  size="30" placeholder="아이디" value ="<%= loginId %>"/></li>
					<li><input type="password" name = "pw" size = "30" placeholder="비밀번호"/></li>	
					<li><input type="checkbox" class="css-checkbox" id="agree_lbl" name="save_check" value="Y" <%=cookieCheck %>>
						<label for ="agree_lbl">아이디 저장 </label>
					<button class="btn_srch">로그인</button>
					
					</li>
					<li class="kakao"><a href="javascript:;"><strong>카카오톡</strong> 로그인</a></li>
					<li class="naver"><a href="javascript:;"><strong>네이버</strong> 로그인</a></li>
					<li class="facebook"><a href="javascript:;"><strong>페이스북</strong> 로그인</a></li>
					<li class="cellphone"><a href="javascript:;"><strong>이메일 주소</strong> 로그인</a></li>
				</ul>
				<div class="btnonoff_line">
					<div class="switch"></div>
					<p>
					    <a href="#" class="btn_onoff" onclick="return false;">로그인 유지</a>
					</p>
				</div>
        		</form>	
			</div>
			<!-- //login-wrap -->

		</div>
		<!-- //bodytext_area -->

	</div>
	<!-- //container -->

	<%@ include file = "footer.jsp" %>

</div>
<!-- //wrap -->

</body>
</html>
    
<%@page import="utils.CookieManager"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 화면상에 on, off 가 나오도록 변수 설정
    // String popupMode = "on";
    //모든 쿠키를 변수에 저장
    String popupClose = CookieManager.readCookie(request, "PopupClose");
    String popupMode = popupClose.equals("") ? "on" : popupClose;
   /*  Cookie[] cookies = request.getCookies();
    if (cookies != null){
    	// 모든 쿠키를 확인할 수 있도록 반복문 실행
    	for (Cookie c : cookies){
    		String cookieName = c.getName();
    		String cookieValue = c.getValue();
    		// PopupCookie가 있으면 value값을 popupMode변수에 저장
    		if(cookieName.equals("PopupClose")){
    			popupMode = cookieValue;
    		}
    	}
    } */
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리</title>
<style>
	div#popup{
		position : absolute; top:100px; left:100px; color:yellow;
		width:300px; height:100px; background-color:gray;
}
div#popup>div{
		position : relative; background-color:#ffffff; top:0px;
		border:1px solid gray; padding:10px; color:black;
		
}
</style>
<!-- JQuery 다운로드 코드 -->
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
//	JavaScript에서 화면이 불려온 후 자바스크립트를 불러오도록 하는 기능
window.onload = function(){
	let closeButton = document.querySelector("#closeBtn");
	if(closeButton != null){
	closeButton.addEventListener("click", function(){
	document.querySelector("#popup").style.display = "none";
	var checkbox = document.querySelector("#inactiveToday");
	var chkVal = checkbox.checked ? checkbox.value : null;
	if (chkVal == 1){
		// fetch(실행할 주소, {설정할 내용})
		fetch('./PopupCookie.jsp?inactiveToday=1',{
			method : "get"
		})
				//.then(function)(response){return response.text()})
				// 응답 결과를 텍스트로 변환
				.then(response => response.text())
				// 변환된 데이터가 공백이 아닌 경우 새로고침을 실행
				.then(resData => {
					if(resData != '') location.reload();
		})
	}
 })
}
}
/* //Jquery에서 화면이 불려온 후 코드를 불러오도록 하는 기능
$(function() {
	// id가 closeBtn인 태그를 선택한 후 click이벤트를 설정
	$('#closeBtn').click(function(){
    // popup 태그를 display를 none으로 설정
	$('#popup').hide();
    // inactiveToDay가 체크되어있다면 데이터를 chkVal변수에 1을 저장
	var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
	if(chkVal==1){
		// 비동기통신(ajax) : 화면이 새로고침 되지 않고 자바스크립를 이용하여 서버와 통신하는 방식
		// 동기화통신(a태그, form태그) : 화면이 새로고침 되는 방식
		$.ajax({
			// 실행할 주소 설정
			url : './PopupCookie.jsp',
			// get,post 설정
			type : 'get',
			// 함께 보낼 데이터 설정
			data : {inactiveToday : chkVal},
			// 데이터의 타입 : 보통은 text, json
			dataType : "text",
			// 비동신 통신이 성공한 경우 실행할 함수 작성
			success : function(resData){
				// 응답 데이터가 있을 경우 새로고침 실행
				if (resData != '')location.reload();
			}
		});
	 }
	});
}); */
</script>
<body>
<h2>팝업 메인 페이지</h2>
<%
for (int i = 1; i <=10; i++){
	out.print("현재 팝업창은 " + popupMode + " 상태입니다.<br>");
}
//JSFunction.alertLocation("alertLocation 실행", "cookiemain.jsp" , out);
//JSFunction.alertBack("alertBack실행", out);
// popupMode 가 off인 경우 popup창을 생성하지 않음
if(popupMode.equals("on")){
	%>	
	<div id="popup">
	<h2 align = "center">공지사항 팝업입니다.</h2>
	<div align = "right"><form name="popFrm">
		<input type="checkbox" id="inactiveToday" value="1">
		하루 동안 열지 않음
		<input type="button" value="닫기" id="closeBtn">
	</form></div>
	</div>
	<% }%>
</body>
</html>
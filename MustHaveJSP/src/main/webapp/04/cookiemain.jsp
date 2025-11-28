<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
<h2>1. 쿠키(Cookie) 설정</h2>
	<%
	// 쿠키를 생성 -> new Cookie(key , value)로 쿠키 객체 생성
	Cookie cookie = new Cookie("myCookie", "쿠키맛나요");
	// setPath(경로) : 쿠키 사용 경로 설정
	cookie.setPath(request.getContextPath());
	out.println(request.getContextPath());
	// setMaxAge(초단위) : 유효기간, 유효기간이 끝나면 브라우저에서 삭제하는 방식
	cookie.setMaxAge(60*60*24*7);
	// 쿠키를 1초후에 삭제하는 방식 : 쿠키 삭제 메서드는 없음
	// cookie.setMaxAge(1);
	// 응답에 쿠키를 추가하는 메서드
	response.addCookie(cookie);
	%>
	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<%
	// 클라이언트가 보내주는 쿠키를 출력하는 메서드
	Cookie[] cookies = request.getCookies();
	// 쿠기가 있을때 실행하는 if문
	if (cookies!=null){
		// 모든 쿠키를 출력하는 for문
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			out.println(String.format("%s : %s<br>", cookieName, cookieValue));
		}
	}
	%>
	
	<h2>3. 페이지 이동 후 쿠기값 확인하기</h2>
	<a href="CookieResult.jsp">
		다음 페이지에서 쿠키값 확인하기
	</a>
</body>
</html>
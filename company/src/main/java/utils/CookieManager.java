package utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {
	// 쿠키 생성을 쉽게하는 메서드
	public static void makeCookie(HttpServletResponse response, String cName,
			String cValue, int cTime) {
		// 쿠키 생성
		Cookie cookie = new Cookie(cName, cValue);
		// 경로 설정
		cookie.setPath("/");
		// 유효기간 설정
		cookie.setMaxAge(cTime);
		// 응답에 쿠키 추가
		response.addCookie(cookie);
	}
//	쿠키에서 key를 기준으로 value값을 찾아 반환하는 메서드
	public static String readCookie(HttpServletRequest request, String cName) {
//		return 할 변수를 선언
		String cookieValue = "";
		// 모든 쿠키를 배열에 저장
		Cookie[] cookies = request.getCookies();
		// 쿠키있는지 확인
		if (cookies != null) {
			for( Cookie c : cookies) {
				String cookieName = c.getName();
				// 쿠키중에 cName이 있는지 확인
				if(cookieName.equals(cName)) {
					// 있다면 value를 return하도록 변수에 설정
					cookieValue = c.getValue();
				}
			}
		}
		return cookieValue;
	}
	// 쿠키를 삭제하는 메서드
	public static void deleteCookie(HttpServletResponse response, String cName) {
		// 쿠키 생성 메서드에 시간을 0으로 설정 쿠키가 삭제됨
		makeCookie(response, cName, "", 0);
	}
}

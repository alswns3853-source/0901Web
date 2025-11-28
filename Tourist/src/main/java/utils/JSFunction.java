package utils;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = ""
					+"<script>"
					+"	alert('" + msg + "');" // 메시지창에 msg 출력하는 기능
					+"	location.href='" + url + "';" // a태그처럼 url로 이동
					+"</script>";
			// JSFunction클래스에서 out.을 사용할 수 있도록 하는 기능
			out.println(script);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
					+"<script>"
					+"	alert('" + msg + "');"	//메세지 출력
					+"	history.back();" // 뒤로가기 실행
					+"</script>";
			out.println(script);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}

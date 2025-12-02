<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹 소켓 채팅</title>
</head>
<body>
<script>
	function chatWinOpen(){
		// 대화명을 저장하는 input태그 변수로 사용
		var id = document.getElementById("chatId");
		// 대화명을 입력하지 않았을 경우 채팅창을 출력하지 않고 메시지 출력
		if(id.value == ""){
			alert("대화명을 입력 후 채팅창을 열어주세요.");
			id.focus();
			return;
		}
		// 새로운 창 열기
		window.open("ChatWindow.jsp?chatId="+id.value, "", "width=320,height=400");
		id.value="";
	}
</script>
<h2>웹 소켓 채팅 - 대화명 적용해서 채팅창 뛰어주기</h2>
대화명 : <input type="text" id="chatId"/>
<button onclick="chatWinOpen();">채팅 참여</button>
</body>
</html>











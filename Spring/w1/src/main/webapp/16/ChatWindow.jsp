<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹 소켓 채팅</title>
<script>
// 웹 소켓 접속                   ws://localhost:8080/MustHaveJSP/ChatingServer
var webSocket = new WebSocket("<%=application.getInitParameter("CHAT_ADDR")%>/ChatingServer");
var chatWindow, chatMessage, chatId;
// 문서 전체가 로딩된 후 실행되는 코드
window.onload = function(){
	// 채팅이 보이는 태그
	chatWindow=document.getElementById("chatWindow");
	// 채팅 하나하나를 의미하는 태그
	chatMessage=document.getElementById("chatMessage");
	// 대화명을 저장하는 태그
	chatId=document.getElementById("chatId").value;
}
// 서버로 메시지를 보내는 함수
function sendMessage(){
	// 채팅창에 자신이 작성한 메시지를 추가
	chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>";
	// ChatServer.java 파일의 OnMessage를 실행
	webSocket.send(chatId + "|" + chatMessage.value);
	// 타이핑 내용 지우기
	chatMessage.value = "";
	// 채팅창의 스크롤 가장 아래로 내리는 코드
	// scrollTop : 상하로 스크롤의 위치를 설정하는 변수
	// scrollHeight : 현재 채팅창의 스크롤 최대 길이
	chatWindow.scrollTop = chatWindow.scrollHeight;
}
function disconnect(){
	// 웹소켓 접속 종료
	webSocket.close();
}

//엔터키를 누를때 실행되는 함수
function enterKey(){
	// 13 : 엔터키 
	if(window.event.keyCode == 13){
		sendMessage();
	}
}

// 웹소켓이 열릴때 실행되는 함수
webSocket.onopen = function(event){
	chatWindow.innerHTML += "웹 소켓 서버에 연결되었습니다<br/>";
};
// 웹소켓이 종료될때 실행되는 함수
webSocket.onclose = function(event){
	chatWindow.innerHTML += "웹 소켓 서버가 종료되었습니다<br/>";
}
// 웹소켓에서 에러가 발생했을때 실행되는 함수
webSocket.onerror = function(event){
	alert(event.data);
	chatWindow.innerHTML += "채팅 중 에러가 발생했습니다.<br/>";
}
//event : webSocket.send(문자열)가 실행될때 매개변수로 사용된 데이터
webSocket.onmessage = function(event){
	// event : 대화명|메시지 
	var message = event.data.split("|");
	// 대화명
	var sender = message[0];
	// 메시지
	var content = message[1];
	//메시지가 있는지 없는지 확인하는 if문
	if(content != ""){
		// 귓속말 처리 코드
		// /(슬러시)가 있는지 확인하는 if문
		if(content.match("/")){
			// 메시지 안에 있는 대화명이 자신의 이름이면 실행 
			if(content.match(("/"+chatId))){
				// '/대화명'을 '[귓속말]' 로 변경
				var temp = content.replace(("/"+chatId), "[귓속말] : ");
				// 채팅창에 메시지를 출력
				chatWindow.innerHTML += "<div>"+sender+""+temp+"</div>";
			}
		}else{
			// 채팅창에 메시지를 출력
			chatWindow.innerHTML += "<div>"+sender+" : "+content+"</div>";
		}
	}
	// 스크롤을 제일 아래로 설정
	chatWindow.scrollTop = chatWindow.scrollHeight;
}
</script>
</head>
<style>
#chatWindow{
	border: 1px solid black;
	width: 270px;
	height: 310px;
	overflow: scroll;
	padding: 5px;
}
#chatMessage{width: 236px; height:30px;}
#sendBtn{height:30px; position:relative; top:2px; left:-2px;}
#closeBtn{margin-bottom:3px; position: relative; top:2px;, left:-2px;}
#chatId{width: 158px; height:24px; border:1px solid #AAAAAA; background-color: #EEEEEE;}
.myMsg{text-align:right;}
</style>
<body>
	대화명 : <input type="text" id="chatId" value="${param.chatId }" readonly />
	<button id="closeBtn" onclick="disconnect();">채팅 종료</button>
	<div id="chatWindow"></div>
	<div>
		<input type="text" id="chatMessage" onkeyup="enterKey();">
		<button id="sendBtn" onclick="sendMessage();">전송</button>
	</div>
	
</body>
</html>









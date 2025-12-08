package org.zerock.w1.websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer")
public class ChatServer {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	@OnOpen // 처음 접속했을때 실행하는 메서드
	public void onOpen(Session session) {
		clients.add(session); //clients에 접속한 유저의 세션을 저장
		System.out.println("웹 소켓 연결" + session.getId());
	}
	@OnMessage
	public void onMessage(String message, Session session) throws IOException{
		System.out.println("메시지 전송 : " + session.getId() + " : "+ message);
		synchronized (clients){
			// 현재 접속해 있는 세션들에게 메시지를 전달
			for(Session client : clients) {
				// 자기 자신을 제외한 나머지 인원에게 메시지를 전송
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	@OnClose
	public void onClose(Session session) {
		clients.remove(session); // clients 접속을 종료한 유저의 세션을 삭제
		System.out.println("웹 소켓 종료 : " + session.getId());
	}
	
	@OnError // 에러 발생시 콘솔창에 오류 로그 출력
	public void onError(Throwable e) {
		System.out.println("에러 발생");
		e.printStackTrace();
	}
}












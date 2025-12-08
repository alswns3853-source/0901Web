package org.zerock.w1.smtp;

import java.util.Map;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class NaverSMTP {
	private final Properties serverInfo;
	private final Authenticator auth;
	
	// 네이버 smtp서버 접속 설정
	public NaverSMTP(String id, String pw) {
		serverInfo = new Properties();
		serverInfo.put("mail.smtp.host", "smtp.naver.com");
		serverInfo.put("mail.smtp.port", "465");
		serverInfo.put("mail.smtp.auth", "true");
		serverInfo.put("mail.smtp.debug", "true");
		serverInfo.put("mail.smtp.ssl.enable", "true");
		auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(id, pw);
			}
		};
		
	}
	// 메일을 보내는 메서드
	public void emailSending(Map<String, String> mailInfo) throws MessagingException {
		// 네이버 서버에 접속
		Session session = Session.getInstance(serverInfo, auth);
		session.setDebug(true);
		// 이메일 생성
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(mailInfo.get("from")));
		msg.addRecipient(Message.RecipientType.TO,new InternetAddress(mailInfo.get("to")));
		msg.setSubject(mailInfo.get("subject"));
		msg.setContent(mailInfo.get("content"), mailInfo.get("format"));
		// 메일 전송
		Transport.send(msg);
	}
	

}










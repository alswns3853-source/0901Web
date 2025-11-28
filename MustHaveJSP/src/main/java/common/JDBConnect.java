package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

	public class JDBConnect {
		public Connection con; // 데이터베이스 연결을 위한 클래스
		// SQL작성시 사용하는 클래스
		public Statement stmt;  // 한번만 SQL 실행 가능
		public PreparedStatement psmt; // 여러번 SQL 실행 가능
		public ResultSet rs; // SELECT문의 결과를 담는 클래스
		
		// Connection클래스를 생성하는 생성자
		public JDBConnect() {
			try {
				// JDBC로 사용할 클래스 설정
				Class.forName("oracle.jdbc.OracleDriver");
				// DB의 주소
				String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
				// 오라클에서 사용할 아이디와 비밀번호 설정
				String id = "musthave"; 
				String pwd = "1234";
				// 실제로 DB와 연결되어 Connection클래스에 저장
				con = DriverManager.getConnection(url, id, pwd);
				System.out.println("DB 연결 성공(기본 생성자)");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		// web.xml에 저장한 DB정보로 연결하는 생성자
	public JDBConnect(ServletContext application){
		try {
			// 내장객체 application에서 DB접속 데이터를 받아와 설정
			Class.forName(application.getInitParameter("OracleDriver"));
			
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB 연결 성공(web.xml로 실행)");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			if (rs != null)rs.close();
			if (stmt != null)stmt.close();
			if (psmt != null)psmt.close();
			if (con != null)con.close();
			
			System.out.println("JDBC 자원 해제");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}

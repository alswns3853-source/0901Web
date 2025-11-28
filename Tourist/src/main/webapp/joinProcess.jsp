<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String emailId = request.getParameter("emailId");
	String emailAddress = request.getParameter("emailAddress");
    String name = request.getParameter("name");
    String password  = request.getParameter("password");
    String tel = request.getParameter("tel");
    String gender = request.getParameter("gender");
    String agree = request.getParameter("agree");
    String content = request.getParameter("content");
    
    DBConnPool cp =new DBConnPool();
    // PrepareStatement를 이용한 INSERT문 실행하기
    
  	 
    String sql = "INSERT INTO TOURIST_MEMBER"
    		+"(email_id, email_address, name," 
    		+"password, tel, gender,agree, content,regidate)"
    			+ "VALUES(?, ?, ?,?, ?, ?, ?,?,sysdate)";
    cp.psmt = cp.con.prepareStatement(sql);
    cp.psmt.setString(1, emailId );
    cp.psmt.setString(2, emailAddress);
    cp.psmt.setString(3, name);
    cp.psmt.setString(4, password);
    cp.psmt.setString(5, tel);
    cp.psmt.setString(6, gender);
    cp.psmt.setString(7, agree);
    cp.psmt.setString(8, content);
    cp.psmt.executeUpdate();
    cp.close(); 
    response.sendRedirect("login.jsp");
   
   
     
    
%>
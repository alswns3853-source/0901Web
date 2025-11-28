<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String Id = request.getParameter("id");
	String Name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String Checkpass = request.getParameter("checkpass");
	
	DBConnPool cp = new DBConnPool();
	
	String sql = "INSERT INTO MEMBERS"
			+"(id, name, pass, checkpass)"+"VALUES(?,?,?,?)";
	
	cp.psmt = cp.con.prepareStatement(sql);
	cp.psmt.setString(1, Id);
	cp.psmt.setString(2, Name);
	cp.psmt.setString(3, pass);
	cp.psmt.setString(4, Checkpass);
    cp.psmt.executeUpdate();
    cp.close(); 
    response.sendRedirect("boardlogin.do");
%>
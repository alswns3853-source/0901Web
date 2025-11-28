<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! //선언부 : 멤버변수, 메서드를 선언하는 태그
public int add(int num1, int num2){
	return num1 + num2;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
<% 	//스크립틀릿 태그 : 일반적인 자바코드를 사용하는 태그
	// main 메서드처럼 사용할 수 있음
	int result = add(10, 20);
%>
		<!-- 표현식태그 : out.print() 대신 사용하는 태그 -->
덧셈 결과 1 : <%= result %><br/> 
덧셈 결과 2 : <%= add(30,40)%><br/>
덧셈 결과 1 : <% out.print(result);%><br/> 
덧셈 결과 2 : <% out.print(add(30,40));%><br/>
</body>
</html>
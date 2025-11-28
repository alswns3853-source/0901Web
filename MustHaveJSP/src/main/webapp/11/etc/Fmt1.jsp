<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt 1</title>
</head>
<body>
	<h4>숫자 포맷 설정</h4>
	<c:set var="number1" value="12345" />
	<!-- 자동으로 콤마를 붙여서 출력 -->
	콤마 O : <fmt:formatNumber value="${number1}" /><br>
	콤마 X : <fmt:formatNumber value="${number1}" groupingUsed="false" /><br>
	<!-- 통화기호를 붙일때 사용, currencySymbol을 설정하여 원하는 기호로 변경 가능(ㄹ+한자키) -->
	<fmt:formatNumber value="${number1}" type="currency" var="printNum1" />
	통화기호 : ${printNum1} <br>
	<!-- 소수점 값을 퍼센트로 출력 -->
	<fmt:formatNumber value="0.03" type="percent" var="printNum2" />
	퍼센트 : ${printNum2}

	<h4>문자열을 숫자로 변경</h4>
	<c:set var="number2" value="6,789.01" />
	<!-- pattern에 숫자의 콤마와 소수점을 설정하여 숫자로 변경 가능 -->
	<fmt:parseNumber value="${number2}" pattern="00,000.00" var="printNum3" />
	소수점까지 : ${printNum3} <br>
	<!-- intergerOnly="true" : 정수 부분만 출력하도록 설정 -->
	<fmt:parseNumber value="${number2}" integerOnly="true" var="printNum4" />
	정수 부분만 : ${printNum4}
</body>
</html>

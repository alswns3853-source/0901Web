<%@page import="model1.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// DB 연결
BoardDAO dao = new BoardDAO();
// Map자료구조에 검색조건을 담아서 DB에 전달
Map<String, Object> param = new HashMap<String, Object>();
// 제목 혹은 내용을 검색할 컬럼명 설정
String searchField = request.getParameter("searchField");
// 검색할 단어 설정
String searchWord = request.getParameter("searchWord");
// 검색할 단어가 있으면 map 자료구조에 추가
if (searchWord != null){
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
// 검색조건을 포함하여 게시글의 개수를 저장
int totalCount = dao.selectCount(param);
// 게시글 데이터 저장
List<BoardDTO> boardLists = dao.selectList(param);
// DB연결 종료
dao.close();
// request에 화면출력에 필요한 데이터를 저장
request.setAttribute("boardLists", boardLists);
request.setAttribute("totalCount", totalCount);
// 화면출력 jsp를 실행
request.getRequestDispatcher("ListResult.jsp")
	.forward(request, response);
%>
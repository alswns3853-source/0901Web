<%@page import="model1.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO();
Map<String, Object> param = new HashMap<String, Object>();

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if (searchWord != null && !searchWord.trim().equals("") 
        && searchField != null && !searchField.trim().equals("")) {
    param.put("searchField", searchField);
    param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param);

// web.xml 설정값
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("POSTS_PER_BLOCK"));

int totalPage = (int)Math.ceil((double)totalCount / pageSize);

// pageNum 세팅
int pageNum = 1;
try {
    String pageTemp = request.getParameter("pageNum");
    if(pageTemp != null && !pageTemp.equals("")) {
        pageNum = Integer.parseInt(pageTemp);
    }
} catch(Exception e) { 
    pageNum = 1; 
}

// 시작/끝 인덱스
int start = (pageNum - 1) * pageSize + 1;
int end = pageNum * pageSize;

param.put("start", start);
param.put("end", end);

List<BoardDTO> boardLists = dao.selectListPage(param);
dao.close();

// request 저장
request.setAttribute("boardLists", boardLists);
request.setAttribute("totalPage", totalPage);
request.setAttribute("pageSize", pageSize);
request.setAttribute("blockPage", blockPage);
request.setAttribute("totalCount", totalCount);
request.setAttribute("url", request.getRequestURI());
request.setAttribute("pageNum", pageNum);

// 결과 JSP로 이동
request.getRequestDispatcher("ListResult.jsp").forward(request, response);
%>

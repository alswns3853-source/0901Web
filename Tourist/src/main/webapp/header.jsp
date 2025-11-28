<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<header id="header">
		<div class="header_area box_inner clear">	
			<h1><a href="index.jsp">Tourist in tour</a></h1>
			<p class="openMOgnb"><a href="#"><b class="hdd">메뉴열기</b> <span></span><span></span><span></span></a></p>
			<!-- header_cont -->
			<div class="header_cont">
				<ul class="util clear">	
				<%-- <%if(session.getAttribute("user_id")!= null){%>
					<li style="color:white;"><%=session.getAttribute("user_id")%>님 반갑습니다.</li>
					<li><a href="mypage.jsp">마이페이지</a></li>
					<li><a href="logouot.jsp">로그아웃</a></li>
				<%}else{ %>
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
					<%} %> --%>
				<%String user_id 
				 = session.getAttribute("user_id") !=null 
				 ? session.getAttribute("user_id").toString() : null; 
				 if(user_id == null){%>
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
					<%}else{ %>
					<li style="color:white;"><%=session.getAttribute("user_id")%>님 반갑습니다.</li>
					<li><a href="mypage.jsp">마이페이지</a></li>
					<li><a href="logout.jsp">로그아웃</a></li>
					<%} %>
				</ul>	
				<nav>
				<ul class="gnb clear">
					<li><a href="javascript:;" class="openAll1">여행정보</a>

                        <div class="gnb_depth gnb_depth2_1">
                            <ul class="submenu_list">
                                <li><a href="javascript:;">국내</a></li>
                                <li><a href="javascript:;">해외</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="javascript:;" class="openAll2">고객센터</a>
				        <div class="gnb_depth gnb_depth2_2">
                            <ul class="submenu_list">
                                <li><a href="notice_list.jsp">공지사항</a></li>
                                <li><a href="javascript:;">문의하기</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="javascript:;" class="openAll3">상품투어</a>
                        <div class="gnb_depth gnb_depth2_3">
                            <ul class="submenu_list">
                                <li><a href="javascript:;">프로그램 소개</a></li>
                                <li><a href="javascript:;">여행자료</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="javascript:;" class="openAll4">티켓/가이드</a>
                        <div class="gnb_depth gnb_depth2_4">
                            <ul class="submenu_list">
                                <li><a href="javascript:;">항공</a></li>
                                <li><a href="javascript:;">호텔</a></li>
                            </ul>
                        </div>
					</li>
				</ul>
                </nav>
				<p class="closePop"><a href="javascript:;">닫기</a></p>
			</div>
			<!-- //header_cont -->
		</div>
	</header>
	
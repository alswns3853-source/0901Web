<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title> 투어리스트인투어 </title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="css/swiper.min.css">
<link rel="stylesheet" href="css/common.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/rollmain.js"></script>
<script src="js/jquery.easing.js"></script>	
<script src="js/common.js"></script>  
<script src="js/jquery.smooth-scroll.min.js"></script> 
<!--[if lte IE 9]>
    <script src="js/html5shiv.js"></script>
	<script src="js/placeholders.min.js"></script>
<![endif]-->
</head>
<body>
<ul class="skipnavi">
    <li><a href="#container">본문내용</a></li>
</ul>
<!-- wrap -->
<div id="wrap">

	<%@ include file = "header.jsp" %>
    <%-- <jsp:include page = "header.jsp"/> --%>
    
	<div id="container">
        <div class="main_rolling_pc">
            <div class="visualRoll">
                <ul class="viewImgList">
                    <li class="imglist0">
                        <div class="roll_content">
                            <a href="javascript:;">
                            <img src="img/img_slidecontents01.png" alt="TRUST & INFORMATION 믿을 수 있는 여행정보, 여행... 어디로 가세요?"></a>
                            <p class="roll_txtline">BE TOURIST FOR BETTER LIFE</p>
                        </div>
                    </li>
                    <li class="imglist1">
                        <div class="roll_content">
                            <a href="javascript:;">
                            <img src="img/img_slidecontents02.png" alt="TRUST & INFORMATION 믿을 수 있는 여행정보, 여행... 어디로 가세요?"></a>
                            <p class="roll_txtline">BE TOURIST FOR BETTER LIFE</p>
                        </div>
                    </li>
                    <li class="imglist2">
                        <div class="roll_content">
                            <a href="javascript:;">
                            <img src="img/img_slidecontents03.png" alt="TRUST & INFORMATION 믿을 수 있는 여행정보, 여행... 어디로 가세요?"></a>
                            <p class="roll_txtline">BE TOURIST FOR BETTER LIFE</p>
                        </div>
                    </li>
                </ul>

                <div class="rollbtnArea">
                    <ul class="rollingbtn">
                        <li class="seq butt0"><a href="#butt"><img src="img/btn_rollbutt_on.png" alt="1번" /></a></li>
                        <li class="seq butt1"><a href="#butt"><img src="img/btn_rollbutt_off.png" alt="2번" /></a></li>
                        <li class="seq butt2"><a href="#butt"><img src="img/btn_rollbutt_off.png" alt="3번" /></a></li>
                        <li class="rollstop"><a href="#" class="stop"><img src="img/btn_roll_stop.png" alt="멈춤" /></a></li>
                        <li class="rollplay"><a href="#" class="play"><img src="img/btn_roll_play.png" alt="재생" /></a></li>
                    </ul>
                </div><!-- //rollbtnArea -->

            </div><!-- //visualRoll -->
        </div><!-- //main_rolling_pc -->
        
        <div class="main_rolling_mobile">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="javascript:;"><img src="img/mainslide_mob01.jpg" alt="TRUST & INFORMATION 믿을 수 있는 여행정보, 여행... 어디로 가세요?" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:;"><img src="img/mainslide_mob02.jpg" alt="TRUST & INFORMATION 믿을 수 있는 여행정보, 여행... 어디로 가세요?" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:;"><img src="img/mainslide_mob03.jpg" alt="TRUST & INFORMATION 믿을 수 있는 여행정보, 여행... 어디로 가세요?" /></a>
                    </div>
                </div>						
                <div class="swiper-pagination"></div>
                <!-- <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div> -->
                
            </div><!--//swiper-container-->
        </div><!--//main_rolling_mobile -->
	
		<!-- about_area -->
		<div class="about_area">
			<h2>다시 찾는 인기 여행지 <b>TOP 3</b></h2>
			<div class="about_box">
				<ul class="place_list box_inner clear">
					<li><a href="#" onclick="$('.popup_base').css('height',$(document).height());$('.contact_pop').show();">
							<img class="img_topplace" src="img/img_topplace01.jpg" alt="다리를 높이 들어 운동" />
							<h3>성패트릭 대성당</h3>
							<p class="txt">바쁜 뉴욕 안에서 정교하면서도 웅장한 기운에 침묵하게 되는 기도의 시간!</p>
							<span class="view">VIEW</span></a>
					</li>
					<li><a href="#" onclick="$('.popup_base').css('height',$(document).height());$('.space_pop').show();">
							<img class="img_topplace" src="img/img_topplace02.jpg" alt="바닷가에서 스트레칭" />
							<h3>원주 뮤지엄 '산'</h3>
							<p class="txt">전시된 유산들을 담아낸 건물에 신비로운 돌과 물의 테마가 담겨 있다.</p>
							<span class="view">VIEW</span></a>
					</li>
					<li><a href="#" onclick="$('.popup_base').css('height',$(document).height());$('.program_pop').show();">
							<img class="img_topplace" src="img/img_topplace03.jpg" alt="앉아서 스트레칭" />
							<h3>일본 만국박람회 기념공원</h3>
							<p class="txt">오사카 센리 반파쿠에는 드넓은 대지에 정원과 들, 물과 함께 하는 문화가 있다.</p>
							<span class="view">VIEW</span></a>
					</li>
				</ul>
			</div>
		</div>
		<!-- //about_area -->

		<!-- app_area -->
		<div class="appbbs_area">
			<div class="appbbs_box box_inner clear">
				<h2 class="hdd">상담과 최근게시물</h2>
				<p class="app_line">
					<a href="javascript:;">카카오톡 1:1 상담</a>
					<a href="javascript:;">전화 상담 신청</a>
				</p>
				<div class="bbs_line">
					<h3>NOTICE</h3>
					<ul class="notice_recent">
						<li><a href="javascript:;">이번 여름 휴가 제주 갈까? 미션 투어 (여행경비 50만원 지원)</a></li>
						<li><a href="javascript:;">박물관 미션 투어 응모 당첨자 발표</a></li>
						<li><a href="javascript:;">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a></li>
						<li><a href="javascript:;">하롱베이 서비스 OPEN! (여행정보, 가이드북, 가이드맵)</a></li>
						<li><a href="javascript:;">투어리스트인투어 서비스 점검 안내</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //app_area -->

	</div>
	<!-- //container -->

	
<%@ include file = "footer.jsp" %>
</div>
<!-- //wrap -->

<%@ include file = "quicklink.jsp" %>

<script type="text/javascript" src="js/swiper.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
		var swiper = new Swiper('.swiper-container', {
			loop: true,
			autoplay:5500,
		    autoplayDisableOnInteraction: false,
			pagination: '.swiper-pagination',
            paginationClickable: true
		});
	});
</script>

<!-- contact_pop -->
<div class="popup_base contact_pop">
	<div class="pop_content">
		<p class="btn_xpop"><a href="#" onclick="$(this).parent().parent().parent().hide();">닫기</a></p>
		<ul class="pop_list">
			<li>
				<h2 class="tit_pop">성패트릭 대성당</h2>
				<img class="pop_img"src="img/img_pop1_1.jpg" alt="성패트릭 대성당" />
				<div class="pop_txt"><p>뉴욕에서 만난 아름다운 고딕양식에 감탄을 금할 수 없습니다. <br>인상적인 예술작품들과 함께 하고 있으며 정교한 구조와 섬세한 조각들을 만날 수 있습니다. </p></div>
			</li>
		</ul>		
	</div>
</div>
<!-- //contact_pop -->

<!-- space_pop -->
<div class="popup_base space_pop">
	<div class="pop_content">
		<p class="btn_xpop"><a href="#" onclick="$(this).parent().parent().parent().hide();">닫기</a></p>
		<ul class="pop_list">
			<li>
				<h2 class="tit_pop">원주 뮤지엄 '산'</h2>
				<img class="pop_img"src="img/img_pop2_1.jpg" alt="뮤지엄 산의 물위의 건물" />
				<div class="pop_txt"><p>실내와 야외, 문화와 자연이 공존하는 세계. <br> 뮤지엄 산은  휴식과 소통이 어울러진 복합공간을 추구합니다. </p></div>
			</li>
			<li>
				<h2 class="tit_pop">박물관 야외</h2>
				<img class="pop_img"src="img/img_pop2_2.jpg" alt="박물관 야외조경" />
				<div class="pop_txt"><p>공간에 대한 관람을 최대한 배려하려고 합니다.<br>뮤지엄 산은 돌과 물과 산이 함께 어울림으로 배치된 조형 공간입니다.</p></div>
			</li>
		</ul>		
	</div>
</div>
<!-- //space_pop -->

<!-- program_pop -->
<div class="popup_base program_pop">
	<div class="pop_content">
		<p class="btn_xpop"><a href="#" onclick="$(this).parent().parent().parent().hide();">닫기</a></p>
		<ul class="pop_list">
			<li>
				<h2 class="tit_pop">일본 만국박람회 기념 공원</h2>
				<img class="pop_img"src="img/img_pop3_1.jpg" alt="일본 만국박람회 기념 공원" />
				<div class="pop_txt"><p>센리 반파쿠 기념 공원에서는 일본 정원의 확장판을 만날 수 있습니다.<br>가능한 가장 넓은 공간에 꾸민 연못, 산림욕, 정원, 산책길을 만끽할 수 있습니다.</p></div>
			</li>
		</ul>		
	</div>
</div>
<!-- //program_pop -->

</body>
</html>
    
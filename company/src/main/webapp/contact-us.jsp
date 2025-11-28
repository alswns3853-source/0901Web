<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="연락처 및 위치 안내">
<meta name="author" content="Your Company Name">
<title>연락처 | 회사명</title>

<!-- CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
</head>

<body>
<%@ include file="header.jsp" %>

<!-- 연락처 / 지도 섹션 -->
<section id="contact-info">
    <div class="center">                
        <h2>오시는 길</h2>
        <p class="lead">본사 및 지사 위치와 연락처를 안내드립니다.</p>
    </div>
    <div class="gmap-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-5 text-center">
                    <div class="gmap">
                        <iframe frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                            src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=ko&amp;q=서울특별시+강남구&amp;ie=UTF8&amp;t=m&amp;z=14&amp;iwloc=A&amp;output=embed">
                        </iframe>
                    </div>
                </div>

                <div class="col-sm-7 map-content">
                    <ul class="row">
                        <li class="col-sm-6">
                            <address>
                                <h5>본사</h5>
                                <p>서울특별시 강남구 테헤란로 XXX</p>
                                <p>전화: 02-1234-5678 <br>
                                   이메일: stri1@company.co.kr</p>
                            </address>

                            <address>
                                <h5>지사 1</h5>
                                <p>경기도 성남시 분당구 판교로 XXX</p>
                                <p>전화: 031-111-4567 <br>
                                   이메일: stri2@company.co.kr</p>
                            </address>
                        </li>

                        <li class="col-sm-6">
                            <address>
                                <h5>지사 2</h5>
                                <p>부산광역시 해운대구 센텀중앙로 XXX</p>
                                <p>전화: 051-111-1111 <br>
                                   이메일: stri3@company.co.kr</p>
                            </address>

                            <address>
                                <h5>지사 3</h5>
                                <p>대구광역시 수성구 범어동 XXX</p>
                                <p>전화: 053-111-1111 <br>
                                   이메일: stri4@company.co.kr</p>
                            </address>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 문의폼 섹션 -->
<section id="contact-page">
    <div class="container">
        <div class="center">        
            <h2>문의하기</h2>
            <p class="lead">문의 사항이나 요청사항을 아래 폼을 통해 보내주세요.</p>
        </div> 
        <div class="row contact-wrap"> 
            <div class="status alert alert-success" style="display: none"></div>
            <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php">
                <div class="col-sm-5 col-sm-offset-1">
                    <div class="form-group">
                        <label>이름 *</label>
                        <input type="text" name="name" class="form-control" required="required">
                    </div>
                    <div class="form-group">
                        <label>이메일 *</label>
                        <input type="email" name="email" class="form-control" required="required">
                    </div>
                    <div class="form-group">
                        <label>전화번호</label>
                        <input type="text" name="phone" class="form-control">
                    </div>                     
                </div>
                <div class="col-sm-5">
                    <div class="form-group">
                        <label>제목 *</label>
                        <input type="text" name="subject" class="form-control" required="required">
                    </div>
                    <div class="form-group">
                        <label>문의 내용 *</label>
                        <textarea name="message" id="message" required="required" class="form-control" rows="8"></textarea>
                    </div>                        
                    <div class="form-group">
                        <button type="submit" name="submit" class="btn btn-primary btn-lg">문의 보내기</button>
                    </div>
                </div>
            </form> 
        </div>
    </div>
</section>

<%@ include file="bottom.jsp" %>
<%@ include file="footer.jsp" %>

<!-- JS -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.isotope.min.js"></script>
<script src="js/main.js"></script>
<script src="js/wow.min.js"></script>
</body>
</html>

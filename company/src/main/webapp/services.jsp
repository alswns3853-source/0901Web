<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
</head>
<body>
<%@ include file = "header.jsp" %>

<section id="feature" class="transparent-bg">
    <div class="container">
        <div class="center wow fadeInDown">
            <h2>Our Services</h2>
            <p class="lead">저희 회사는 최신 기술과 디자인으로 고객 맞춤형 서비스를 제공합니다.<br>
               고객의 성공을 최우선으로 생각하며, 항상 혁신을 추구합니다.</p>
        </div>

        <div class="row">
            <div class="features">
                <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                    <div class="feature-wrap">
                        <i class="fa fa-bullhorn"></i>
                        <h2>마케팅 전략</h2>
                        <h3>데이터 기반의 효과적인 마케팅 전략으로 고객의 성장을 지원합니다.</h3>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                    <div class="feature-wrap">
                        <i class="fa fa-comments"></i>
                        <h2>컨설팅 서비스</h2>
                        <h3>경영, IT, 디자인 등 다양한 분야에서 전문적인 컨설팅을 제공합니다.</h3>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                    <div class="feature-wrap">
                        <i class="fa fa-cloud-download"></i>
                        <h2>소프트웨어 개발</h2>
                        <h3>맞춤형 소프트웨어 개발로 업무 효율성과 사용자 경험을 극대화합니다.</h3>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                    <div class="feature-wrap">
                        <i class="fa fa-leaf"></i>
                        <h2>UI/UX 디자인</h2>
                        <h3>사용자 중심의 직관적 디자인으로 브랜드 가치를 높입니다.</h3>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                    <div class="feature-wrap">
                        <i class="fa fa-cogs"></i>
                        <h2>시스템 통합</h2>
                        <h3>기업 시스템을 효율적으로 통합하여 업무 프로세스를 최적화합니다.</h3>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                    <div class="feature-wrap">
                        <i class="fa fa-heart"></i>
                        <h2>고객 지원</h2>
                        <h3>24시간 전문 상담과 지원으로 고객 만족을 극대화합니다.</h3>
                    </div>
                </div>
            </div>
        </div> 

        <div class="get-started center wow fadeInDown">
            <h2>서비스 시작하기</h2>
            <p class="lead">지금 바로 저희 서비스를 경험해보세요. 맞춤형 솔루션과 전문 컨설팅으로<br>
               귀사의 성장을 지원합니다.</p>
            <div class="request">
                <h4><a href="contact.do">무료 상담 신청하기</a></h4>
            </div>
        </div>

        <div class="clients-area center wow fadeInDown">
            <h2>고객 후기</h2>
            <p class="lead">저희 서비스를 이용한 고객의 소중한 의견입니다.</p>
        </div>

        <div class="row">
            <div class="col-md-4 wow fadeInDown">
                <div class="clients-comments text-center">
                    <img src="images/client1.png" class="img-circle" alt="">
                    <h3>서비스를 통해 업무 효율이 크게 향상되었습니다. 매우 만족합니다!</h3>
                    <h4><span>-알렉스 버너/</span> 대표이사, 솔루션컴퍼니</h4>
                </div>
            </div>
    </div>
</section>

<%@ include file="bottom.jsp" %>
<%@ include file="footer.jsp" %>
</body>
</html>

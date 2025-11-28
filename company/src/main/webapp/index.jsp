<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
<body class="homepage">

	<%@ include file="header.jsp"%>

	<section id="main-slider" class="no-margin">
		<div class="carousel slide">
			<ol class="carousel-indicators">
				<li data-target="#main-slider" data-slide-to="0" class="active"></li>
				<li data-target="#main-slider" data-slide-to="1"></li>
				<li data-target="#main-slider" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">

				<div class="item active"
					style="background-image: url(images/slider/bg1.jpg)">
					<div class="container">
						<div class="row slide-margin">
							<div class="col-sm-6">
								<div class="carousel-content">
									<h2 class="animation animated-item-1">당신의 비즈니스를 성장시키는 최고의
										파트너</h2>
									<h2 class="animation animated-item-2">전략, 디자인, 기술이 결합된
										프리미엄 웹 솔루션을 제공합니다.</h2>
									<a class="btn-slide animation animated-item-3" href="#">자세히
										보기</a>
								</div>
							</div>

							<div class="col-sm-6 hidden-xs animation animated-item-4">
								<div class="slider-img">
									<img src="images/slider/img1.png" class="img-responsive">
								</div>
							</div>

						</div>
					</div>
				</div>
				<!--/.item-->

				<div class="item"
					style="background-image: url(images/slider/bg2.jpg)">
					<div class="container">
						<div class="row slide-margin">
							<div class="col-sm-6">
								<div class="carousel-content">
									<h1 class="animation animated-item-1">고객 중심의 서비스 설계</h1>
									<h2 class="animation animated-item-2">사용자 경험을 최우선으로 하는
										디자인과 기술을 만나보세요.</h2>
									<a class="btn-slide animation animated-item-3" href="#">서비스
										소개</a>
								</div>
							</div>

							<div class="col-sm-6 hidden-xs animation animated-item-4">
								<div class="slider-img">
									<img src="images/slider/img2.png" class="img-responsive">
								</div>
							</div>

						</div>
					</div>
				</div>
				<!--/.item-->

				<div class="item"
					style="background-image: url(images/slider/bg3.jpg)">
					<div class="container">
						<div class="row slide-margin">
							<div class="col-sm-6">
								<div class="carousel-content">
									<h1 class="animation animated-item-1">기업의 미래를 함께 설계합니다</h1>
									<h2 class="animation animated-item-2">데이터 기반 솔루션으로 경쟁력을
										강화하세요.</h2>
									<a class="btn-slide animation animated-item-3" href="#">더
										알아보기</a>
								</div>
							</div>
							<div class="col-sm-6 hidden-xs animation animated-item-4">
								<div class="slider-img">
									<img src="images/slider/img3.png" class="img-responsive">
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/.item-->
			</div>
			<!--/.carousel-inner-->
		</div>
		<!--/.carousel-->
		<a class="prev hidden-xs" href="#main-slider" data-slide="prev"> <i
			class="fa fa-chevron-left"></i>
		</a> <a class="next hidden-xs" href="#main-slider" data-slide="next">
			<i class="fa fa-chevron-right"></i>
		</a>
	</section>
	<!--/#main-slider-->

	<section id="feature">
		<div class="container">
			<div class="center wow fadeInDown">
				<h2>주요 특징</h2>
				<p class="lead">전문성과 창의성을 바탕으로 고객 요구에 최적화된 솔루션을 제공합니다.</p>
			</div>

			<div class="row">
				<div class="features">
					<div class="col-md-4 col-sm-6 wow fadeInDown"
						data-wow-duration="1000ms" data-wow-delay="600ms">
						<div class="feature-wrap">
							<i class="fa fa-bullhorn"></i>
							<h2>브랜딩 전략</h2>
							<h3>기업의 가치를 높이는 브랜드 전략을 제시합니다.</h3>
						</div>
					</div>
					<!--/.col-md-4-->

					<div class="col-md-4 col-sm-6 wow fadeInDown"
						data-wow-duration="1000ms" data-wow-delay="600ms">
						<div class="feature-wrap">
							<i class="fa fa-comments"></i>
							<h2>고객 커뮤니케이션</h2>
							<h3>효과적인 소통을 위한 UI/UX 기반 시스템 구현</h3>
						</div>
					</div>
					<!--/.col-md-4-->

					<div class="col-md-4 col-sm-6 wow fadeInDown"
						data-wow-duration="1000ms" data-wow-delay="600ms">
						<div class="feature-wrap">
							<i class="fa fa-cloud-download"></i>
							<h2>클라우드 환경 지원</h2>
							<h3>유연하고 확장성 높은 클라우드 기반 서비스 제공</h3>
						</div>
					</div>
					<!--/.col-md-4-->

					<div class="col-md-4 col-sm-6 wow fadeInDown"
						data-wow-duration="1000ms" data-wow-delay="600ms">
						<div class="feature-wrap">
							<i class="fa fa-leaf"></i>
							<h2>친환경 디자인</h2>
							<h3>환경을 생각하는 지속 가능한 디자인 솔루션을 제공합니다.</h3>
						</div>
					</div>
					<!--/.col-md-4-->

					<div class="col-md-4 col-sm-6 wow fadeInDown"
						data-wow-duration="1000ms" data-wow-delay="600ms">
						<div class="feature-wrap">
							<i class="fa fa-cogs"></i>
							<h2>맞춤형 개발</h2>
							<h3>고객의 요구에 맞춘 유연하고 효율적인 시스템을 개발합니다</h3>
						</div>
					</div>
					<!--/.col-md-4-->

					<div class="col-md-4 col-sm-6 wow fadeInDown"
						data-wow-duration="1000ms" data-wow-delay="600ms">
						<div class="feature-wrap">
							<i class="fa fa-heart"></i>
							<h2>고객 중심 서비스</h2>
							<h3>항상 고객 만족을 최우선으로 생각하는 전문적인 서비스를 제공합니다.</h3>
						</div>
					</div>
					<!--/.col-md-4-->
				</div>
				<!--/.services-->
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--/#feature-->

	<section id="recent-works">
		<div class="container">
			<div class="center wow fadeInDown">
				<h2>최근 프로젝트</h2>
				<p class="lead">저희가 진행한 다양한 프로젝트를 확인해보세요. 창의적이고 실용적인 솔루션을 제공합니다.</p>
			</div>

			<div class="row">
				<div class="col-xs-12 col-sm-4 col-md-3">
					<div class="recent-work-wrap">
						<img class="img-responsive"
							src="images/portfolio/recent/item1.png" alt="">
						<div class="overlay">
							<div class="recent-work-inner">
								<h3>
									<a href="#">웹사이트 개발</a>
								</h3>
								<p>사용자 친화적인 디자인과 효율적인 웹 시스템 구축 프로젝트</p>
								<a class="preview" href="images/portfolio/full/item1.png"
									rel="prettyPhoto"><i class="fa fa-eye"></i> 보기</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-4 col-md-3">
					<div class="recent-work-wrap">
						<img class="img-responsive"
							src="images/portfolio/recent/item2.png" alt="">
						<div class="overlay">
							<div class="recent-work-inner">
								<h3>
									<a href="#">모바일 앱 디자인</a>
								</h3>
								<p>직관적이고 반응형 UI/UX를 적용한 앱 디자인 프로젝트</p>
								<a class="preview" href="images/portfolio/full/item2.png"
									rel="prettyPhoto"><i class="fa fa-eye"></i> 보기</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-4 col-md-3">
					<div class="recent-work-wrap">
						<img class="img-responsive"
							src="images/portfolio/recent/item3.png" alt="">
						<div class="overlay">
							<div class="recent-work-inner">
								<h3>
									<a href="#">브랜드 아이덴티티 </a>
								</h3>
								<p>기업 브랜드의 시각적 아이덴티티를 구축한 디자인 프로젝트</p>
								<a class="preview" href="images/portfolio/full/item3.png"
									rel="prettyPhoto"><i class="fa fa-eye"></i> 보기</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-4 col-md-3">
					<div class="recent-work-wrap">
						<img class="img-responsive"
							src="images/portfolio/recent/item4.png" alt="">
						<div class="overlay">
							<div class="recent-work-inner">
								<h3>
									<a href="#">전자상거래 사이트 </a>
								</h3>
								<p>안정적이고 확장 가능한 온라인 쇼핑몰 구축 프로젝트</p>
								<a class="preview" href="images/portfolio/full/item4.png"
									rel="prettyPhoto"><i class="fa fa-eye"></i> 보기</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-4 col-md-3">
					<div class="recent-work-wrap">
						<img class="img-responsive"
							src="images/portfolio/recent/item5.png" alt="">
						<div class="overlay">
							<div class="recent-work-inner">
								<h3>
									<a href="#">마케팅 캠페인</a>
								</h3>
								<p>브랜드 인지도 향상을 위한 온라인 마케팅 전략 프로젝트</p>
								<a class="preview" href="images/portfolio/full/item5.png"
									rel="prettyPhoto"><i class="fa fa-eye"></i> 보기</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-4 col-md-3">
					<div class="recent-work-wrap">
						<img class="img-responsive"
							src="images/portfolio/recent/item6.png" alt="">
						<div class="overlay">
							<div class="recent-work-inner">
								<h3>
									<a href="#">사용자 웹사이트개발 교육</a>
								</h3>
								<p>사용자 참여도를 높인 인터랙티브 웹사이트 개발 프로젝트</p>
								<a class="preview" href="images/portfolio/full/item6.png"
									rel="prettyPhoto"><i class="fa fa-eye"></i> 보기</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-4 col-md-3">
					<div class="recent-work-wrap">
						<img class="img-responsive"
							src="images/portfolio/recent/item7.png" alt="">
						<div class="overlay">
							<div class="recent-work-inner">
								<h3>
									<a href="#">교육프로그램</a>
								</h3>
								<p>미래의 개발자들을 위한 웹사이트 개발 교육</p>
								<a class="preview" href="images/portfolio/full/item7.png"
									rel="prettyPhoto"><i class="fa fa-eye"></i> 보기</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-4 col-md-3">
					<div class="recent-work-wrap">
						<img class="img-responsive"
							src="images/portfolio/recent/item8.png" alt="">
						<div class="overlay">
							<div class="recent-work-inner">
								<h3>
									<a href="#">비즈니스 테마 </a>
								</h3>
								<p>다양한 기능과 디자인 요소를 갖춘 현대적인 비즈니스 웹사이트를 만듭니다.</p>
								<a class="preview" href="images/portfolio/full/item8.png"
									rel="prettyPhoto"><i class="fa fa-eye"></i> View</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--/#recent-works-->

	<section id="services" class="service-item">
		<div class="container">
			<div class="center wow fadeInDown">
				<h2>SEO 마케팅</h2>
				<p class="lead">검색 엔진 최적화를 통해 웹사이트 트래픽과 가시성을 향상시킵니다.</p>
			</div>

			<div class="row">

				<div class="col-sm-6 col-md-4">
					<div class="media services-wrap wow fadeInDown">
						<div class="pull-left">
							<img class="img-responsive" src="images/services/services1.png">
						</div>
						<div class="media-body">
							<h3 class="media-heading">콘텐츠 마케팅</h3>
							<p>타겟 고객에게 맞춘 전략적인 콘텐츠로 브랜드 인지도를 높입니다.</p>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-md-4">
					<div class="media services-wrap wow fadeInDown">
						<div class="pull-left">
							<img class="img-responsive" src="images/services/services2.png">
						</div>
						<div class="media-body">
							<h3 class="media-heading">웹 디자인</h3>
							<p>사용자 친화적이고 현대적인 웹사이트 디자인으로 사용하기 편하게!</p>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-md-4">
					<div class="media services-wrap wow fadeInDown">
						<div class="pull-left">
							<img class="img-responsive" src="images/services/services3.png">
						</div>
						<div class="media-body">
							<h3 class="media-heading">소셜 미디어 마케팅</h3>
							<p>페이스북, 인스타그램 등 다양한 채널에서 브랜드 인지도를 올립니다.</p>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-md-4">
					<div class="media services-wrap wow fadeInDown">
						<div class="pull-left">
							<img class="img-responsive" src="images/services/services4.png">
						</div>
						<div class="media-body">
							<h3 class="media-heading">콘텐츠 제작</h3>
							<p>고객의 관심을 끄는 블로그, 영상, 이미지 등 다양한 형태의 콘텐츠를 제작!</p>
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-md-4">
					<div class="media services-wrap wow fadeInDown">
						<div class="pull-left">
							<img class="img-responsive" src="images/services/services5.png">
						</div>
						<div class="media-body">
							<h3 class="media-heading">디지털 광고</h3>
							<p>온라인 광고 캠페인을 통해 타겟 고객에게 효과적으로 도달합니다!</p>

						</div>
					</div>
				</div>

				<div class="col-sm-6 col-md-4">
					<div class="media services-wrap wow fadeInDown">
						<div class="pull-left">
							<img class="img-responsive" src="images/services/services6.png">
						</div>
						<div class="media-body">
							<h3 class="media-heading">브랜드 전략</h3>
							<p>브랜드 아이덴티티를 강화하고 시장에서 경쟁력을 확보합니다.</p>
						</div>
					</div>
				</div>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--/#services-->

	<section id="middle">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 wow fadeInDown">
					<div class="skill">
						<h2>저희의 전문 분야</h2>
						<p>저희 팀은 창의적이고 효과적인 솔루션을 제공하여 고객의 비즈니스 성장에 기여합니다.</p>

						<div class="progress-wrap">
							<h3>그래픽 디자인</h3>
							<div class="progress">
								<div class="progress-bar  color1" role="progressbar"
									aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
									style="width: 85%">
									<span class="bar-width">85%</span>
								</div>

							</div>
						</div>

						<div class="progress-wrap">
							<h3>웹 개발</h3>
							<div class="progress">
								<div class="progress-bar color2" role="progressbar"
									aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
									style="width: 95%">
									<span class="bar-width">95%</span>
								</div>
							</div>
						</div>

						<div class="progress-wrap">
							<h3>브랜드 전략</h3>
							<div class="progress">
								<div class="progress-bar color3" role="progressbar"
									aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
									style="width: 80%">
									<span class="bar-width">80%</span>
								</div>
							</div>
						</div>

						<div class="progress-wrap">
							<h3>워드프레스</h3>
							<div class="progress">
								<div class="progress-bar color4" role="progressbar"
									aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
									style="width: 90%">
									<span class="bar-width">90%</span>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!--/.col-sm-6-->

				<div class="col-sm-6 wow fadeInDown">
					<div class="accordion">
						<h2>왜 사람들이 우리를 좋아할까요?</h2>
						<div class="panel-group" id="accordion1">
							<div class="panel panel-default">
								<div class="panel-heading active">
									<h3 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion1" href="#collapseOne1"> 전문적이고 신뢰할
											수 있는 서비스 <i class="fa fa-angle-right pull-right"></i>
										</a>
									</h3>
								</div>

								<div id="collapseOne1" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="media accordion-inner">
											<div class="pull-left">
												<img class="img-responsive" src="images/accordion1.png">
											</div>
											<div class="media-body">
												<h4>전문성</h4>
												<p>저희 팀은 깊은 전문 지식과 경험을 바탕으로 고객에게 최고의 서비스를 제공합니다.</p>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion1" href="#collapseTwo1"> 맞춤형 솔루션
											제공 <i class="fa fa-angle-right pull-right"></i>
										</a>
									</h3>
								</div>
								<div id="collapseTwo1" class="panel-collapse collapse">
									<div class="panel-body">고객의 요구와 상황에 맞는 맞춤형 솔루션을 제공하여 비즈니스
										성장을 지원합니다.</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion1" href="#collapseThree1"> 빠르고 정확한
											대응 <i class="fa fa-angle-right pull-right"></i>
										</a>
									</h3>
								</div>
								<div id="collapseThree1" class="panel-collapse collapse">
									<div class="panel-body">문의와 요청 사항에 대해 신속하고 정확하게 대응하여 고객
										만족도를 높입니다.</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#accordion1" href="#collapseFour1"> 혁신적인
											아이디어 <i class="fa fa-angle-right pull-right"></i>
										</a>
									</h3>
								</div>
								<div id="collapseFour1" class="panel-collapse collapse">
									<div class="panel-body">항상 새로운 아이디어와 창의적인 접근으로 고객의 비즈니스를
										한 단계 업그레이드합니다.</div>
								</div>
							</div>
						</div>
						<!--/#accordion1-->
					</div>
				</div>

			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--/#middle-->

	<section id="content">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-8 wow fadeInDown">
					<div class="tab-wrap">
						<div class="media">
							<div class="parrent pull-left">
								<ul class="nav nav-tabs nav-stacked">
									<li class=""><a href="#tab1" data-toggle="tab"
										class="analistic-01">반응형 웹 디자인</a></li>
									<li class="active"><a href="#tab2" data-toggle="tab"
										class="analistic-02">프리미엄 플러그인 포함</a></li>
									<li class=""><a href="#tab3" data-toggle="tab"
										class="tehnical">미리 정의된 레이아웃</a></li>
									<li class=""><a href="#tab4" data-toggle="tab"
										class="tehnical">우리의 철학</a></li>
									<li class=""><a href="#tab5" data-toggle="tab"
										class="tehnical">우리가 하는 일</a></li>
								</ul>
							</div>

							<div class="parrent media-body">
								<div class="tab-content">
									<div class="tab-pane fade" id="tab1">
										<div class="media">
											<div class="pull-left">
												<img class="img-responsive" src="images/tab2.png">
											</div>
											<div class="media-body">
												<h2>완벽한 반응형 디자인</h2>
												<p>저희 웹사이트는 PC, 태블릿, 모바일 등 모든 디바이스에서 최적화된 사용자 경험을 제공합니다.</p>
											</div>
										</div>
									</div>

									<div class="tab-pane fade active in" id="tab2">
										<div class="media">
											<div class="pull-left">
												<img class="img-responsive" src="images/tab1.png">
											</div>
											<div class="media-body">
												<h2>프리미엄 플러그인 포함</h2>
												<p>모든 웹사이트에는 다양한 프리미엄 플러그인이 포함되어 있어, 별도의 추가 비용 없이 풍부한
													기능을 바로 사용할 수 있습니다.</p>
											</div>
										</div>
									</div>

									<div class="tab-pane fade" id="tab3">
										<p>미리 정의된 레이아웃을 활용하여 빠르고 효율적으로 웹사이트를 구축할 수 있으며, 필요에 따라
											자유롭게 수정이 가능합니다.<//p>
									</div>

									<div class="tab-pane fade" id="tab4">
										<p>저희는 고객 중심의 사고를 바탕으로, 사용자 경험과 디자인의 완벽한 균형을 추구하며 항상 혁신적인
											아이디어를 제공합니다.</p>
									</div>

									<div class="tab-pane fade" id="tab5">
										<p>저희 팀은 웹 디자인, 개발, SEO 최적화, 맞춤형 솔루션 등 다양한 서비스를 제공하여 고객
											비즈니스의 성장과 성공을 지원합니다.</p>
									</div>
								</div>
								<!--/.tab-content-->
							</div>
							<!--/.media-body-->
						</div>
						<!--/.media-->
					</div>
					<!--/.tab-wrap-->
				</div>
				<!--/.col-sm-6-->

				<div class="col-xs-12 col-sm-4 wow fadeInDown">
					<div class="testimonial">
						<h2>고객 후기</h2>
						<div class="media testimonial-inner">
							<div class="pull-left">
								<img class="img-responsive img-circle"
									src="images/testimonials1.png">
							</div>
							<div class="media-body">
								<p>여기 서비스 덕분에 웹사이트 트래픽이 크게 증가하고 사용자 만족도도 높아졌습니다.</p>
								<span><strong>-강동석/</strong> nagoru.com</span>
							</div>
						</div>

						<div class="media testimonial-inner">
							<div class="pull-left">
								<img class="img-responsive img-circle"
									src="images/testimonials1.png">
							</div>
							<div class="media-body">
								<p>전문적이고 신속한 지원 덕분에 프로젝트를 성공적으로 마무리할 수 있었습니다.</p>
								<span><strong>-김미선/</strong> gostri.com</span>
							</div>
						</div>

					</div>
				</div>

			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</section>
	<!--/#content-->

	<section id="partner">
		<div class="container">
			<div class="center wow fadeInDown">
				<h2>우리의 파트너들</h2>
				<p class="lead">우리는 다양한 업계의 파트너들과 함께 협력하고 있으며, 각 파트너와의 성공적인 협업을
					통해 더 나은 서비스를 제공합니다.</p>
			</div>

			<div class="partners">
				<ul>
					<li><a href="#"><img class="img-responsive wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="300ms"
							src="images/partners/partner1.png"></a></li>
					<li><a href="#"><img class="img-responsive wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="600ms"
							src="images/partners/partner2.png"></a></li>
					<li><a href="#"><img class="img-responsive wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="900ms"
							src="images/partners/partner3.png"></a></li>
					<li><a href="#"><img class="img-responsive wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="1200ms"
							src="images/partners/partner4.png"></a></li>
					<li><a href="#"><img class="img-responsive wow fadeInDown"
							data-wow-duration="1000ms" data-wow-delay="1500ms"
							src="images/partners/partner5.png"></a></li>
				</ul>
			</div>
		</div>
		<!--/.container-->
	</section>
	<!--/#partner-->

	<section id="conatcat-info">
		<div class="container">
			<div class="row">
				<div class="col-sm-8">
					<div class="media contact-info wow fadeInDown"
						data-wow-duration="1000ms" data-wow-delay="600ms">
						<div class="pull-left">
							<i class="fa fa-phone"></i>
						</div>
						<div class="media-body">
							<h2>문의사항이 있으신가요? 맞춤형 견적이 필요하신가요?</h2>
							<p>저희는 고객님의 요구사항에 맞는 맞춤형 솔루션을 제공합니다. 궁금한 점이 있으면 언제든지 연락 주십시오.
								전화: +0123 456 70 90</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/.container-->
	</section>
	<!--/#conatcat-info-->

	<%@ include file="bottom.jsp" %>

	<%@ include file="footer.jsp"%>

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/wow.min.js"></script>
</body>
</html>
</body>
</html>
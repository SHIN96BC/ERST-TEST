<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
	<head>
	</head>
	<body>

		<div id="wrap">

			<%@include file="/WEB-INF/views/include/navigation.jsp"%>

			<!-- sub visual -->
			<div class="sub_visual solutions">
				<h2>SOLUTIONS</h2>
				<p>여러분이 무슨 말을 하고 있는지 분석합니다.</p>
			</div>
			<!-- //sub visual -->

			<!-- container -->
			<div id="container">

				<!-- contents -->
				<div id="contents">
					<div class="location">
						<ul>
							<li class="ico_home"><span>홈</span></li>
							<li><span>SOLUTIONS</span></li>
							<li>
								<a href="#dep_menu" class="dep_menu"><span>SGACC™</span></a>
								<div class="dep_menu_wrap">
									<ul>
										<li><a href="#">SGSAS™</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div class="title_area">
						<h3>SGACC™</h3>
						<p>Solugate Speech Analysis System Automatic Process Call Center</p>
					</div>
					<div class="solution">
						<p style="text-align:center"><img src="/images/solution_img07.jpg" alt="음성인식"></p>
						<dl>
							<dt>SGACC™은 ㈜솔루게이트의 음성인식 기술과 인공지능 기술을 통합한 무인콜센터 솔루션 입니다.</dt>
							<dd>
								<ul>
									<li>- 딥러닝기반 기계학습</li>
									<li>- 다양한 연동 프로토콜 지원</li>
									<li>- 학습자동화를 통한 편의성 강화</li>
									<li>- GPU 기반 고속병렬처리</li>
									<li>- 음성인식 결과에 대한 신뢰도 제공</li>
									<li>- 음원 유출 방지를 통한 보안성 강화</li>
									<li>- 실시간 자연어 음성인식</li>
								</ul>
							</dd>
						</dl>
					</div>
				</div>
				<!-- //contents -->

			</div>
			<!-- //container -->

			<%@include file="/WEB-INF/views/include/footer.jsp" %>

		</div>

	</body>
</html>
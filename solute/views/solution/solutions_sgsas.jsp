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
								<a href="#dep_menu" class="dep_menu"><span>SGSAS™</span></a>
								<div class="dep_menu_wrap">
									<ul>
										<li><a href="#">SGACC™</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div class="title_area">
						<h3>SGSAS™</h3>
						<p>Solugate Speech Analysis System</p>
					</div>
					<div class="solution">
						<img src="/images/solution_img01.jpg" alt="솔루션 연동소스">
						<dl>
							<dt>SGSAS™은 ㈜솔루게이트의 음성인식 솔루션입니다.</dt>
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
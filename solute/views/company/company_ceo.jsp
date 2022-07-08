<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
	<head>
	</head>
	<body>

		<div id="wrap">

			<%@include file="/WEB-INF/views/include/navigation.jsp"%>

			<!-- sub visual -->
			<div class="sub_visual company">
				<h2>COMPANY</h2>
				<p>저희는 세상의 모든 소리에 귀를 귀울입니다.</p>
			</div>
			<!-- //sub visual -->

			<!-- container -->
			<div id="container">

				<!-- contents -->
				<div id="contents">
					<div class="location">
						<ul>
							<li class="ico_home"><span>홈</span></li>
							<li><span>COMPANY</span></li>
							<li>
								<a href="#dep_menu" class="dep_menu"><span>대표 인사말</span></a>
								<div class="dep_menu_wrap">
									<ul>
										<li><a href="#">연혁</a></li>
										<li><a href="#">오시는길</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div class="title_area">
						<h3>대표 인사말</h3>
					</div>

					<c:forEach items="${companyInfoList}" var="companyInfo">
						<div class="about" style="background: url('/photo/${companyInfo.ceoPhoto}')no-repeat 0 0;">
							<p class="txt_wrap">
								<span class="tit">${companyInfo.ceoSubject}</span>
								<span class="txt">${companyInfo.ceoContent}</span>
								<span class="sign"><img src="/photo/${companyInfo.ceoSignPhoto}" alt="(주)솔루게이트 대표이사 민성태"></span>
							</p>
						</div>
					</c:forEach>
				</div>

				<!-- //contents -->
			</div>
			<!-- //container -->

			<%@include file="/WEB-INF/views/include/footer.jsp" %>

		</div>

	</body>
</html>
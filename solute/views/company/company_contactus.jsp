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
								<a href="#dep_menu" class="dep_menu"><span>오시는길</span></a>
								<div class="dep_menu_wrap">
									<ul>
										<li><a href="#">대표 인사말</a></li>
										<li><a href="#">연혁</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div class="title_area">
						<h3>오시는길</h3>
					</div>

					<input type="hidden" id="list_size" value="${companyInfoList.size()}">

					<c:forEach items="${companyInfoList}" var="companyInfo">
						<c:set var="index" value="${index+1}"/>
						<div class="map_wrap">
							<input type="hidden" id="save_address_${index}" value="${companyInfo.address}" />
							<input type="hidden" id="save_company_name_${index}" value="${companyInfo.companyName}" />
							<div id="kakao_map_${index}" class="map wow fadeInUp kakao_map"></div>

							<ul class="list1 wow fadeInUp">
								<li class="li01"><strong>주소.</strong>${companyInfo.postNumber} ${companyInfo.address}, ${companyInfo.addressDetail}</li>
								<li class="li02"><strong>Tel.</strong>${companyInfo.phone}</li>
								<li class="li03"><strong>Fax.</strong>${companyInfo.fax}</li>
								<li class="li04"><strong>E-mail.</strong>${companyInfo.email}</li>
							</ul>
							<ul class="list2 wow fadeInUp">
								<li class="li01"><span>지하철</span>${companyInfo.subway}</li>
								<li class="li02"><span>버스</span>${companyInfo.bus}</li>
							</ul>
						</div>
					</c:forEach>
					<%-- 카카오 맵 생성에 필요한 스크립트 --%>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c27a5efef65fff73317dd14520be1ca&libraries=services,clusterer,drawing"></script>
					<script type="text/javascript" src="/js/kakao_map/company_map.js"></script>
				</div>
				<!-- //contents -->

			</div>
			<!-- //container -->

			<%@include file="/WEB-INF/views/include/footer.jsp" %>

		</div>

	</body>
</html>
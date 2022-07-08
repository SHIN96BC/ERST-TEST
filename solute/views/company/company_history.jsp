<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
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
								<a href="#dep_menu" class="dep_menu"><span>연혁</span></a>
								<div class="dep_menu_wrap">
									<ul>
										<li><a href="#">대표 인사말</a></li>
										<li><a href="#">오시는길</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div class="title_area">
						<h3>연혁</h3>
					</div>
					<div class="history">
						<div class="left">
							<%-- 먼저 year 가 같은 데이터들끼리 나눠야하므로 year 이라는 변수를 만들어서
							그 전의 year 과 같은지 체크합니다. --%>
							<%-- firstLoop 변수는 루프가 처음 이루어졌을 때를 다르게 처리하려고 만든 변수입니다.--%>
							<c:set var="year" value="" />
							<c:set var="month" value="" />
							<c:set var="firstLoop" value="first" />
							<c:forEach items="${leftOddList}" var="leftHistory">
								<c:choose>
									<c:when test="${year ne leftHistory.year}">
										<c:choose>
											<c:when test="${firstLoop eq 'first'}">
												<dl>
													<dt class="dt02">${leftHistory.year}</dt>
													<dd><span>${leftHistory.month}</span> ${leftHistory.content}
												<c:set var="firstLoop" value="not first" />
											</c:when>
											<c:otherwise>
												</dd>
												<c:forEach items="${leftOddList}" var="leftHistoryPhoto">
													<c:if test="${year eq leftHistoryPhoto.year}">
														<c:if test="${not empty leftHistoryPhoto.photo}">
															<dd class="img"><img src="/photo/${leftHistoryPhoto.photo}" alt="${leftHistoryPhoto.year}"></dd>
														</c:if>
													</c:if>
												</c:forEach>
												</dl>
												<dl>
													<dt class="dt03">${leftHistory.year}</dt>
													<dd><span>${leftHistory.month}</span> ${leftHistory.content}
											</c:otherwise>
										</c:choose>
										<c:set var="year" value="${leftHistory.year}" />
										<c:set var="month" value="${leftHistory.month}" />
									</c:when>

									<c:otherwise>
										<c:choose>
											<c:when test="${month eq leftHistory.month}">
												<br>${leftHistory.content}
											</c:when>
											<c:otherwise>
												<c:set var="month" value="${leftHistory.month}" />
												<dd><span>${leftHistory.month}</span> ${leftHistory.content}
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%--  맨 마지막 부분 사진이 나오지 않아서 후처리를 합니다.--%>
								</dd>
							<c:forEach items="${leftOddList}" var="leftHistoryPhoto">
								<c:if test="${year eq leftHistoryPhoto.year}">
									<c:if test="${not empty leftHistoryPhoto.photo}">
										<dd class="img"><img src="/photo/${leftHistoryPhoto.photo}" alt="${leftHistoryPhoto.year}"></dd>
									</c:if>
								</c:if>
							</c:forEach>
							</dl>
						</div>
						<div class="right">
							<%-- 먼저 year 가 같은 데이터들끼리 나눠야하므로 year 이라는 변수를 만들어서
							그 전의 year 과 같은지 체크합니다. --%>
							<%-- firstLoop 변수는 루프가 처음 이루어졌을 때를 다르게 처리하려고 만든 변수입니다.--%>
							<c:set var="year" value="" />
							<c:set var="month" value="" />
							<c:set var="firstLoop" value="first" />
							<c:forEach items="${rightEvenList}" var="rightHistory">
								<c:choose>
									<c:when test="${year ne rightHistory.year}">
										<c:choose>
											<c:when test="${firstLoop eq 'first'}">
												<dl>
													<dt>${rightHistory.year}</dt>
														<dd><span>${rightHistory.month}</span> ${rightHistory.content}
												<c:set var="firstLoop" value="not first" />
											</c:when>

											<c:otherwise>
													</dd>
												<c:forEach items="${rightEvenList}" var="rightHistoryPhoto">
													<c:if test="${year eq rightHistoryPhoto.year}">
														<c:if test="${not empty rightHistoryPhoto.photo}">
															<dd class="img"><img src="/photo/${rightHistoryPhoto.photo}" alt="${rightHistoryPhoto.year}"></dd>
														</c:if>
													</c:if>
												</c:forEach>
												</dl>
												<dl>
													<dt class="dt01">${rightHistory.year}</dt>
														<dd><span>${rightHistory.month}</span> ${rightHistory.content}
											</c:otherwise>
										</c:choose>
										<c:set var="year" value="${rightHistory.year}" />
										<c:set var="month" value="${rightHistory.month}" />
									</c:when>

									<c:otherwise>
										<c:choose>
											<c:when test="${month eq rightHistory.month}">
												<br>${rightHistory.content}
											</c:when>
											<c:otherwise>
												<c:set var="month" value="${rightHistory.month}" />
												<dd><span>${rightHistory.month}</span> ${rightHistory.content}
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%--  맨 마지막 부분 사진이 나오지 않아서 후처리를 합니다.--%>
								</dd>
							<c:forEach items="${rightEvenList}" var="rightHistoryPhoto">
								<c:if test="${year eq rightHistoryPhoto.year}">
									<c:if test="${not empty rightHistoryPhoto.photo}">
										<dd class="img"><img src="/photo/${rightHistoryPhoto.photo}" alt="${rightHistoryPhoto.year}"></dd>
									</c:if>
								</c:if>
							</c:forEach>
							</dl>
						</div>
					</div>
				</div>
				<!-- //contents -->

			</div>
			<!-- //container -->

			<%@include file="/WEB-INF/views/include/footer.jsp" %>

		</div>

	</body>
</html>
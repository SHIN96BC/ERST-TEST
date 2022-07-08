<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
</head>
<body>

<div id="wrap">

	<%@include file="/WEB-INF/views/include/navigation.jsp"%>

	<!-- sub visual -->
	<div class="sub_visual recruit">
		<h2>RECRUIT</h2>
		<p>당신에게 또는 당신의 고객에게 정확하고 즐거운 정보를 제공합니다.</p>
	</div>
	<!-- //sub visual -->

	<!-- container -->
	<div id="container">

		<!-- contents -->
		<div id="contents">
			<div class="location">
				<ul>
					<li class="ico_home"><span>홈</span></li>
					<li><span>RECRUIT</span></li>
					<li><span>채용공고</span></li>
				</ul>
			</div>
			<div class="title_area type2">
				<h3>채용공고</h3>
			</div>
			<div class="list_top">
				<select style="width:125px;">
					<option value="">제목+내용</option>
				</select>
				<input type="text" style="width:250px;" placeholder="검색어를 입력하세요">
				<a href="#" class="bt_sear"><img src="/images/ico_search.png" alt="검색"></a>
			</div>
			<!-- list -->
			<table class="tbl_list">
				<caption>채용공고 목록</caption>
				<colgroup>
					<col style="width:7%">
					<col>
					<col style="width:20%">
					<col style="width:10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">채용기간</th>
						<th scope="col">진행현황</th>
					</tr>
				</thead>
				<tbody>
					<tr class="notice">
						<td><img src="/images/ico_noti.png" alt="공지"></td>
						<td class="tit"><a href="/recruit/view">[상시채용] 음성인식 및 가상상담 개발 개발자 채용</a></td>
						<td>상시채용</td>
						<td><span class="st_ing">진행중</span></td>
					</tr>
					<tr>
						<td>10</td>
						<td class="tit"><a href="#">[상시채용] 음성인식 및 가상상담 개발 개발자 채용</a></td>
						<td>2019-02-07 ~ 2019-02-28</td>
						<td><span class="st_ing">진행중</span></td>
					</tr>
					<tr>
						<td>9</td>
						<td class="tit"><a href="#">솔루션 사업부 C++ 개발자 채용</a></td>
						<td>2019-02-07 ~ 2019-02-28</td>
						<td><span class="st_ing">진행중</span></td>
					</tr>
					<tr>
						<td>8</td>
						<td class="tit"><a href="#">전략사업부 영업지원팀 채용</a></td>
						<td>2019-02-07 ~ 2019-02-28</td>
						<td><span class="st_ing">진행중</span></td>
					</tr>
					<tr class="finish">
						<td>7</td>
						<td class="tit"><a href="#">[상시채용] 음성인식 및 가상상담 개발 개발자 채용</a></td>
						<td>2019-02-07 ~ 2019-02-28</td>
						<td><span class="st_finish">진행중</span></td>
					</tr>
					<tr>
						<td>6</td>
						<td class="tit"><a href="#">솔루션 사업부 C++ 개발자 채용</a></td>
						<td>2019-02-07 ~ 2019-02-28</td>
						<td><span class="st_ing">진행중</span></td>
					</tr>
					<tr>
						<td>5</td>
						<td class="tit"><a href="#">전략사업부 영업지원팀 채용</a></td>
						<td>2019-02-07 ~ 2019-02-28</td>
						<td><span class="st_ing">진행중</span></td>
					</tr>
					<tr class="finish">
						<td>4</td>
						<td class="tit"><a href="#">[상시채용] 음성인식 및 가상상담 개발 개발자 채용</a></td>
						<td>2019-02-07 ~ 2019-02-28</td>
						<td><span class="st_finish">마감</span></td>
					</tr>
					<tr class="finish">
						<td>3</td>
						<td class="tit"><a href="#">솔루션 사업부 C++ 개발자 채용</a></td>
						<td>2019-02-07 ~ 2019-02-28</td>
						<td><span class="st_finish">마감</span></td>
					</tr>
					<tr class="finish">
						<td>2</td>
						<td class="tit"><a href="#">전략사업부 영업지원팀 채용</a></td>
						<td>2019-02-07 ~ 2019-02-28</td>
						<td><span class="st_finish">마감</span></td>
					</tr>
                    <tr class="finish">
						<td>1</td>
						<td class="tit"><a href="#">전략사업부 영업지원팀 채용</a></td>
						<td>2019-02-07 ~ 2019-02-28</td>
						<td><span class="st_finish">마감</span></td>
					</tr>
				</tbody>
			</table>
			<!-- //list -->
			<div class="paginate">
				<a class="prev" href="#"><img src="/images/btn_prev.png" alt="이전"></a>
				<a href="#" class="active">1</a>
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
				<a class="next" href="#"><img src="/images/btn_next.png" alt="다음"></a>
			</div>
		</div>
		<!-- //contents -->

	</div>
	<!-- //container -->

	<!-- footer -->
	<div id="footer">
		<div class="inner">
			<div class="fmenu">
				<a href="#use_terms" rel="modal:open">개인정보보호정책</a>
				<a href="#personal_info" rel="modal:open">이메일 무단 수집 거부</a>
			</div>
			<p>(주)솔루게이트 &nbsp;&nbsp;&nbsp;&nbsp; 대표자 : 민성태 &nbsp;&nbsp;&nbsp;&nbsp; 사업자번호 : 113-86-86818</p>
			<address>서울특별시 금천구 가산디지털1로 145, 11층 1104호 (가산동, 에이스하이엔드타워3차) &nbsp;&nbsp;&nbsp;&nbsp; Tel : 070-8882-5252 &nbsp;&nbsp;&nbsp;&nbsp; Fax : 070-4405-7835</address>
			<p>Copyright(c) 2016 SOLUGATE. All Rights Reserved.</p>
			<a href="https://blog.naver.com/solugate_blog" target="_blank" class="blog">블로그</a>
		</div>
	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp" %>

</div>

</body>
</html>
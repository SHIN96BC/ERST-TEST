<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
	<head>
	</head>
	<body>
		<div id="wrap">

			<%@include file="/WEB-INF/views/include/navigation.jsp"%>

			<!-- sub visual -->
			<div class="sub_visual customer">
				<h2>CUSTOMER CENTER</h2>
				<p>여러분의 대화 속에 숨은 뜻을 찾아내고자 생각합니다.</p>
			</div>
			<!-- //sub visual -->

			<!-- container -->
			<div id="container">

				<!-- contents -->
				<div id="contents">
					<div class="location">
						<ul>
							<li class="ico_home"><span>홈</span></li>
							<li><span>CUSTOMER CENTER</span></li>
							<li><span>제품문의</span></li>
						</ul>
					</div>
					<div class="title_area type2">
						<h3>제품문의</h3>
					</div>
					<ul class="tab02 tabs">
						<li class="on"><a href="#tab01">제품문의</a></li>
						<li><a href="#tab02">제휴문의</a></li>
					</ul>
					<div class="tab_container">
						<div id="tab01" class="cont">
							<div class="req"><span>*</span> 표시는 필수 입력 항목입니다.</div>
							<table class="tbl_write">
								<caption>제품문의</caption>
								<colgroup>
									<col style="width:200px;;">
									<col style="width:400px;">
									<col style="width:200px;">
									<col style="width:400px;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span>*</span> 회사명</th>
										<td><input type="text" style="width:300px;"></td>
										<th scope="row"><span>*</span> 성함</th>
										<td><input type="text" style="width:300px;"></td>
									</tr>
									<tr>
										<th scope="row"><span>*</span> 전화번호</th>
										<td><input type="text" style="width:300px;"></td>
										<th scope="row"><span>*</span> E-mail</th>
										<td><input type="text" style="width:300px;"></td>
									</tr>
									<tr>
										<th scope="row"><span>*</span> 문의제품</th>
										<td colspan="3">
											<ul class="item_list">
												<li><input type="checkbox" id="chk01" name="chk01"><em></em> <label for="chk01">음성 솔루션</label></li>
												<li><input type="checkbox" id="chk02" name="chk02"><em></em> <label for="chk02">성문인증 솔루션</label></li>
												<li><input type="checkbox" id="chk03" name="chk03"><em></em> <label for="chk03">챗봇 솔루션</label></li>
												<li><input type="checkbox" id="chk04" name="chk04"><em></em> <label for="chk04">텍스트 분석 솔루션</label></li>
												<li><input type="checkbox" id="chk05" name="chk05"><em></em> <label for="chk05">전산 시스템 운영 솔루션</label></li>
											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row"><span>*</span> 문의내용</th>
										<td colspan="3">
											<textarea style="width: 100%;" rows="20"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<h4 class="h401">개인정보 수집 및 활용 동의(필수)</h4>
							<div class="agree_box">
								<strong>개인정보의 수집, 이용목적</strong><br>
								수집하는 개인정보 항목에 따른 상세 항목은 다음과 같습니다.<br><br>
								- 제품문의 : 고객이 요청한 제품 상담<br>
								- 다운로드 : 고객이 요청한 제품 관련 자료 제공<br>
								- 제품문의 : 고객이 요청한 제품 상담<br>
								- 다운로드 : 고객이 요청한 제품 관련 자료 제공
							</div>
							<ul class="agree_list">
								<li><input type="checkbox" id="agree01" name="agree01"><em></em> <label for="agree01">개인정보 수집 및 이용에 동의합니다.</label></li>
								<li><input type="checkbox" id="agree02" name="agree02"><em></em> <label for="agree02">솔루게이트 뉴스레터 및 매거진 수신동의합니다.</label></li>
							</ul>
							<div class="btn_center">
								<a href="#" class="btn_type02">취소</a>
								<a href="#" class="btn_type01">등록</a>
							</div>
						</div>
						<div id="tab02" class="cont">
							<div class="req"><span>*</span> 표시는 필수 입력 항목입니다.</div>
							<table class="tbl_write">
								<caption>제휴문의</caption>
								<colgroup>
									<col style="width:200px;;">
									<col style="width:400px;">
									<col style="width:200px;">
									<col style="width:400px;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span>*</span> 회사명</th>
										<td><input type="text" style="width:300px;"></td>
										<th scope="row"><span>*</span> 성함</th>
										<td><input type="text" style="width:300px;"></td>
									</tr>
									<tr>
										<th scope="row"><span>*</span> 전화번호</th>
										<td><input type="text" style="width:300px;"></td>
										<th scope="row"><span>*</span> E-mail</th>
										<td><input type="text" style="width:300px;"></td>
									</tr>
									<tr>
										<th scope="row"><span>*</span> 문의내용</th>
										<td colspan="3">
											<textarea style="width: 100%;" rows="20"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<h4 class="h401">개인정보 수집 및 활용 동의(필수)</h4>
							<div class="agree_box">
								<strong>개인정보의 수집, 이용목적</strong><br>
								수집하는 개인정보 항목에 따른 상세 항목은 다음과 같습니다.<br><br>
								- 제품문의 : 고객이 요청한 제품 상담<br>
								- 다운로드 : 고객이 요청한 제품 관련 자료 제공<br>
								- 제품문의 : 고객이 요청한 제품 상담<br>
								- 다운로드 : 고객이 요청한 제품 관련 자료 제공
							</div>
							<ul class="agree_list">
								<li><input type="checkbox" id="agree03" name="agree03"><em></em> <label for="agree03">개인정보 수집 및 이용에 동의합니다.</label></li>
								<li><input type="checkbox" id="agree04" name="agree04"><em></em> <label for="agree04">솔루게이트 뉴스레터 및 매거진 수신동의합니다.</label></li>
							</ul>
							<div class="btn_center">
								<a href="#" class="btn_type01">취소</a>
								<a href="#" class="btn_type02">등록</a>
							</div>
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
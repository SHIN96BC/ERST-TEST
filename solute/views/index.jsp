
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
    <head>
    </head>
    <body>

        <div id="wrap" class="main">

            <%@include file="/WEB-INF/views/include/navigation.jsp"%>

            <!-- contents -->
            <div class="contents">
                <div class="main_visual">
                    <div class="inner">
                        <ul class="main_slider">
                            <li class="li01"><div><span class="txt1 wow fadeInLeft">저희는</span> <span class="txt2"><em>세상의 모든 소리</em>에</span> <span class="txt3">귀를 기울입니다.</span></div></li>
                            <li class="li02"><div><span class="txt1">여러분이</span> <span class="txt2">무슨 말을 하고 있는지</span> <span class="txt3"><em>분석</em>합니다.</span></div></li>
                            <li class="li03"><div><span class="txt1">세상의 수많은 정보속에서</span> <span class="txt2"><em>가장 의미있는 정보</em>를</span> <span class="txt3">찾습니다.</span></div></li>
                            <li class="li04"><div><span class="txt1">여러분의 대화 속에 <span class="txt2"><em>숨은 뜻</em>을 찾아 내고자</span> <span class="txt3"> 생각합니다.</span></div></li>
                            <li class="li05"><div><span class="txt1">그리고 <span class="txt2"><em>정확하고 즐거운 정보</em>를</span> <span class="txt3">제공합니다.</span></div></li>
                            <li class="li06"><div><span class="txt1">항상</span> <span class="txt2">미래를 위한 <em>새로운 도전</em>을</span> <span class="txt3">멈추지 않습니다.</span></div></li>
                        </ul>
                        <script>
                            var $mainSlider = $('.main_slider');
                            $mainSlider.slick({
                                dots: true,
                                arrows: false,
                                infinite: true,
                                speed: 800,
                                autoplay: true,
                                autoplaySpeed: 4000,
                                pauseOnHover : false,
                                pauseOnDotsHover : false,
                                pauseOnFocus : false
                            });
                        </script>
                    </div>
                </div>
                <div class="main_sec04 wow fadeInUp">
                    <h2>바로가기</h2>
                    <p class="sec_txt">원하시는 페이지로 빠르게 이동하실 수 있습니다.</p>
                    <ul>
                        <li class="li01 wow fadeInUp"><a href="company_history.html">연혁</a></li>
                        <li class="li03 wow fadeInUp"><a href="solutions_sgsas.html">제품소개</a></li>
                        <li class="li02 wow fadeInUp"><a href="customercenter_inquiry.html">제품문의</a></li>
                        <li class="li04 wow fadeInUp"><a href="recruit_recruit_list.html">채용공고</a></li>
                    </ul>
                </div>
                <div class="main_sec05 wow fadeInUp">
                    <div class="inner">
                        <div class="banner">
                            <ul class="ban_slider">
                                <li><a href="#"><img src="images/banner02.jpg" alt="용인시"></a></li>
                                <li><a href="#"><img src="images/banner21.jpg" alt="WOONGJIN"></a></li>
                                <li><a href="#"><img src="images/banner16.jpg" alt="행정안전부"></a></li>
                                <li><a href="#"><img src="images/banner10.jpg" alt="DB"></a></li>
                            </ul>
                            <div class="ban_ctrl">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                            <script>
                                var $ban_slider = $('.ban_slider');
                                $ban_slider.slick({
                                    dots: false,
                                    arrows: false,
                                    speed: 500,
                                    autoplay: true,
                                    autoplaySpeed: 2000
                                });
                                $('.ban_ctrl .btn_prev').click(function() {
                                    $ban_slider.slick('slickPrev');
                                });
                                $('.ban_ctrl .btn_next').click(function() {
                                    $ban_slider.slick('slickNext');
                                });
                            </script>
                            <div class="txt">솔루션 구축사례</div>
                        </div>
                        <div class="patent">
                            <img src="images/main_img06.jpg" alt="Virtual Agent">
                            <dl>
                                <dt>특허등록</dt>
                                <dd>무인상담</dd>
                                <dd>가상상담원</dd>
                                <dd>봇(Bot)상담</dd>
                                <dd>Virtual Agent</dd>
                                <dd>Virtual  Assistant</dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="main_sec06 wow fadeInUp">
                    <h2>솔루게이트 파트너스</h2>
                    <ul class="part_slider">
                        <li><a href="#"><img src="images/part_banner01.jpg" alt="고양시"></a></li>
                        <li><a href="#"><img src="images/part_banner02.jpg" alt="용인시"></a></li>
                        <li><a href="#"><img src="images/part_banner03.jpg" alt="세종특별자치시"></a></li>
                        <li><a href="#"><img src="images/part_banner04.jpg" alt="참진주"></a></li>
                        <li><a href="#"><img src="images/part_banner05.jpg" alt="CMB대전방송"></a></li>
                        <li><a href="#"><img src="images/part_banner03.jpg" alt="세종특별자치시"></a></li>
                    </ul>
                    <div class="part_ctrl">
                        <button type="button" class="btn_prev">이전</button>
                        <button type="button" class="btn_next">다음</button>
                    </div>
                    <script>
                        var $part_slider = $('.part_slider');
                        $part_slider.slick({
                            dots: false,
                            arrows: false,
                            speed: 500,
                            autoplay: true,
                            autoplaySpeed: 2000,
                            slidesToShow: 5,
                            slidesToScroll: 1
                        });
                        $('.part_ctrl .btn_prev').click(function() {
                            $part_slider.slick('slickPrev');
                        });
                        $('.part_ctrl .btn_next').click(function() {
                            $part_slider.slick('slickNext');
                        });
                    </script>
                </div>
            </div>
            <!-- //contents -->

            <%@include file="/WEB-INF/views/include/footer.jsp"%>

        </div>

    </body>
</html>

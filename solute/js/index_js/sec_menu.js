
$(document).ready(function () {
    let solutionHref = $('.menu02').children('.submenu').children('li').children('a:eq(0)').attr('href');

    // 바로가기 메뉴 세팅
    let secMenu = `
                <li class="li01 wow fadeInUp"><a href="/company/history">연혁</a></li>
            `;
    if(solutionHref) {
        secMenu += `
            <li class="li03 wow fadeInUp"><a href="${solutionHref}">제품소개</a></li>
        `;
    }else {
        secMenu += `
            <li class="li03 wow fadeInUp"><a href="#">제품소개</a></li>
        `;
    }
    secMenu += `
        <li class="li02 wow fadeInUp"><a href="/customer/customer_center">제품문의</a></li>
        <li class="li04 wow fadeInUp"><a href="/recruit/list">채용공고</a></li>
    `;

    $('#sec_menu').append(secMenu);
});
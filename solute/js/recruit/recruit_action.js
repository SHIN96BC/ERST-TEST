

let keywordState = "";
function setState(keyword) {
    keywordState = keyword;
}

function movePage(movePage) {
    // isNaN 은 파라미터 값이 숫자가 아닌 문자열이면 true 를 반환합니다.
    if(isNaN(movePage))
        return;

    let onePageCount = $('#one_page_count').val();
    if(isNaN(onePageCount))
        return;

    let nowKeyword = $('#search').val();

    if(keywordState === nowKeyword) {
        location.href = `/recruit/list?cp=${movePage}&ps=${onePageCount}&keyword=${nowKeyword}`;
    }else if(keywordState !== nowKeyword) {
        location.href = `/recruit/list?cp=0&ps=${onePageCount}`;
    }
}

function searchButton() {
    let nowKeyword = $('#search').val();
    let onePageCount = $('#one_page_count').val();
    if(isNaN(onePageCount))
        return;
    location.href = `/recruit/list?cp=0&ps=${onePageCount}&keyword=${nowKeyword}`;
}

$(document).ready(
   $(document).on('keyup', '#search', function (event) {
       let nowKeyword = $('#search').val();

       if(event.keyCode == 13) {
          let onePageCount = $('#one_page_count').val();
          if(isNaN(onePageCount))
              return;
          location.href = `/recruit/list?cp=0&ps=${onePageCount}&keyword=${nowKeyword}`;
       }else {
           if(nowKeyword !== null && nowKeyword.trim().length > 0) {
               // 여기는 검색 도우미 기능(검색어 추천)
               $.ajax({
                   url: "/recruit/search_support",
                   type: "POST",
                   data: {keyword: nowKeyword},
                   success: function (subjectList) {
                       // input 태그 아래에 추천 검색어를 띄워줍니다.
                       let searchSupport = `
                            
                       `;

                       $('#search').append();


                   },
                   error: function (error) {
                       alert("알수없는 오류가 발생했습니다.");
                       location.reload();
                   }
               });
           }else {
               $('#search').empty();
           }
      }
   })
);
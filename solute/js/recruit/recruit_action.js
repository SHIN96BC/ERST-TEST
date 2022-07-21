

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
    // ++ 와 [ ] 등을 get 방식으로 넘기기위해 인코딩을 해줍니다.
    // + 인코딩
    nowKeyword = nowKeyword.replace(/\+/g,"%2B");
    // encodeURI 함수는 uri 에서 자주 사용하는 예약문자 이외에 모든 문자를 인코딩 해줍니다.
    location.href = encodeURI(`/recruit/list?cp=0&ps=${onePageCount}&keyword=${nowKeyword}`);
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
                       $('#search_support').empty();
                       // input 태그 아래에 추천 검색어를 띄워줍니다.
                       let searchSupport = `<div id="recommend" class="invisible">`;

                       for(let subject of subjectList) {
                           if(subject === null || subject.trim().length === 0)
                               continue;
                           let cutSubject = "";
                           if(subject.length > 20){
                               cutSubject = subject.substring(0, 19);
                           }else {
                               cutSubject = subject;
                           }
                           searchSupport += `<div class="search_word">${cutSubject}</div>`;
                       }

                       searchSupport += `</div>`;

                       $('#search_support').append(searchSupport);

                   },
                   error: function (error) {
                       alert("알수없는 오류가 발생했습니다.");
                       location.reload();
                   }
               });
           }else {
               $('#search_support').empty();
           }
      }
   }),

   $(document).on('click', '.search_word', function () {
       let searchWord = $(this).text();

       $('#search').val(searchWord);
       $('#search_support').empty();
   })
);
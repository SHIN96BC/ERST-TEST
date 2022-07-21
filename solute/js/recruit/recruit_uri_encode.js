
function uriEncode(uri) {
    // ++ 와 [ ] 등을 get 방식으로 넘기기위해 인코딩을 해줍니다.
    // + 인코딩
    uri = uri.replace(/\+/g,"%2B");
    // encodeURI 함수는 uri 에서 자주 사용하는 예약문자 이외에 모든 문자를 인코딩 해줍니다.
    location.href = encodeURI(uri);
}
const kakaoMapList = [];

$(document).ready(function () {
    console.log('맵 생성 진입');
    const listSize = $('#list_size').val();
    for(let i = 0; i < listSize; i++) {
        console.log(`kakao_map_${i+1}`);
        console.log(`listSize = ` + listSize);
        let mapContainer = document.getElementById(`kakao_map_${i+1}`);
        let mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            // draggable: false, // 지도 드래그 & 확대 축소 막기
            level: 3, // 지도의 확대 레벨

        };
        let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        kakaoMapList.push(map);
        console.log('for 문 ')
    }
    console.log('맵 생성 완료');
});

let geocoder = new kakao.maps.services.Geocoder();

// 마커 표시 이벤트
let markers = [];
let infowindows = [];
let marker = new kakao.maps.Marker({
    map: null,
    position: null,
});
let infowindow = new kakao.maps.InfoWindow({
    content: null,
});
$(document).ready(function() {
    const listSize = $('#list_size').val();
    console.log('kakao_map listSize = ' + listSize);
    for(let i=0; i < listSize; i++) {
        let address = $(`#save_address_${i+1}`).val();
        let companyName = $(`#save_company_name_${i+1}`).val();
        let map = kakaoMapList[i];
        console.log('kakao_map address = ' + address);
        console.log('kakao_map companyName = ' + companyName);
        // 좌표 검색
        geocoder.addressSearch(address, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                let latlng = new kakao.maps.LatLng(result[0].y, result[0].x);

                // map move center
                map.setLevel(4); // 맵 확대 축소
                map.setCenter(latlng);

                let newMarker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: latlng // 마커를 표시할 위치
                });
                let newInfowindow = new kakao.maps.InfoWindow({
                    content: `<div style="width:150px;text-align:center;padding:6px 0;">${companyName}</div>`
                });

                markers.push(newMarker);
                infowindows.push(newInfowindow);
                newInfowindow.open(map, newMarker);
            }
        });

    }
});

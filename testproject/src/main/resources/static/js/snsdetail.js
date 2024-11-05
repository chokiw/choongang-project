/**
 * 화면 css칼라값과 카카오맵 경로
 */
$(document).ready(function () {
            $(".logout").mouseover(function () {
                $(".logout").css("background-color", "gray");
            });
            $(".logout").mouseout(function () {
                $(".logout").css("background-color", "#305346");
            });
      
            $(".mypage").mouseover(function () {
                $(".mypage").css("background-color", "gray");
            });
            $(".mypage").mouseout(function () {
                $(".mypage").css("background-color", "#305346");
            });
       
            $(".sns").mouseover(function () {
                $(".sns").css("background-color", "#b4b4b4");
            });
            $(".sns").mouseout(function () {
                $(".sns").css("background-color", "white");
            });
        
            $(".mate").mouseover(function () {
                $(".mate").css("background-color", "#b4b4b4");
            });
            $(".mate").mouseout(function () {
                $(".mate").css("background-color", "white");
            });
            
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
        	mapOption = {
        		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        		// 지도의 확대 레벨
        		level : 4
        	};

        	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        	var mapTypeControl = new kakao.maps.MapTypeControl();

        	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        	var zoomControl = new kakao.maps.ZoomControl();
        	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


        	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
        	if (navigator.geolocation) {

        		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
        		navigator.geolocation.getCurrentPosition(function(position) {

        			var lat = position.coords.latitude, // 위도
        			lon = position.coords.longitude; // 경도

        			var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

        			map.setCenter(locPosition);

        		});

        	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);
        		map.setCenter(locPosition);

        	}

        	var path;
        	var distance;
        	var content;
        	var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
        	var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
        	var dots={}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
        			
        	var coords = new kakao.maps.LatLng(37.487562432505634,127.02458160684496);
        		 		
        	displayCircleDot(coords, 0);
        	clickLine = new kakao.maps.Polyline({
        		map : map, // 선을 표시할 지도입니다 
        		path : [ coords ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
        		strokeWeight : 3, // 선의 두께입니다 
        		strokeColor : '#db4040', // 선의 색깔입니다
        		strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
        		strokeStyle : 'solid' // 선의 스타일입니다
        	});
        	displayCircleDot(coords, 0);
        				
        	coords = new kakao.maps.LatLng(37.48961514181573,127.03129887271317);
        	path = clickLine.getPath();
        	path.push(coords);
        	clickLine.setPath(path);
        	distance = Math.round(clickLine.getLength());
        	displayCircleDot(coords, distance);
        				
        	coords = new kakao.maps.LatLng(37.49745484295899,127.02752507934906);
        	path = clickLine.getPath();
        	path.push(coords);
        	clickLine.setPath(path);
        	distance = Math.round(clickLine.getLength());
        	displayCircleDot(coords, distance);
        				
        	coords = new kakao.maps.LatLng(37.495870299299845,127.02162154477146);
        	path = clickLine.getPath();
        	path.push(coords);
        	clickLine.setPath(path);
        	distance = Math.round(clickLine.getLength());
        	displayCircleDot(coords, distance);
        				
        	coords = new kakao.maps.LatLng(37.48812113213402,127.02421996044676);
        	path = clickLine.getPath();
        	path.push(coords);
        	clickLine.setPath(path);
        	distance = Math.round(clickLine.getLength());
        	displayCircleDot(coords, distance);

        	// 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
        	path = clickLine.getPath();

        	// 선을 구성하는 좌표의 개수가 2개 이상이면
        	if (path.length > 1) {

        		// 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
        		if (dots[dots.length - 1].distance) {
        			dots[dots.length - 1].distance.setMap(null);
        			dots[dots.length - 1].distance = null;
        		}
        					
        		distance = Math.round(clickLine.getLength()); // 선의 총 거리를 계산합니다
        		content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

        		// 그려진 선의 거리정보를 지도에 표시합니다
        		showDistance(content, path[path.length - 1]);

        	} else {

        		// 선을 구성하는 좌표의 개수가 1개 이하이면 
        		// 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
        		deleteClickLine();
        		deleteCircleDot();
        		deleteDistnce();

        	}



        // 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
        function deleteClickLine() {
        	if (clickLine) {
        		clickLine.setMap(null);
        		clickLine = null;
        	}
        }

        // 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
        // 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
        function showDistance(content, position) {

        	if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면

        		// 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
        		distanceOverlay.setPosition(position);
        		distanceOverlay.setContent(content);

        	} else { // 커스텀 오버레이가 생성되지 않은 상태이면

        		// 커스텀 오버레이를 생성하고 지도에 표시합니다
        		distanceOverlay = new kakao.maps.CustomOverlay({
        			map : map, // 커스텀오버레이를 표시할 지도입니다
        			content : content, // 커스텀오버레이에 표시할 내용입니다
        			position : position, // 커스텀오버레이를 표시할 위치입니다.
        			xAnchor : 0,
        			yAnchor : 0,
        			zIndex : 3
        		});
        	}
        }

        // 그려지고 있는 선의 총거리 정보와 
        // 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
        function deleteDistnce() {
        if (distanceOverlay) {
        	distanceOverlay.setMap(null);
        	distanceOverlay = null;
        	}
        }
        	

        // 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
        // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
        function displayCircleDot(position, distance) {
        		
        	// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
        	var circleOverlay = new kakao.maps.CustomOverlay({
        		content : '<span class="dot"></span>',
        		position : position,
        		zIndex : 1
        	});

        	// 지도에 표시합니다
        	circleOverlay.setMap(map);

        	if (distance > 0) {
        		// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
        		var distanceOverlay = new kakao.maps.CustomOverlay(
        				{
        					content : '<div class="dotOverlay">거리 <span class="number">'
        							+ distance + '</span>m</div>',
        					position : position,
        					yAnchor : 1,
        					zIndex : 2
        				});

        		// 지도에 표시합니다
        		distanceOverlay.setMap(map);
        	}
        	
        	//var로 배열 선언시 기본 함수를 불러오지 못하는 버그가 발생
        	//let으로 선언후에 var에 다시 넣었음
        	let dotss= [];
        	// 배열에 추가합니다
        	dotss.push(distanceOverlay);
        	dots=dotss;
        }

        // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
        function deleteCircleDot() {
        	var i;

        	for (i = 0; i < dots.length; i++) {
        		if (dots[i].circle) {
        			dots[i].circle.setMap(null);
        		}

        		if (dots[i].distance) {
        			dots[i].distance.setMap(null);
        		}
        	}

        	dots = [];
        }

        // 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
        // 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
        // HTML Content를 만들어 리턴하는 함수입니다
        function getTimeHTML(distance) {

        	var walkkTime = distance / 168 | 0;
        	var walkHour = '', walkMin = '';

        	// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
        	if (walkkTime > 60) {
        		walkHour = '<span class="number">' + Math.floor(walkkTime / 60)
        				+ '</span>시간 '
        	}
        	walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

        	// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
       		var content = '<ul class="dotOverlay distanceInfo">';
//        	content += '    <li>';
//        	content += '        <span class="label">총거리</span><span class="number">'
//        			+ distance + '</span>m';
//        	content += '    </li>';
//        	content += '    <li>';
//        	content += '        <span class="label">도보</span>' + walkHour
//        			+ walkMin;
//        	content += '    </li>';
        	content += '</ul>'

        	return content;
        }
            
        });
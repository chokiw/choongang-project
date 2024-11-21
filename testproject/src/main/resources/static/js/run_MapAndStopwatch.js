/**
 * 
 */
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		// 지도의 확대 레벨
		level : 3
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
		alert("현재위치를 불러오기에 실패했습니다.");
		map.setCenter(locPosition);

	}
	
	let l_position;
	function where(){
		if (navigator.geolocation) {

	    	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

			var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도

			l_position = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			});
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			l_position = new kakao.maps.LatLng(33.450701, 126.570667);
			alert("현재위치를 불러오기에 실패했습니다.");
		}
	
		return l_position;
	}

	let path;
	var distance;
	let content;
	let clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
	let distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
	const  t_path=[];
	let coords=where();
		
	function draw(r_path){
	// 선을 구성하는 좌표의 개수가 2개 이상이면
		if (r_path.length > 1) {
	
			distance = Math.round(clickLine.getLength()); // 선의 총 거리를 계산합니다
			content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
			// 그려진 선의 거리정보를 지도에 표시합니다
			document.getElementById("distance").innerHTML=distance+"m";
			showDistance(content, r_path[r_path.length - 1]);
		} else {
			// 선을 구성하는 좌표의 개수가 1개 이하이면 
			// 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
			deleteClickLine();
			deleteDistnce();
		}
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
			content += '    <li>';
			content += '        <span class="label">총거리</span><span class="number">'
						+ distance + '</span>m';
		content += '</ul>'

		return content;
	}
    
	let timerId;
	var time = 0;
	const stopwatch = document.getElementById("stopwatch");
	let  hour=0, min=0, sec=0, tens=0;


	function printTime() {
		time++;
		if(sec<Math.floor((time/100)%60)){
			coords = where();
		    var Lat=coords.getLat()+(sec/10000);
		    var Lng=coords.getLng()+(sec/10000);
		    coords=new kakao.maps.LatLng(Lat, Lng);
		    path = clickLine.getPath();
		    path.push(coords);
		    clickLine.setPath(path);
		    draw(clickLine.getPath());
		    map.setCenter(coords);
			if(sec==29 || sec==59) {
				t_path.push(Lat);
				t_path.push(Lng);		
			}
		}
		stopwatch.innerText = getTimeFormatString();
		var p=0;
		if(distance != 0) {
			p=(1000*time)/distance;
		   	var ph = parseInt(String((p/100) / (60 * 60)));
		   	var pm= parseInt(String(((p/100) - (ph * 60 * 60)) / 60));
		   	var ps= parseInt(String((p/100)%60));
		   	if(!isNaN(ph))document.getElementById("phase").innerHTML=String(pm).padStart(2, '0')+":"+String(ps).padStart(2, '0');
		};
	}

	//시계 시작 - 재귀호출로 반복실행
	function startClock() {
		//측정을 시작할시 경로 그림 만들어서 띄워주기
		if(time==0){
			coords=where();
			clickLine = new kakao.maps.Polyline({
				map : map, // 선을 표시할 지도입니다    		
				path : [ coords ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다    		
				strokeWeight : 3, // 선의 두께입니다  		
				strokeColor : '#db4040', // 선의 색깔입니다   		
				strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
				strokeStyle : 'solid' // 선의 스타일입니다  	
			});
			t_path.push(coords.getLat());
			t_path.push(coords.getLng());
		}
		    
		printTime();
		   stopClock();
		   timerId = setTimeout(startClock, 10);
	}

	//시계 중지
	function stopClock() {
		   if (timerId != null) {
		       clearTimeout(timerId);
		   }
	}

	// 시간(int)을 시, 분, 초 문자열로 변환
	function getTimeFormatString() {
		   hour = parseInt(String((time/100) / (60 * 60)));
		   min = parseInt(String(((time/100) - (hour * 60 * 60)) / 60));
		   sec = Math.floor((time/100)%60);
		   tens = time%100;

		   return String(hour).padStart(2, '0') + ":" + String(min).padStart(2, '0') + ":" + String(sec).padStart(2, '0')+":" +String(tens).padStart(2, '0');
	}

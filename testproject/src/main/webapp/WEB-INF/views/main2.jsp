<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6146d72cd45f3c8d130a2c1504d9647"></script>

<meta charset="utf-8">
<title>geolocation으로 마커 표시하기</title>

</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>
	<button id="next">끝</button>
	<script>
		var marker;
		var infowindow;
		var arr=[];
		var linePath = [];
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨 
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

		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);

			displayMarker(locPosition);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition) {
			// 마커를 생성합니다
			marker = new kakao.maps.Marker({
				map : map,
				position : locPosition,
				clickable : true
			// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
			});

			var iwContent = '<div style="padding:5px;">시작위치!</div>', // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커 위에 인포윈도우를 표시합니다
				infowindow.open(map, marker);
			})

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
		
		kakao.maps.event.addListener(map, 'rightclick', function(mouseEvent) {        
			marker.setMap(null);
			infowindow.setMap(null);
			
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng;
		    
		    var c =[latlng.getLat(),latlng.getLng()];
		    
		    arr.push(c);
		    
		    linePath.push(new kakao.maps.LatLng(latlng.getLat(),latlng.getLng()))
		    
		    var polyline = new kakao.maps.Polyline({
		        path: linePath, // 선을 구성하는 좌표배열 입니다
		        strokeWeight: 5, // 선의 두께 입니다
		        strokeColor: '#000000', // 선의 색깔입니다
		        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		        strokeStyle: 'solid' // 선의 스타일입니다
		    });
		    
		    
		    var locPosition = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
		    displayMarker(locPosition);
		    
		    polyline.setMap(map);
		    
		});
		$(document).ready(function(){
			$('#next').click(function(){
				if(arr==null) alert("null");
				var data="arr="+arr;
				
				$.post('${pageContext.request.contextPath}/real',
						data,function(){});
			});
		});
	</script>
</body>
</html>
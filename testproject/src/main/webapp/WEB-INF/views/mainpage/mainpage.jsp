<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Paytone One' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/5e485453d8.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6146d72cd45f3c8d130a2c1504d9647"></script>
	<link href="/css/common.css" rel="stylesheet">
	<link href="/css/mainpage.css" rel="stylesheet">
    <script src="/js/mainpage.js"></script>
    <title>Document</title>
</head>

<body>
    <div class="container">
        <!-- 탑 메뉴 -->
        <jsp:include page="${path}/WEB-INF/views/header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="${path}/WEB-INF/views/side.jsp"></jsp:include>


        <!-- 메인 콘텐츠 -->
         <main class="content">
            <div class="track">
                <span style="font-size: 40px; font-weight: 700;">Best Runner</span>
                <span style="float: right; opacity: 80%; font-size: 14px;">랭킹은 현재 시간으로부터 7일전까지 데이터를 기준으로 정해집니다.</span>
                <br><br>
                <span style="color: gray;">이번주 가장 많이 달린 러너 입니다.</span>
                <span></span>
            </div>



            <div class="runner-grid">
                <div class="runner-item">
                    <div class="dotm">1</div>
                    <img src="${pageContext.request.contextPath}/uimg/${userProfileimg1}" class="img1"
                        style="border-radius: 50%; width: 200px; height: 200px; border-style: ridge;"><br>
                    <span class="nickname2"><a href="asd" class="profile_go">${	userNickname1}</a></span>
                    <span class="distance">${userDistance1}km</span>
                </div>

                <div class="runner-item">
                    <div class="dotm">2</div>
                    <img src="${pageContext.request.contextPath}/uimg/${userProfileimg2}" class="img2"
                        style="border-radius: 50%; width: 150px; height: 150px; border-style: ridge;"><br>
                    <span class="nickname2"><a href="asd" class="profile_go">${	userNickname2}</a></span>
                    <span class="distance">${userDistance2}km</span>
                </div>

                <div class="runner-item">
                    <div class="dotm">3</div>
                    <img src="${pageContext.request.contextPath}/uimg/${userProfileimg3 }" class="img2"
                        style="border-radius: 50%; width: 150px; height: 150px; border-style: ridge;"><br>
                    <span class="nickname2"><a href="asd" class="profile_go">${	userNickname3}</a></span>
                    <span class="distance">${userDistance3}km</span>
                </div>

                <div class="runner-item">
                    <div class="dotm">4</div>
                    <img src="${pageContext.request.contextPath}/uimg/${userProfileimg4 }" class="img2"
                        style="border-radius: 50%; width: 150px; height: 150px; border-style: ridge;"><br>
                    <span class="nickname2"><a href="asd" class="profile_go">${	userNickname4}</a></span>
                    <span class="distance">${userDistance4}km</span>
                </div>

                <div class="runner-item">
                    <div class="dotm">5</div>
                    <img src="${pageContext.request.contextPath}/uimg/${userProfileimg5 }"  class="img2"
                        style="border-radius: 50%; width: 150px; height: 150px; border-style: ridge;"><br>
                    <span class="nickname2"><a href="asd" class="profile_go">${	userNickname5}</a></span>
                    <span class="distance">${userDistance5}km</span>
                </div>
            </div>




            <div class="track" style="margin-top: 100px;">
                <span style="font-size: 40px; font-weight: 700;">Best Track</span><br><br>
                <span style="color: gray;">이번주 추천수를 많이 받은 인기 트랙 1,2,3위 입니다.</span>
            </div>




            <div class="pricebox">
            	<c:if test="${RankNum >= 1}">
            	<div id="map1" class="trackimg"></div>
                <div class="gold" id="track1">
                    <script>
    				var mapContainer = document.getElementById('map1'), // 지도를 표시할 div  
						   			   mapOption = {
    								   		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
											// 지도의 확대 레벨
											level: 3
										};

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


					var path;
					var distance;
					var content;
					var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
					var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
					let cnt=0;
		
					//좌표생성
					var coords = new kakao.maps.LatLng(${c0[0].lat}, ${c0[0].lng});
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
		    						position: coords
								 });

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					//지도 처음 중앙 위치 지정
					map.setCenter(coords);
		
					//경로 생성
					clickLine = new kakao.maps.Polyline({
						map: map, // 선을 표시할 지도입니다 
						path: [coords], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
						strokeWeight: 3, // 선의 두께입니다 
						strokeColor: '#db4040', // 선의 색깔입니다
						strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle: 'solid' // 선의 스타일입니다
					});
					displayCircleDot(coords, 0);
					cnt++;
		
					<c:forEach var="i" begin="1" end="${fn:length(c0)-1}">
						cnt++;
						coords = new kakao.maps.LatLng(${c0[i].lat}, ${c0[i].lng});
						path = clickLine.getPath();
						path.push(coords);
						clickLine.setPath(path);
						distance = Math.round(clickLine.getLength());
						displayCircleDot(coords, distance);
					</c:forEach>

					// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
					// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
					function displayCircleDot(position, distance) {
						// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
						var circleOverlay = new kakao.maps.CustomOverlay({
							content: '<span class="dot"></span>',
							position: position,
							zIndex: 1
						});

						// 지도에 표시합니다
						circleOverlay.setMap(map);

	
						if (distance > 0) {
							var dc;	 
	
							if(cnt==${fn:length(c0)}) dc='<div class="dotOverlay">거리 <span class="number">'+ distance + '</span>m<br><span>도착지점</span></div>';
							else dc='<div class="dotOverlay">거리 <span class="number">'+ distance + '</span>m</div>';
	
							// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
							var distanceOverlay = new kakao.maps.CustomOverlay({
								content: dc,
								position: position,
								yAnchor: 1,
								zIndex: 2
							});

							// 지도에 표시합니다
							distanceOverlay.setMap(map);
						};
	
	
					}
				</script>	
                    <a href="sns_detail?sns_no=${routedata[0].sns_no}"><span class="nickname">${routedata[0].sns_subject}</span></a><br>
                    <span class="location">${routedata[0].sns_address1} ${routedata[0].sns_address2}</span><br>
                    <img src="https://cdn.pixabay.com/photo/2021/09/11/10/27/medal-6615190_1280.png"
                        style="width: 50px; height: 60px; object-fit: fill;"><br>
                    <span class="distance">${routedata[0].sns_good}</span>
              
                </div>
             	</c:if>
				<c:if test="${RankNum >= 2}">
				<div id="map2" class="trackimg"></div>
				
                <div class="gold" id="track2">
                    <script>
    				var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div  
						   			   mapOption2 = {
    								   		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
											// 지도의 확대 레벨
											level: 3
										};

					var map2 = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다


					var path2;
					var distance2;
					var content2;
					var clickLine2 // 마우스로 클릭한 좌표로 그려질 선 객체입니다
					var distanceOverlay2; // 선의 거리정보를 표시할 커스텀오버레이 입니다
					let cnt2=0;
		
					//좌표생성
					var coords2 = new kakao.maps.LatLng(${c1[0].lat}, ${c1[0].lng});
					// 마커를 생성합니다
					var marker2 = new kakao.maps.Marker({
		    						position: coords2
								 });

					// 마커가 지도 위에 표시되도록 설정합니다
					marker2.setMap(map2);
					//지도 처음 중앙 위치 지정
					map2.setCenter(coords2);
		
					//경로 생성
					clickLine2 = new kakao.maps.Polyline({
						map: map2, // 선을 표시할 지도입니다 
						path: [coords2], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
						strokeWeight: 3, // 선의 두께입니다 
						strokeColor: '#db4040', // 선의 색깔입니다
						strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle: 'solid' // 선의 스타일입니다
					});
					displayCircleDot2(coords2, 0);
					cnt2++;
		
					<c:forEach var="i" begin="1" end="${fn:length(c1)-1}">
						cnt2++;
						coords2 = new kakao.maps.LatLng(${c1[i].lat}, ${c1[i].lng});
						path2 = clickLine2.getPath();
						path2.push(coords2);
						clickLine2.setPath(path2);
						distance2 = Math.round(clickLine2.getLength());
						displayCircleDot2(coords2, distance2);
					</c:forEach>
					// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
					// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
					function displayCircleDot2(position, d2) {
						// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
						var circleOverlay2 = new kakao.maps.CustomOverlay({
							content: '<span class="dot"></span>',
							position: position,
							zIndex: 1
						});

						// 지도에 표시합니다
						circleOverlay2.setMap(map2);

	
						if (d2 > 0) {
							var dc2;	 
	
							if(cnt2==${fn:length(c1)}) dc2='<div class="dotOverlay">거리 <span class="number">'+ d2 + '</span>m<br><span>도착지점</span></div>';
							else dc2='<div class="dotOverlay">거리 <span class="number">'+ d2 + '</span>m</div>';
	
							// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
							var distanceOverlay2 = new kakao.maps.CustomOverlay({
								content: dc2,
								position: position,
								yAnchor: 1,
								zIndex: 2
							});

							// 지도에 표시합니다
							distanceOverlay2.setMap(map2);
						};
	
	
					}
				</script>
                    <a href="sns_detail?sns_no=${routedata[1].sns_no}"><span class="nickname">${routedata[1].sns_subject}</span></a><br>
                    <span class="location">${routedata[1].sns_address1} ${routedata[1].sns_address2}</span><br>
                    <img src="https://cdn.pixabay.com/photo/2021/09/11/10/29/medal-6615195_1280.png"
                        style="width: 50px; height: 60px; object-fit: fill;"><br>
                    <span class="distance">${routedata[1].sns_good}</span>
                </div>
                </c:if>
				<c:if test="${RankNum >= 3}">
				
				<div id="map3" class="trackimg"></div>
				
                <div class="gold" id="track3">
                    <script>
    				var mapContainer3 = document.getElementById('map3'), // 지도를 표시할 div  
						   			   mapOption3 = {
    								   		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
											// 지도의 확대 레벨
											level: 3
										};

					var map3 = new kakao.maps.Map(mapContainer3, mapOption3); // 지도를 생성합니다


					var path3;
					var distance3;
					var content3;
					var clickLine3 // 마우스로 클릭한 좌표로 그려질 선 객체입니다
					var distanceOverlay3; // 선의 거리정보를 표시할 커스텀오버레이 입니다
					let cnt3=0;
		
					//좌표생성
					var coords3 = new kakao.maps.LatLng(${c2[0].lat}, ${c2[0].lng});
					// 마커를 생성합니다
					var marker3 = new kakao.maps.Marker({
		    						position: coords3
								 });

					// 마커가 지도 위에 표시되도록 설정합니다
					marker3.setMap(map3);
					//지도 처음 중앙 위치 지정
					map3.setCenter(coords3);
		
					//경로 생성
					clickLine3 = new kakao.maps.Polyline({
						map: map3, // 선을 표시할 지도입니다 
						path: [coords3], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
						strokeWeight: 3, // 선의 두께입니다 
						strokeColor: '#db4040', // 선의 색깔입니다
						strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle: 'solid' // 선의 스타일입니다
					});
					displayCircleDot3(coords3, 0);
					cnt3++;
		
					<c:forEach var="i" begin="1" end="${fn:length(c2)-1}">
						cnt3++;
						coords3 = new kakao.maps.LatLng(${c2[i].lat}, ${c2[i].lng});
						path3 = clickLine3.getPath();
						path3.push(coords3);
						clickLine3.setPath(path3);
						distance3 = Math.round(clickLine3.getLength());
						displayCircleDot3(coords3, distance3);
					</c:forEach>
					// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
					// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
					function displayCircleDot3(position, d3) {
						// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
						var circleOverlay3 = new kakao.maps.CustomOverlay({
							content: '<span class="dot"></span>',
							position: position,
							zIndex: 1
						});

						// 지도에 표시합니다
						circleOverlay3.setMap(map3);

	
						if (d3 > 0) {
							var dc3;	 
	
							if(cnt3==${fn:length(c2)}) dc3='<div class="dotOverlay">거리 <span class="number">'+ d3 + '</span>m<br><span>도착지점</span></div>';
							else dc3='<div class="dotOverlay">거리 <span class="number">'+ d3 + '</span>m</div>';
	
							// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
							var distanceOverlay3 = new kakao.maps.CustomOverlay({
								content: dc3,
								position: position,
								yAnchor: 1,
								zIndex: 2
							});

							// 지도에 표시합니다
							distanceOverlay3.setMap(map3);
						};
	
	
					}
				</script>
                    <a href="sns_detail?sns_no=${routedata[2].sns_no}"><span class="nickname">${routedata[2].sns_subject}</span></a><br>
                    <span class="location">${routedata[2].sns_address1} ${routedata[2].sns_address2}</span><br>
                    <img src="https://cdn.pixabay.com/photo/2021/09/11/10/32/third-6615198_1280.png"
                        style="width: 50px; height: 60px; object-fit: fill;"><br>
                    <span class="distance">${routedata[2].sns_good}</span>
                </div>
                </c:if>

            </div>
        </main>

    </div>
</body>

</html>
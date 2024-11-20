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
                    <a href="sns_detail?sns_no=${routedata[0].sns_no}"></a> <br><br>
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
					var coords = new kakao.maps.LatLng(${c1[0].lat}, ${c1[0].lng});
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
		
					<c:forEach var="i" begin="1" end="${fn:length(c1)-1}">
						cnt++;
						coords = new kakao.maps.LatLng(${c1[i].lat}, ${c1[i].lng});
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
	
							if(cnt==${fn:length(c)}) dc='<div class="dotOverlay">거리 <span class="number">'+ distance + '</span>m<br><span>도착지점</span></div>';
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
                    <span class="nickname">${rankUd[0].user_nickname}님</span><br>
                    <span class="location">${routedata[0].sns_address1} ${routedata[0].sns_address2}</span><br>
                    <img src="https://cdn.pixabay.com/photo/2021/09/11/10/27/medal-6615190_1280.png"
                        style="width: 50px; height: 60px; object-fit: fill;"><br>
                    <span class="distance">${routedata[0].sns_good}</span>
              
                </div>
             	</c:if>
				<c:if test="${RankNum >= 2}">
                <div class="gold" id="track2">
                    <a href="sns_detail?sns_no=${routedata[1].sns_no}"><div id="map2"></div></a> <br><br>
                    <span class="nickname">${rankUd[1].user_nickname}님</span><br>
                    <span class="location">${routedata[1].sns_address1} ${routedata[1].sns_address2}</span><br>
                    <img src="https://cdn.pixabay.com/photo/2021/09/11/10/29/medal-6615195_1280.png"
                        style="width: 50px; height: 60px; object-fit: fill;"><br>
                    <span class="distance">${routedata[1].sns_good}</span>
                </div>
                </c:if>
				<c:if test="${RankNum >= 3}">
                <div class="gold" id="track3">
                    <a href="sns_detail?sns_no=${routedata[2].sns_no}"><div id="map3"></div></a> <br><br>
                    <span class="nickname">${rankUd[2].user_nickname}님</span><br>
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
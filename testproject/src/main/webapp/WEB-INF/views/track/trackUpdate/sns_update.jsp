<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/5e485453d8.js" crossorigin="anonymous"></script>
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/sns_write.css" rel="stylesheet">
    <script src="/js/sns_update.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6146d72cd45f3c8d130a2c1504d9647"></script>

    <title>Document</title>
	<script>
		let coord;
		let distanse;
		let time;
		let dots=[];
		let marker;
		var path;
		var distance;
		var content;
		var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
		var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
		var rdn;
		function openPopup(url) { 
			// 화면 크기 가져오기
			var screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
			var screenHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

			// 팝업 크기 설정
			var popupWidth = 1050;
			var popupHeight = 700;

			// 중앙 위치 계산
			var left = (screenWidth - popupWidth) / 2;
			var top = (screenHeight - popupHeight) / 2;

			// 팝업창 열기
			window.open(url, '_blank',
				'width=' + popupWidth +
				',height=' + popupHeight +
				',left=' + left +
				',top=' + top +
				',scrollbars=yes,resizable=yes');
		}
		
		function setRDN(data){
			$("#runner_data_no").val(data);
		}
		
		function setNo(runner_data_no) {
			var data = "runner_data_no=" + runner_data_no;
			$("#runner_data_no").val(runner_data_no);
			$.post('${path}/getMyData', data, function(data) {
				$("#defaultImg").hide();
				$("#map").show();
				coord = data[0];
				distanse = data[1];
				time = data[2];
				let time_h = parseInt(String(time / 60));
				let time_s = time % 60;
				let phase_h = parseInt(String(time * 1000 / distanse / 60));
				let phase_s = parseInt(String(time * 1000 / distanse % 60));

				const distance_html = document.getElementById("distance");
				const time_html = document.getElementById("time");
				const phase_html = document.getElementById("phase");
				distance_html.innerText = distanse + "m";
				time_html.innerText = time_h + "분" + time_s + "초";
				phase_html.innerText = phase_h + "'" + phase_s + '"';
				
				//마커 지우기
				marker.setMap(null);
				// 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
				deleteClickLine();

				// 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
				deleteDistnce();
				//지도위에 점 거리 정보 지우기
				deleteCircleDot();

				
				let cnt = 0;

				//첫번째좌표생성
				var coords = new kakao.maps.LatLng(coord[0], coord[1]);
				// 시작점마커를 생성합니다
				marker = new kakao.maps.Marker({
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
				let i;
				for (i = 2; i < coord.length; i += 2) {
					cnt++;
					coords = new kakao.maps.LatLng(coord[i], coord[i + 1]);
					path = clickLine.getPath();
					path.push(coords);
					clickLine.setPath(path);
					distance = Math.round(clickLine.getLength());
					displayCircleDot(coords, distance);
				}

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

						if (cnt == (coord.length / 2)) dc = '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m<br><span>도착지점</span></div>';
						else dc = '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>';

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
					// 배열에 추가합니다
					dots.push({
						circle : circleOverlay,
						distance : distanceOverlay
					});

				}
			
			});
		}
		// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
		function deleteClickLine() {
			if (clickLine) {
				clickLine.setMap(null);
				clickLine = null;
			}
		}
		
		function deleteDistnce() {
			if (distanceOverlay) {
				distanceOverlay.setMap(null);
				distanceOverlay = null;
			}
		}
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

	</script>

</head>



<body>
    <div class="container">
       	<!-- 탑 메뉴 -->
        <jsp:include page="${path}/WEB-INF/views/header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="${path}/WEB-INF/views/side.jsp"></jsp:include>
        
        
        <main class="content">
       		<span style="font-size: 36px; font-weight: 700;">트랙 게시판</span><br><br>
       		<form method="post" action="snsupdate" onsubmit="return check()">
       		<input type="hidden" name="pageNum"  value="${pageNum }">
       		<input type="hidden" name="runner_data_no" id="runner_data_no">
			<input type="hidden"  name="sns_no"  value=${board.sns_no }>
            	<div class="sns_title">
            		<span style="font-size: 24px; font-weight: 600;">제목</span>&nbsp;&nbsp;
                	<input type="text" style="font-size: 20px; font-weight: 500; width: 60%;" maxlength="50" placeholder="제목을 입력하세요"  id="sns_subject" name="sns_subject" value="${board.sns_subject}">  
            	</div>
            
            <div class="sns_writer">
                 <select id="sns_address1" name="sns_address1">
                    <option value="">광역시선택</option> 
                    <option value="서울시" ${board.sns_address1 == '서울시' ? 'selected' : ''}>서울시</option>
                </select>
                <select id="sns_address2" name="sns_address2">
                    <option value="">지역선택</option>
                    <option value="강남구"${board.sns_address2 == '강남구' ? 'selected' : ''}>강남구</option>
                    <option value="강동구"${board.sns_address2 == '강동구' ? 'selected' : ''}>강동구</option>
                    <option value="강북구"${board.sns_address2 == '강북수' ? 'selected' : ''}>강북구</option>
                    <option value="강서구"${board.sns_address2 == '강서구' ? 'selected' : ''}>강서구</option>
                    <option value="관악구"${board.sns_address2 == '관악구' ? 'selected' : ''}>관악구</option>
                    <option value="광진구"${board.sns_address2 == '광진구' ? 'selected' : ''}>광진구</option>
                    <option value="구로구"${board.sns_address2 == '구로구' ? 'selected' : ''}>구로구</option>
                    <option value="금천구"${board.sns_address2 == '금천구' ? 'selected' : ''}>금천구</option>
                    <option value="노원구"${board.sns_address2 == '노원구' ? 'selected' : ''}>노원구</option>
                    <option value="도봉구"${board.sns_address2 == '도봉구' ? 'selected' : ''}>도봉구</option>
                    <option value="동대문구"${board.sns_address2 == '동대문구' ? 'selected' : ''}>동대문구</option>
                    <option value="동작구"${board.sns_address2 == '동작구' ? 'selected' : ''}>동작구</option>
                    <option value="마포구"${board.sns_address2 == '마포구' ? 'selected' : ''}>마포구</option>
                    <option value="서대문구"${board.sns_address2 == '서대문구' ? 'selected' : ''}>서대문구</option>
                    <option value="서초구"${board.sns_address2 == '서초구' ? 'selected' : ''}>서초구</option>
                    <option value="성동구"${board.sns_address2 == '성동구' ? 'selected' : ''}>성동구</option>
                    <option value="성북구"${board.sns_address2 == '성북구' ? 'selected' : ''}>성북구</option>
                    <option value="송파구"${board.sns_address2 == '송파구' ? 'selected' : ''}>송파구</option>
                    <option value="양천구"${board.sns_address2 == '양천구' ? 'selected' : ''}>양천구</option>
                    <option value="영등포구"${board.sns_address2 == '영등포구' ? 'selected' : ''}>영등포구</option>
                    <option value="용산구"${board.sns_address2 == '용산구' ? 'selected' : ''}>용산구</option>
                    <option value="은평구"${board.sns_address2 == '은평구' ? 'selected' : ''}>은평구</option>
                    <option value="종로구"${board.sns_address2 == '종로구' ? 'selected' : ''}>종로구</option>
                    <option value="중구"${board.sns_address2 == '중구' ? 'selected' : ''}>중구</option>
                    <option value="중랑구"${board.sns_address2 == '중랑구' ? 'selected' : ''}>중랑구</option>
                </select>

               
            </div>

            <hr><br><br>
            
            <div class="maincontent">
           		     <div id="map" ></div>
           		     <script>
    				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
						   			   mapOption = {
    								   		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
											// 지도의 확대 레벨
											level: 3
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

					var path;
					var distance;
					var content;
					var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
					var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
					let cnt1=0;
		
					//좌표생성
					var coords = new kakao.maps.LatLng(${c[0].lat}, ${c[0].lng});
					// 시작점마커를 생성합니다
					marker = new kakao.maps.Marker({
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
					cnt1++;
		
					<c:forEach var="i" begin="1" end="${fn:length(c)-1}">
						cnt1++;
						coords = new kakao.maps.LatLng(${c[i].lat}, ${c[i].lng});
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
	
							if(cnt1==${fn:length(c)}) dc='<div class="dotOverlay">거리 <span class="number">'+ distance + '</span>m<br><span>도착지점</span></div>';
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
						// 배열에 추가합니다
						dots.push({
							circle : circleOverlay,
							distance : distanceOverlay
						});
					}
				</script>
		 	
		
		
		
		  	<div class="content-info">
            	<span class="content1">달린 거리</span> <br><br>
                <span id="distance" class="content2">${rd.runner_data_distance}m</span><br><br><br><br>

                <span class="content1">달린 시간</span><br><br>
                <span id="time" class="content2">
                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${(rd.runner_data_time/60)}"></fmt:formatNumber>분                     
                    ${rd.runner_data_time%60}초                     
                 </span><br><br><br><br>

                 <span class="content1">평균 페이스</span><br><br>
                 <span id="phase" class="content2">
                     <fmt:formatNumber type="number" maxFractionDigits="0" value="${rd.runner_data_time*1000/rd.runner_data_distance/60}"/>'
                     <fmt:formatNumber type="number" maxFractionDigits="0" value="${rd.runner_data_time*1000/rd.runner_data_distance%60}"/>"
                  </span>
           </div>
           </div>
          <div class="button-container">
                <button type="button" onclick="openPopup('sns_write_list')" class="action-button load">내가 달린 트랙 가져오기</button>
          </div>
          

          <div style="margin-top: 20px; height: auto;">
               <span style="font-size: 20px; font-family: 'Gothic A1', sans-serif; font-style: normal; font-weight: 600;">내용작성</span><br>
               <textarea name="sns_content"  id="sns_content" rows="8" cols="50" style="width: 90%;" placeholder="내용을 입력해주세요" >${board.sns_content}</textarea>
          </div>

          <div class="button-container">
          		<button type="submit" class="action-button save">수정 완료</button>
          </div>

		</form>
            
           
    	</main>
	</div>

</body>

</html>
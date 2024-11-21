<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<link
	href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/5e485453d8.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6146d72cd45f3c8d130a2c1504d9647"></script>
<link href="/css/common.css" rel="stylesheet">
<link href="/css/sns_detail.css" rel="stylesheet">
<link href="/css/icons.css" rel="stylesheet">
<link href="/css/srlist.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>RUNAWAY</title>

<script>
$(function() {
	$('#srlist').load('/srlist/num/${board.sns_no}')    	
	$('#repInsert').click(function() {
		if (!frm.sns_r_content.value) {
			alert('댓글 입력후에 클릭하시오');
			frm.sns_r_content.focus();
			return false;
		}
		var frmData = $('form').serialize();
		
		$.post('/srInsert', frmData, function(data) {
			$('#srlist').html(data);
			frm.sns_r_content.value = '';
		});
	});
});
    </script>
</head>

<body>
	<div class="container">
		<!-- 탑 메뉴 -->
		<jsp:include page="${path}/WEB-INF/views/header.jsp"></jsp:include>

		<!-- 사이드(왼쪽) 메뉴 -->
		<jsp:include page="${path}/WEB-INF/views/side.jsp"></jsp:include>

		<main class="content">
			<span style="font-size: 36px; font-weight: 700;">트랙 게시판</span><br>
			<br>

			<div class="sns_title">
				<span style="font-size: 30px; font-weight: 600;">${board.sns_subject}</span>&nbsp;&nbsp;
				<!-- select로 설정한 지역 -->
				<span style="font-family: 'Gothic A1', sans-serif; color: #747474;">${board.sns_address1}
					${board.sns_address2}</span>
			</div>

			<div class="sns_writer">
				<!-- 서버에서 현재 로그인한 사용자 ID를 가져온다 -->
				<c:set var="userID" value="${board.user_id}"/>
				<c:set var="loginID" value="${sessionScope.member.user_id}"/>
				
				<c:choose>
					<c:when test="${userID == loginID}">
				
					<!-- 자신의 글일 경우 mypage로 이동 -->
					<a href="${pageContext.request.contextPath}/mypage">
						<img src="${pageContext.request.contextPath}/uimg/${userphoto}" class="myimg">
					</a>
					<a class="userpage" href="${pageContext.request.contextPath}/mypage">
					<span style="font-size: 14px; font-weight: 600; font-family: 'Gothic A1', sans-serif; margin-top: 15px; margin-left: 10px;">${nickname}</span>
					</a>
				</c:when>
				<c:otherwise>
				
				<!-- 다른 사용자의 글일 경우 userpage로 이동 -->
				<a href="${pageContext.request.contextPath}/userpage?user_id=${board.user_id}">
					<img src="${pageContext.request.contextPath}/uimg/${userphoto}" class="myimg">
				</a>
				<a class="userpage" href="${pageContext.request.contextPath}/userpage?user_id=${board.user_id}">
				<span style="font-size: 14px; font-weight: 600; font-family: 'Gothic A1', sans-serif; margin-top: 15px; margin-left: 10px;">${nickname}</span>
				</a>
				</c:otherwise>
				</c:choose>
			</div>

			<div class="date_read">
				<span style="font-size: 14px; font-family: 'Gothic A1', sans-serif;"><fmt:formatDate
						value="${board.sns_date}" pattern="yyyy-MM-dd HH:mm:ss" /></span> <span
					style="font-size: 14px; font-family: 'Gothic A1', sans-serif; float: right; font-weight: 600;">조회수
					: ${board.sns_readcount}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;추천수 :
					${board.sns_good}</span>
			</div>
			<hr>
			<br> <br>

			<div class="maincontent">
				<div id="map" class="image-container"></div>
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
					let cnt=0;
		
					//좌표생성
					var coords = new kakao.maps.LatLng(${c[0].lat}, ${c[0].lng});
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
		
					<c:forEach var="i" begin="1" end="${fn:length(c)-1}">
						cnt++;
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



				<div class="content-info">
					<span class="content1">달린 거리</span> <br> <br> <span
						class="content2">${rd.runner_data_distance}m</span><br> <br>
					<br> <br> <span class="content1">달린 시간</span><br> <br>
					<span class="content2"> <fmt:parseNumber
							value="${rd.runner_data_time}" var="time" /> <fmt:formatNumber
							type="number" maxFractionDigits="0" value="${time/(60*60)}" />시
						<fmt:formatNumber type="number" maxFractionDigits="0"
							value="${(time-(time/(60*60)))/60}" />분 <fmt:formatNumber
							type="number" maxFractionDigits="0" value="${time%60}" />초
					</span><br> <br> <br> <br> <span class="content1">평균
						페이스</span><br> <br> <span class="content2"> <fmt:formatNumber
							type="number" maxFractionDigits="0"
							value="${rd.runner_data_time*1000/rd.runner_data_distance/60}" />'
						<fmt:formatNumber type="number" maxFractionDigits="0"
							value="${rd.runner_data_time*1000/rd.runner_data_distance%60}" />"
					</span>
				</div>
			</div>

			<div style="margin-top: 20px; height: auto;">
				<span style="font-size: 24px; font-family: 'Gothic A1', sans-serif;">${board.sns_content}</span>
			</div>

			<!-- 추천 버튼 -->
			<div class="recomend_box">
				<a href="#" class="recomend"
					onclick="toggleLike(event, ${board.sns_no})"> <br> 
					<c:choose>
						<c:when test="${fn:length(goodList) > 0}">
							<c:forEach var="good" items="${goodList}">
								<c:if
									test="${good.sns_no == board.sns_no && sessionScope.member.user_id == good.user_id}">
									<!-- 추천된 상태 -->
									<!-- 추천된 상태일때 색이 버튼의 색이 채워져있도록 변경 -->
									<div class="recomended">
										<span class="material-symbols-outlined large-icon-hot"
											style="margin-top: 20px;">local_fire_department </span><br>
										<span class="run">RUN</span>
									</div>
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<span class="material-symbols-outlined large-icon-hot">local_fire_department</span>
							<br>
							<span class="run">RUN</span>
						</c:otherwise>
					</c:choose>
				</a>
			</div>


			<script>
			   function toggleLike(event, sns_no) {
		             event.preventDefault(); // 새로고침 방지

		             fetch('/toggleGood', {
		                 method: 'POST',
		                 headers: {
		                     'Content-Type': 'application/x-www-form-urlencoded'
		                 },
		                 body: 'sns_no=' + encodeURIComponent(sns_no) // 데이터를 body에 전달
		             })
		             .then(data => {
		                 console.log("좋아요 토글 결과:", data);
		                 location.reload(); // 새로고침
		             })
		             .catch(error => {
		                 console.error("오류 발생:", error);
		             });
		         }


		</script>

</script>



			<!-- 수정, 삭제 글목록 -->
			<!-- 로그인 아이디와 글쓴이가 다를때 수정, 삭제가 안보이게함 -->
			<div class="action-buttons">
				<c:choose>
					<c:when test="${member.user_id eq board.user_id}">
						<a class="delete"
							href="sns_update?pageNum=${pageNum}&sns_no=${board.sns_no}"
							style="display: inline-block;"><span
                     class="material-symbols-outlined"> edit_note </span> &nbsp;수정
						</a>

						<!-- 삭제버튼 누르면 바로 삭제 완료 alet뜨게함 -->
						<form method="post" action="snsdelete">
							<input type="hidden" name="pageNum" value="${pageNum}"> <input
								type="hidden" name="sns_no" value=${board.sns_no }>
							<button type="submit" class="delete button-style">
								<span
                     class="material-symbols-outlined"> delete </span>&nbsp;삭제
							</button>
						</form>

					</c:when>

					<c:otherwise>
						<a class="delete"
							href="sns_update?pageNum=${pageNum}&sns_no=${board.sns_no}"
							style="display: none;"><span
                     class="material-symbols-outlined"> edit_note </span>&nbsp;수정
						</a>

						<a class="delete" href="snsdelete" style="display: none;"><span
                     class="material-symbols-outlined"> delete </span>&nbsp;삭제
						</a>
					</c:otherwise>
				</c:choose>




				<a class="delete" href="javascript:history.back();"><span
               class="material-symbols-outlined"> format_list_bulleted </span>&nbsp;글목록</a>
			</div>
			<div id="srlist"></div>
			
			<!-- 댓글 입력 -->

			<form name="frm" id="frm">
                <input type="hidden" name=user_id value="${member.user_id}">  
                <input type="hidden" name="sns_no" value="${board.sns_no }">              
        	<table class="reboardwrite">
            	<td colspan="2">
                <div class="re_writebox">
                    <span class="nickname">${member.user_nickname}</span>
                    <textarea rows="4" cols="50" class="re_write" id="sns_r_content" name="sns_r_content"
                        placeholder="댓글을 남겨보세요" maxlength='1000'></textarea>

                    <div style="position: absolute; right: 1%; top: 0; color: #b4b4b4; font-size: 14px;">
                    </div>
                    <div class="buttonbox">
                        <input type="button" id="repInsert" class="action-button save" value="등록"></button>
                    </div>
                </div>
            	</td>
        	 </table>
   	 		 </form>      
		</main>
	</div>

</body>

</html>
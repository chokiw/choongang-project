<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/5e485453d8.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6146d72cd45f3c8d130a2c1504d9647"></script>
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/mate_detail.css" rel="stylesheet">
    <script src="/js/mate_detail.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title>Document</title>
    <script type="text/javascript">
    var writer = "${board.user_id}"
    var viewer = "${member.user_id}"
    
    $(document).ready(function () {
    	if(writer != viewer) {
    		$("#update").hide();
    		$("#delete").hide();
    	}               		
    });  
    
$(function(){
	   $('#delete').click(function(){
		   if(!confirm('삭제하시겠습니까?')){
			   return false;
		   }
	   })
})
    
$(function() {
	$('#rlist').load('/rlist/num/${board.recruit_no}')
	
	$('#repInsert').click(function() {
		if (!frm.recruit_r_content.value) {
			alert('댓글 입력후에 클릭하시오');
			frm.recruit_r_content.focus();
			return false;
		}
		var frmData = $('form').serialize();
		
		$.post('${path}/sInsert', frmData, function(data) {
			$('#rlist').html(data);
			frm.recruit_r_content.value = '';
		});
	});
});
		$(function(){
			$("#start1").click(function(){
				$.ajax({
					url: "${pageContext.request.contextPath}/apply",
					type : "POST",
					data : {
						recruit_no : ${board.recruit_no},
						user_id : "${member.user_id}",
						applyType : "start"
					},
					success : function(response){
						alert("참가신청 완료 되었습니다.");
						location.reload();
					}
				});
			});
				
			$("#stop1").click(function(){
				$.ajax({
					url: "${pageContext.request.contextPath}/apply/cancel",
					type : "POST",
					data : {
						recruit_no : ${board.recruit_no},
						user_id : "${member.user_id}",
						applyType : "stop"
					},
					success : function(response){
						alert("신청이 취소 되었습니다.");
						location.reload();
					}
				});
			});
		});
    </script>
</head>

<body>
    <div class="container">
    
          <!-- 탑 메뉴 -->
        <jsp:include page="header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="side.jsp"></jsp:include>


         <main class="content">
            <span style="font-size: 36px; font-weight: 700;">메이트 게시판</span><br><br>
            <div class="sns_title">
                <span style="font-size: 30px; font-weight: 600;">${board.recruit_subject}</span>&nbsp;&nbsp;
                <span style="font-family: 'Gothic A1', sans-serif; color: #747474;">${board.recruit_address1} ${board.recruit_address2}</span>
            </div>
            <div class="sns_writer">
                <img src="${pageContext.request.contextPath}/uimg/${member.user_photo }" class="myimg">
                <span
                    style="font-size: 14px; font-weight: 600; font-family: 'Gothic A1', sans-serif; margin-top: 15px; margin-left: 10px;">${member.user_nickname}</span>
            </div>
            <div class="date_read">
                <span style="font-size: 14px; font-family: 'Gothic A1', sans-serif;">2024-11-01 12:34</span>
                <span style="font-size: 14px; font-family: 'Gothic A1', sans-serif; float: right; font-weight: 600;">조회수
                    : ${board.recruit_readcount}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모집인원 : ${board.recruit_recruitnum}/${board.recruit_remainnum}</span>
            </div>
            <hr><br><br>
            <div class="maincontent">
                <div id="map" class="image-container"></div>
                <script>
    				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
						   			   mapOption = {
    								   		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
											// 지도의 확대 레벨
											level: 4
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
					var coords = new kakao.maps.LatLng(${rc[0].lat}, ${rc[0].lng});
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
		
					<c:forEach var="i" begin="1" end="${fn:length(rc)-1}">
						cnt++;
						coords = new kakao.maps.LatLng(${rc[i].lat}, ${rc[i].lng});
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
	
							if(cnt==${fn:length(rc)}) dc='<div class="dotOverlay">거리 <span class="number">'+ distance + '</span>m<br><span>도착지점</span></div>';
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
            </div>
            <div style="margin-top: 20px; height: auto;">
                <span style="font-size: 24px; font-family: 'Gothic A1', sans-serif;">${board.recruit_content}</span>
            </div>

            <div class="button-container">
                <button type="button" class="action-button start" id="start1">참가신청</button>
                <button type="button" class="action-button stop" id="stop1">신청취소</button>
            </div>

           

            <div class="action-buttons">
             <c:choose>
             
            <c:when test="${member.user_id eq board.user_id}">
                <a class="delete" href="mate_update?pageNum=${pageNum}&recruit_no=${board.recruit_no}" style="display: inline-block;">
                    <i class="fa-solid fa-file-pen"></i>&nbsp;수정
                </a>
                
                <!-- 삭제버튼 누르면 바로 삭제 완료 alet뜨게함 -->
                <form method="post" action="matedelete">
                	<input type="hidden" name="pageNum"  value="${pageNum }">
					<input type="hidden"  name="recruit_no"  value=${board.recruit_no }>                
               		<button type="submit" class="delete button-style"><i class="fa-regular fa-trash-can"></i>&nbsp;삭제 </button>
                </form>
                
            </c:when>
            
            <c:otherwise>
                <a class="delete" href="mate_update?pageNum=${pageNum}&recruit_no=${board.recruit_no}" style="display: none;">
                    <i class="fa-solid fa-file-pen"></i>&nbsp;수정
                </a>
                
                <a class="delete" href="recruitdelete" style="display: none;">
                <i class="fa-regular fa-trash-can"></i>&nbsp;삭제
                </a>
            </c:otherwise>
        </c:choose>
        
        
        
                <a class="delete" href="#"><i class="fa-solid fa-table-list"></i>&nbsp;글목록</a>
            </div>
            
            
            <!-- 댓글 입력 -->
		<form name="frm" id="frm">
			<input type="hidden" name=user_id value="${member.user_id}">
			<input type="hidden" name="recruit_no" value="${no }"> 댓글 :
			<textarea rows="3" cols="50" name="recruit_r_content"></textarea>
			<input type="button" value="확인" id="repInsert">
		</form>
            
            
            <div id="rlist"></div>
        </main>
    </div>
</body>

</html>
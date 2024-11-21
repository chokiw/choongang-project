<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/css/run.css" rel="stylesheet">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6146d72cd45f3c8d130a2c1504d9647"></script>
    <script src="/js/run.js"></script>
    <title>Document</title>
 
<body>
    <div class="container">
    
         <!-- 탑 메뉴 -->
        <jsp:include page="${path }/WEB-INF/views/header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="${path }/WEB-INF/views/side.jsp"></jsp:include>
        

        <main class="content">
             <h1 class="main-title">기록</h1>
          <div class="content-wrapper">
         
          
          
                <div id="map" class="image-container">

                </div>
                <div class="side-content">
                    <span class="content1">달린 거리</span> <br><br>
                    <span id="distance" class="content2">0m</span><br><br><br><br>

                    <span class="content1">달린 시간</span><br><br>
                    <span id="stopwatch" class="content2">00:00:00:00</span><br><br><br><br>

                    <span class="content1">평균 페이스</span><br><br>
                    <span id="phase" class="content2">0'00"</span>
                </div>
            </div>
            <script src="/js/run_MapAndStopwatch.js"></script>

            <div class="button-container">
                <button type="button" class="action-button start" onclick="startClock()">시작</button>
                <button type="button" class="action-button stop" onclick="stopClock()">중지</button>
                <button type="button" id="store" class="action-button save">저장</button>
            </div>
            
            
<script>
$(document).ready(function(){
	$('#store').click(function(){
		if(t_path!=null) {
			coords = where();
		    var Lat=coords.getLat();
		    var Lng=coords.getLng();
		    coords=new kakao.maps.LatLng(Lat, Lng);
		    path = clickLine.getPath();
		    path.push(coords);
		    clickLine.setPath(path);
		    draw(clickLine.getPath());
		    map.setCenter(coords);
			
			t_path.push(Lat);
			t_path.push(Lng);		
		
			var data="path="+t_path+"&distance="+distance+"&time="+time;
			
			$.post('${pageContext.request.contextPath}/runnerdata',
					data,function(res){
					location.href="runnerdataresult?result="+res;
			});
		}
	});
});
</script>
    			
           
        </main>
    </div>

</body>

</html>
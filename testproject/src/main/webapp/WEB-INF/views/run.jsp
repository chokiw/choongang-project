<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/run.css" rel="stylesheet">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6146d72cd45f3c8d130a2c1504d9647"></script>
    <script src="/js/run.js"></script>
    <title>Document</title>
 
    <style>
.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}
</style>

</head>

<body>
    <div class="container">
    
         <!-- 탑 메뉴 -->
        <jsp:include page="header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="side.jsp"></jsp:include>
        

        <main class="content">
             <h1 class="main-title">기록</h1>
             <div class="sns_writer">
                <img src="/img/mancity.png" class="myimg">
                <span
                    style="font-size: 14px; font-weight: 600; font-family: 'Gothic A1', sans-serif; margin-top: 15px; margin-left: 10px;">강남구
                    퀵실버</span>
            </div>
            
               <div class="date_read">
               			 <span style="font-size: 14px; font-family: 'Gothic A1', sans-serif;">2024-11-01 12:34</span>
           		 	</div>

            
            <hr><br><br>
            
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
			console.log(t_path);
			console.log(distance);
			console.log(time);
			var data="path="+t_path+"&distance="+distance+"&time="+time;
			
			$.post('${pageContext.request.contextPath}/runnerdata',
					data,function(){});
		}
	});
});
</script>
    			
           
        </main>
    </div>

</body>

</html>
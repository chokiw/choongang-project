<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   	<link href="/css/sns_board.css" rel="stylesheet">
    <script src="/js/sns_board.js"></script>
 	<script type="text/javascript">
 	$(document).ready(function(){

 	    $("#alarm").load("/alarm_list");
		
 	    
 	});
 	
 	function openPopup(url) {
 		// 화면 크기 가져오기
 		var screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
 		var screenHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

 		// 팝업 크기 설정
 		var popupWidth = 500;
 		var popupHeight = 300;

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
 	
 	function setNo(runner_data_no){
 		location.href=runner_data_no;
 	}
</script>
    <title>Document</title>

</head>

<body>
    <div class="container">
        <!-- 탑 메뉴 -->
        <jsp:include page="${path}/WEB-INF/views/header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="${path}/WEB-INF/views/side.jsp"></jsp:include>

        <main class="content">
            <div class="track">
                <span style="font-size: 36px; font-weight: 700;">나의 참가 리스트</span><br><br>
                <span style="color: gray;">나의 참가 리스트입니다.</span>
            </div>
			<br>
          

            <div id="alarm"></div>
			
      
        </main>

    </div>
</body>

</html>
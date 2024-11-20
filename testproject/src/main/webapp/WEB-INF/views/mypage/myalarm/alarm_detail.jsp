<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

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
   	<link href="/css/sns_board.css" rel="stylesheet">
    <link href="/css/mate_detail.css" rel="stylesheet">
    <script src="/js/sns_board.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>    
 
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
			<div class="sns_writer">
                <img src="${pageContext.request.contextPath}/uimg/${member.user_photo }" class="myimg">
                <span
                    style="font-size: 14px; font-weight: 600; font-family: 'Gothic A1', sans-serif; margin-top: 15px; margin-left: 10px;">${member.user_nickname}</span>
            </div>
          
            <hr><br><br>
         	       
			${alarm.alarm_content}<br><br>
            
			<a href="mate_detail?pageNum=${pageNum}&recruit_no=${alarm.recruit_no}">이곳을 누르면 참가신청한 글로 이동합니다.</a>
            
			
      
        </main>

    </div>
</body>

</html>
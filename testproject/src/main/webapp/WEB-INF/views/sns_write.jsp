<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <link href="/css/sns_detail.css" rel="stylesheet">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6146d72cd45f3c8d130a2c1504d9647"></script>
    <script src="/js/sns_detail.js"></script>
    <title>Document</title>
</head>

<body>
    <div class="container">
        <div class="head">
            <!-- 페이지 제목 누르면 메인페이지로 이동 -->
            <a href="mainpage" class="title">RUNAWAY</a>

            <!-- 마이페이지 버튼 -->
            <div class="mypage">
                <a href="mypage" class="mypage_text">마이페이지</a>
            </div>

            <!-- 로그아웃 버튼 -->
            <div class="logout">
                <a href="sadad" class="logout_text"> <i class="fa-solid fa-right-from-bracket" style="color: #f4efe2;"></i>&nbsp;&nbsp;로그아웃</a>
            </div>

        </div>


        <!-- 사이드바 -->
        <div class="side" align="center">

            <div class="sns">

                <a href="sns_board" class="sns_text"><i class="fa-solid fa-person-running"
                        style="font-size: 30px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;트랙</a>
            </div>

            <div class="mate">

                <a href="mate_board" class="mate_text"><i class="fa-solid fa-people-group"
                        style="font-size: 30px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;메이트</a>
            </div>
            
            <div class="record">

                <a href="run" class="sns_text"><i class="fa-solid fa-stopwatch"
                        style="font-size: 30px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;기록</a>
            </div>
        </div>
        
        <div class="content">
        <form name="memberForm" method="post" action="/membership" onsubmit="return check()">
            <span style="font-size: 36px; font-weight: 700;">트랙 게시판</span><br><br>
            <div class="sns_title">
            	<span>제목 : </span><input type="text" style="font-size: 30px; font-weight: 600;">
            </div>
            
            <div class="sns_writer">
                	<img src="${pageContext.request.contextPath}/uimg/${member.user_photo}" class="myimg">
                	<span style="font-size: 14px; font-weight: 600; font-family: 'Gothic A1', sans-serif; margin-top: 15px; margin-left: 10px;">${member.user_nickname}</span>
            </div>
            
            <span>지역</span><br>
                <select id="sns_address1" name="user_address1" class="box3">
                    <option value="">광역시선택</option>
                    <option value="서울시">서울시</option>
                </select>
                <select id="sns_address2" name="user_address2" class="box3">
                    <option value="">지역선택</option>
                    <option value="강남구">강남구</option>
                    <option value="강동구">강동구</option>
                    <option value="강북구">강북구</option>
                    <option value="강서구">강서구</option>
                    <option value="관악구">관악구</option>
                    <option value="광진구">광진구</option>
                    <option value="구로구">구로구</option>
                    <option value="금천구">금천구</option>
                    <option value="노원구">노원구</option>
                    <option value="도봉구">도봉구</option>
                    <option value="동대문구">동대문구</option>
                    <option value="동작구">동작구</option>
                    <option value="마포구">마포구</option>
                    <option value="서대문구">서대문구</option>
                    <option value="서초구">서초구</option>
                    <option value="성동구">성동구</option>
                    <option value="성북구">성북구</option>
                    <option value="송파구">송파구</option>
                    <option value="양천구">양천구</option>
                    <option value="영등포구">영등포구</option>
                    <option value="용산구">용산구</option>
                    <option value="은평구">은평구</option>
                    <option value="종로구">종로구</option>
                    <option value="중구">중구</option>
                    <option value="중랑구">중랑구</option>
                </select> <br><br>

            <hr><br><br>
            
            <div class="maincontent">
		 		
		
		
		
		  	<div style="margin-left: 100px; margin-top: 50px; width: 500px; text-align: center; float: right;">
            	<span class="content1">달린 거리</span> <br><br>
                <span class="content2">0m</span><br><br><br><br>

                <span class="content1">달린 시간</span><br><br>
                <span class="content2">
<%--                     <fmt:formatNumber type="number" maxFractionDigits="0" value="${(rd.runner_data_time/60)}"></fmt:formatNumber> --%>0분
                    <%--${rd.runner_data_time%60} --%>초                     
                 </span><br><br><br><br>

                 <span class="content1">평균 페이스</span><br><br>
                 <span class="content2">
                     <%--<fmt:formatNumber type="number" maxFractionDigits="0" value="${rd.runner_data_time*1000/rd.runner_data_distance/60}"/> --%>0'
                     <%--<fmt:formatNumber type="number" maxFractionDigits="0" value="${rd.runner_data_time*1000/rd.runner_data_distance%60}"/> --%>0"
                  </span>
           </div>
          </div>

            <div style="margin-left: 50px; margin-top: 20px; width: 1400px;  height: auto;">
                <span style="font-size: 24px; font-family: 'Gothic A1', sans-serif;">내용작성</span><br>
                <textarea name="sns_content"  id="sns_content" rows="8" cols="50" ></textarea>
            </div>
			</form>
            
            <!-- 수정, 삭제 글목록 -->
             <div align="right" style="margin-top: 10px;">
                <a class="delete" href="asd"><i class="fa-solid fa-file-pen"></i>&nbsp;수정</a>&nbsp;&nbsp;&nbsp;
                <a class="delete" href="das"><i class="fa-regular fa-trash-can"></i>&nbsp;삭제</a>&nbsp;&nbsp;&nbsp;
                <a class="delete" href="das"><i class="fa-solid fa-table-list"></i>&nbsp;글목록</a>
             </div>
             <div id="reboard">
            </div>
        </div>
    </div>

</body>

</html>
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
   	<link href="/css/sns_board.css" rel="stylesheet">
    <script src="/js/sns_board.js"></script>
	<script type="text/javascript">
    	$(function() {
			//댓글목록 요청
			$('#board').load('${path}/userPostList');
		});
    </script>
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

                <a href="sadad" class="logout_text"> <i class="fa-solid fa-right-from-bracket"
                        style="color: #f4efe2;"></i>&nbsp;&nbsp;로그아웃</a>
            </div>

        </div>

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

            <div class="locationbox">

                <select>
                    <option value="서울시">서울시</option>
                </select>
                <select>
                    <option value="">지역선택</option>
                    <option value="강남구">강남구</option>
                    <option value="강남구">강동구</option>
                    <option value="강남구">강북구</option>
                    <option value="강남구">강서구</option>
                    <option value="강남구">관악구</option>
                    <option value="강남구">광진구</option>
                    <option value="강남구">구로구</option>
                    <option value="강남구">금천구</option>
                    <option value="강남구">노원구</option>
                    <option value="강남구">도봉구</option>
                    <option value="강남구">동대문구</option>
                    <option value="강남구">동작구</option>
                    <option value="강남구">마포구</option>
                    <option value="강남구">서대문구</option>
                    <option value="강남구">서초구</option>
                    <option value="강남구">성동구</option>
                    <option value="강남구">성북구</option>
                    <option value="강남구">송파구</option>
                    <option value="강남구">양천구</option>
                    <option value="강남구">영등포구</option>
                    <option value="강남구">용산구</option>
                    <option value="강남구">은평구</option>
                    <option value="강남구">종로구</option>
                    <option value="강남구">중구</option>
                    <option value="강남구">중랑구</option>
                </select>


                <!-- 인기글 버튼 -->
            </div>

            <div id="board"></div>
			

</body>

</html>
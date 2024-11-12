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
    <link href="/css/mate_detail.css" rel="stylesheet">
    <script src="/js/mate_detail.js"></script>
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
            <span style="font-size: 36px; font-weight: 700;">메이트 게시판</span><br><br>

            <div class="sns_title">
                <span style="font-size: 30px; font-weight: 600;">오늘 같이 달리실분~</span>&nbsp;&nbsp;
                <!-- select로 설정한 지역 -->
                <span style="font-family: 'Gothic A1', sans-serif; color: #747474;">서울시 강남구</span>
            </div>

            <div class="sns_writer">
                <img src="/img/Penguins.jpg" class="myimg">
                <span
                    style="font-size: 14px; font-weight: 600; font-family: 'Gothic A1', sans-serif; margin-top: 15px; margin-left: 10px;">강남구
                    퀵실버</span>
            </div>

            <div class="date_read">
                <span style="font-size: 14px; font-family: 'Gothic A1', sans-serif;">2024-11-01 12:34</span>
                <span style="font-size: 14px; font-family: 'Gothic A1', sans-serif; float: right; font-weight: 600;">조회수
                    : 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모집인원 : 2/5</span>
            </div>
            <hr><br><br>

            <div class="maincontent">
                <img src="/img/Penguins.jpg" style="width: 800px; height: 600px; margin-left: 300px;">

            </div>

            <div style="margin-left: 50px; margin-top: 20px; width: 1400px;  height: auto;">
                <span style="font-size: 20px; font-family: 'Gothic A1', sans-serif; font-style: normal;">오늘 오후 8시에 위 루트
                    달릴 사람 구합니다 8시에 강남역 12번출구 앞에서 만나요</span>

            </div>

            <!-- 추천버튼 -->
            <div align=center style="margin-top: 50px;">
                <a href="asd" class="request">참가신청</a>
                <a href="asd" class="cancel" style="margin-left: 60px;">참가취소</a>
            </div>

            <!-- 수정, 삭제 글목록 -->
            <div align="right" style="margin-top: 10px;">
                <a class="delete" href="asd"><i class="fa-solid fa-file-pen"></i>&nbsp;수정</a>&nbsp;&nbsp;&nbsp;
                <a class="delete" href="das"><i class="fa-regular fa-trash-can"></i>&nbsp;삭제</a>&nbsp;&nbsp;&nbsp;
                <a class="delete" href="das"><i class="fa-solid fa-table-list"></i>&nbsp;글목록</a>
            </div>
        </div>
    </div>
</body>

</html>
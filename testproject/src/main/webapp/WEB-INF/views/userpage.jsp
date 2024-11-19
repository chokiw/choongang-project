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
    <link href="common.css" rel="stylesheet">
    <link href="/css/mypage.css" rel="stylesheet">
    
    <title>Document</title>

</head>

<body>
    <div class="container">
        <header class="head">
            <a href="mainpage" class="title">RUNAWAY</a>
            <div class="header-buttons">
                <div class="mypage">
                    <a href="mypage" class="mypage_text">마이페이지</a>
                </div>
                <div class="logout">
                    <a href="#" class="logout_text">
                        <i class="fa-solid fa-right-from-bracket"></i> 로그아웃
                    </a>
                </div>
            </div>
        </header>


        <nav class="side">
            <div class="side-menu">
                <div class="menu-item sns">
                    <a href="sns_board" class="sns_text"><i class="fa-solid fa-person-running" style="font-size: 30px;"></i>트랙</a>
                </div>
                <div class="menu-item mate">
                    <a href="mate_board" class="mate_text"><i class="fa-solid fa-people-group" style="font-size: 30px;"></i>메이트</a>
                </div>
                <div class="menu-item record">
                    <a href="run class="sns_text"><i class="fa-solid fa-stopwatch" style="font-size: 30px;"></i>기록</a>
                </div>
            </div>
        </nav>







         <main class="content">
            <div class="track">
                <span style="font-size: 36px; font-weight: 700;">user_nickname의 페이지</span><br><br>

            </div>





            <div class="profilebox">

                <img src="Penguins.jpg" class="profileimg">

                <div style="margin-top: 30px;">
                    <span class="nickname">nickname 님</span><br>
                    <span class="location">서울시 강남구</span>
                  

                </div>





            </div>


            <!-- 기록 박스 -->
            <div class="recordbox">
                <div align="center">
                    <span class="content1">총 달린 거리</span><br><br>
                    <span class="content2">40.23KM</span>
                </div>

                <div class="crossline"></div>

                <div align="center">
                    <span class="content1">총 달린 시간</span><br><br>
                    <span class="content2">5:23:43</span>
                </div>

                <div class="crossline"></div>

                <div align="center">
                    <span class="content1">평균 페이스</span><br><br>
                    <span class="content2">4'34"/KM</span>
                </div>
            </div>



           

        </main>

    </div>
</body>

</html>
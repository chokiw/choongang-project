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
    <link href="./css/mypage.css" rel="stylesheet">
    <script src="./js/mynpage.js"></script>
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
            <div class="track">
                <span style="font-size: 36px; font-weight: 700;  font-family: 'Gothic A1', sans-serif;">마이
                    페이지</span><br><br>
            </div>

            <!-- 알람 아이콘 -->
            <div class="alert">
                <a href="asd"><i class="fa-solid fa-bell"></i></a>
                
                <!-- 알람이 있으면 생기는 빨간색 점 없거나 읽으면 사라짐 -->
                <div class="dot"></div>
            </div>
           


            <div class="profilebox">
              
                <img src="/img/Penguins.jpg" class="profileimg">
                
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

                <div style="height: 100px; border-left: solid thin; margin-left: 50px; margin-right: 50px;"></div>

                <div align="center">
                    <span class="content1">총 달린 시간</span><br><br>
                    <span class="content2">5:23:43</span>
                </div>

                <div style="height: 100px; border-left: solid thin; margin-left: 50px; margin-right: 50px;"></div>

                <div align="center">
                    <span class="content1">평균 페이스</span><br><br>
                    <span class="content2">4'34"</span>
                </div>
            </div>



            <!-- 메뉴판 -->
            <table>
                <colgroup>
                    <col class="col1">
                    <col class="col2">
                </colgroup>
                <tr>
                    <td><i class="fa-solid fa-stopwatch"></i></td>
                    <td>
                        <a href="asd">내가 달린 트랙</a>
                    </td>
                </tr>

                <tr>
                    <td><i class="fa-solid fa-pen"></i></td>
                    <td>
                        <a href="asd">내가 작성한 글</a>
                    </td>
                </tr>

                <tr>
                    <td>
                        <i class="fa-solid fa-fire"></i>
                    </td>
                    <td>
                        <a href="asd">추천 누른 글</a>
                    </td>
                </tr>

                <tr>
                    <td><i class="fa-solid fa-bell"></i></td>
                    <td>
                        <a href=asd>알람</a>
                    </td>
                </tr>

                <tr>
                    <td>
                        <i class="fa-solid fa-user-pen"></i>
                    </td>
                    <td>
                        <a href="asd">정보수정</a>
                    </td>
                </tr>

                <tr>
                    <td>
                        <i class="fa-solid fa-user-slash"></i>
                    </td>
                    <td>
                        <a href=asd>회원탈퇴</a>
                    </td>
                </tr>
            </table>

        </div>

    </div>
</body>

</html>
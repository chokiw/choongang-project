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
    <link href="/css/sns_detail.css" rel="stylesheet">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6146d72cd45f3c8d130a2c1504d9647"></script>
    <script src="./js/sns_detail.js"></script>
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

                <a href="snspage" class="sns_text"><i class="fa-solid fa-person-running"
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
            <span style="font-size: 36px; font-weight: 700;">트랙 게시판</span><br><br>

            <div class="sns_title">
                <span style="font-size: 30px; font-weight: 600;">나만의 지리는 트랙</span>&nbsp;&nbsp;
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
                    : 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;추천수 : 1</span>
            </div>
            <hr><br><br>
            
            <div class="maincontent">
                <div id="map" style="width: 800px; height: 600px; float: left;"></div>
		
		  <div style="margin-left: 100px; margin-top: 50px; width: 500px; text-align: center; float: right;">
                    <span class="content1">달린 거리</span> <br><br>
                    <span class="content2">4.62km</span><br><br><br><br>

                    <span class="content1">달린 시간</span><br><br>
                    <span class="content2">1:08:00</span><br><br><br><br>

                    <span class="content1">평균 페이스</span><br><br>
                    <span class="content2">5'87"</span>
            	</div>
           </div>

            <div style="margin-left: 50px; margin-top: 20px; width: 1400px;  height: auto;">
                <span style="font-size: 24px; font-family: 'Gothic A1', sans-serif;">여기에 내용입력</span>

            </div>

            <!-- 추천버튼 -->
            <div align=center style="margin-top: 40px;">
            <a href="qeqwe" class="recomend">
            <br><i class="fa-solid fa-fire" style="font-size: 32px; color: #333333;"></i><br>
                <span class="run">RUN</span>
            </a>
            </div>

            <!-- 수정, 삭제 글목록 -->
             <div align="right" style="margin-top: 10px;">
                <a class="delete" href="asd"><i class="fa-solid fa-file-pen"></i>&nbsp;수정</a>&nbsp;&nbsp;&nbsp;
                <a class="delete" href="das"><i class="fa-regular fa-trash-can"></i>&nbsp;삭제</a>&nbsp;&nbsp;&nbsp;
                <a class="delete" href="das"><i class="fa-solid fa-table-list"></i>&nbsp;글목록</a>
             </div>
             <div id="reboard">
                <table>
                    <colgroup>
                        <col class="col1">
                        <col class="col2">
                    </colgroup>
            
                    <tr>
                        <td><img class="re_image" src="/img/mancity.png"></td>
                        <td>
                            <span class="re_writer">user1</span><br>
                            <span class="re_content">정보 감사합니다</span><br>
                            <span class="re_date">2024-11-01 17:06</span>
                            <div class="block">
                                <a class="re_delete" href="asd">수정</a>&nbsp;&nbsp;
                                <a class="re_delete" href="asd">삭제</a>
                            </div>
                        </td>
            
                    </tr>
                    <tr>
                        <td><img class="re_image" src="/img/Jellyfish.jpg"></td>
                        <td>
                            <span class="re_writer">user2</span><br>
                            <span class="re_content">nice~</span><br>
                            <span class="re_date">2024-11-01 17:24</span>
                            <div class="block">
                                <a class="re_delete" href="asd">수정</a>&nbsp;&nbsp;
                                <a class="re_delete" href="asd">삭제</a>
                            </div>
                        </td>
                    </tr>
            
                </table>
    
            </div>


        </div>


    </div>

</body>

</html>
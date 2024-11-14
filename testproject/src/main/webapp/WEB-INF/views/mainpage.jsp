<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Paytone One' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/5e485453d8.js" crossorigin="anonymous"></script>
	<link href="/css/common.css" rel="stylesheet">
	<link href="/css/mainpage.css" rel="stylesheet">
    <script src="/js/mainpage.js"></script>
    <title>Document</title>
</head>

<body>
    <div class="container">
        <!-- 탑 메뉴 -->
        <jsp:include page="header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="side.jsp"></jsp:include>


        <!-- 메인 콘텐츠 -->
         <main class="content">
            <div class="track">
                <span style="font-size: 40px; font-weight: 700;">Best Runner</span>
                <span style="float: right; opacity: 80%; font-size: 14px;">랭킹은 현재 시간으로부터 7일전까지 데이터를 기준으로 정해집니다.</span>
                <br><br>
                <span style="color: gray;">이번주 가장 많이 달린 러너 입니다.</span>
                <span></span>
            </div>



            <div class="runner-grid">
                <div class="runner-item">
                    <div class="dot">1</div>
                    <img src="/img/mancity.png" class="img1"
                        style="border-radius: 50%; width: 200px; height: 200px; border-style: ridge;"><br>
                    <span class="nickname2"><a href="asd" class="profile_go">김김김님</a></span>
                    <span class="distance">100km</span>
                </div>

                <div class="runner-item">
                    <div class="dot">2</div>
                    <img src="/img/Penguins.jpg" class="img2"
                        style="border-radius: 50%; width: 150px; height: 150px; border-style: ridge;"><br>
                    <span class="nickname2"><a href="asd" class="profile_go">박박박님</a></span>
                    <span class="distance">80km</span>
                </div>

                <div class="runner-item">
                    <div class="dot">3</div>
                    <img src="/img/Jellyfish.jpg" class="img2"
                        style="border-radius: 50%; width: 150px; height: 150px; border-style: ridge;"><br>
                    <span class="nickname2"><a href="asd" class="profile_go">이이이님</a></span>
                    <span class="distance">50km</span>
                </div>

                <div class="runner-item">
                    <div class="dot">4</div>
                    <img src="/img/Hydrangeas.jpg" class="img2"
                        style="border-radius: 50%; width: 150px; height: 150px; border-style: ridge;"><br>
                    <span class="nickname2"><a href="asd" class="profile_go">최최최님</a></span>
                    <span class="distance">30km</span>
                </div>

                <div class="runner-item">
                    <div class="dot">5</div>
                    <img src="/img/Tulips.jpg"  class="img2"
                        style="border-radius: 50%; width: 150px; height: 150px; border-style: ridge;"><br>
                    <span class="nickname2"><a href="asd" class="profile_go">정정정님</a></span>
                    <span class="distance">10km</span>
                </div>
            </div>




            <div class="track" style="margin-top: 100px;">
                <span style="font-size: 40px; font-weight: 700;">Best Track</span><br><br>
                <span style="color: gray;">이번주 추천수를 많이 받은 인기 트랙 1,2,3위 입니다.</span>
            </div>




            <div class="pricebox">
                <div class="gold" id="track1">
                    <a href="asd"><img src="/img/route.png" class="trackimg"></a> <br><br>
                    <span class="nickname">writer1님</span><br>
                    <span class="location">서울시 강남구</span><br>
                    <img src="https://cdn.pixabay.com/photo/2021/09/11/10/27/medal-6615190_1280.png"
                        style="width: 50px; height: 60px; object-fit: fill;"><br>
                    <span class="distance">34</span>
                </div>

                <div class="gold" id="track2">
                    <a href="asd"><img src="/img/route.png" class="trackimg"></a> <br><br>
                    <span class="nickname">writer2님</span><br>
                    <span class="location">서울시 강서구</span><br>
                    <img src="https://cdn.pixabay.com/photo/2021/09/11/10/29/medal-6615195_1280.png"
                        style="width: 50px; height: 60px; object-fit: fill;"><br>
                    <span class="distance">24</span>
                </div>

                <div class="gold" id="track3">
                    <a href="asd"><img src="/img/route.png" class="trackimg"></a> <br><br>
                    <span class="nickname">writer3님</span><br>
                    <span class="location">서울시 강북구</span><br>
                    <img src="https://cdn.pixabay.com/photo/2021/09/11/10/32/third-6615198_1280.png"
                        style="width: 50px; height: 60px; object-fit: fill;"><br>
                    <span class="distance">17</span>
                </div>

            </div>
        </main>

    </div>
</body>

</html>
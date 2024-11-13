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
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/mate_write.css" rel="stylesheet">
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6146d72cd45f3c8d130a2c1504d9647"></script>
    <script src="/js/sns_detail.js"></script>
    <title>Document</title>


</head>



<body>
    <div class="container">
       	<!-- 탑 메뉴 -->
        <jsp:include page="header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="side.jsp"></jsp:include>
        
        
         <main class="content">
            <span style="font-size: 36px; font-weight: 700;">메이트 게시판</span><br><br>
            <span style="color: gray;" class="">모집인원은 2~6명 입니다.</span>


            <form>
                <div class="sns_title">
                    <span style="font-size: 24px; font-weight: 600;">제목</span>&nbsp;&nbsp;
                    <input type="text" style="font-size: 20px; font-weight: 500; width: 60%;" maxlength="50"
                        placeholder="제목을 입력하세요">
                </div>
                <div class="sns_writer">
                    <select id="sns_address1" name="user_address1">
                        <option value="">광역시선택</option>
                        <option value="서울시">서울시</option>
                    </select>
                    <select id="sns_address2" name="user_address2">
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
                    </select>
                    <span class="mate_count">

                        모집 인원 :
                        <select style="width: 100px;">
                            <option value="">인원수 선택</option>
                            <option value="2">2명</option>
                            <option value="3">3명</option>
                            <option value="4">4명</option>
                            <option value="5">5명</option>
                            <option value="6">6명</option>
                        </select>

                    </span>

                </div>



                <hr><br><br>
                <div class="maincontent">
                    <img src="route.png" alt="Route">
                    <div class="content-info">

                    </div>
                </div>
                <div style="margin-top: 20px; height: auto;">
                    <span
                        style="font-size: 20px; font-family: 'Gothic A1', sans-serif; font-style: normal; font-weight: 600;">내용작성</span><br>
                    <textarea name="sns_content" id="sns_content" rows="8" cols="50" style="width: 90%;"
                        placeholder="내용을 입력해주세요"></textarea>
                </div>

                <div class="button-container">

                    <button type="button" class="action-button save" onclick="startClock()">저장</button>
                </div>


            </form>
        </main>
    </div>

</body>

</html>
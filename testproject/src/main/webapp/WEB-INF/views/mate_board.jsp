<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link href="./css/mate_board.css" rel="stylesheet">
    <script src="./js/mate_board.js"></script>
    <title>Document</title>
	<script type="text/javascript">
    	$(function() {
			//댓글목록 요청
			$('#board').load('${path}/mate_list');
		});
    </script>

</head>

<body>
    <div class="container">
    
         <!-- 탑 메뉴 -->
        <jsp:include page="header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="side.jsp"></jsp:include>

        <main class="content">
            <div class="track">
                <span style="font-size: 36px; font-weight: 700;">메이트 게시판</span><br><br>
                <span style="color: gray;">함께 달리고 싶은 사람을 모집하고 신청할 수 있습니다.</span>
            </div>

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

            </div>
            <div id="board">
			
			</div>
			<br>
            <a href="mate_write" class="write">글작성</a><br><br>
            </main>
        </div>
    
</body>

</html>
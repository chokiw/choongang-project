<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/5e485453d8.js"	crossorigin="anonymous"></script>
<link href="/css/common.css" rel="stylesheet">
<link href="/css/mate_write.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6146d72cd45f3c8d130a2c1504d9647&libraries=services"></script>
<script src="/js/mate_write.js"></script>
<title>Document</title>
</head>
<body>
	<div class="container">
		<!-- 탑 메뉴 -->
        <jsp:include page="${path}/WEB-INF/views/header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="${path}/WEB-INF/views/side.jsp"></jsp:include>


		<main class="content">
			<span style="font-size: 36px; font-weight: 700;">메이트 게시판</span><br>
			<br>



			<form method="post" action="mate_writing" onsubmit="return check()">
			<input type="hidden" name=user_id id="user_id" value="${member.user_id}">
				<div class="recruit_title">
					<span style="font-size: 24px; font-weight: 600;">제목 :</span>&nbsp;&nbsp;
					<input type="text"
						style="font-size: 20px; font-weight: 500; width: 60%;"
						maxlength="50" id="recruit_subject" name="recruit_subject"
						placeholder="제목을 입력하세요">
				</div>
				<div class="recruit_writer">
					<select id="recruit_address1" name="recruit_address1">
						<option value="">광역시선택</option>
						<option value="서울시">서울시</option>
					</select> <select id="recruit_address2" name="recruit_address2">
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
						<span class="mate_count"> 모집 인원 : <input type="number"
						maxlength="2" oninput="numberMaxLength(this);"
						style="width: 2rem;" id="recruit_recruitnum"
						name="recruit_recruitnum">명

					</span>

				</div>

				<hr>
				<br>
				<br>
				<div class="maincontent">
					<div id="map"></div>
					<script src="/js/mate_write_map.js"></script>

				<input type="hidden" name="coords" id="coords" >
				</div>
				<div style="margin-top: 20px; height: auto;">
					<span style="font-size: 20px; font-family: 'Gothic A1', sans-serif; font-style: normal; font-weight: 600;">지정할 날짜</span>
					<input type="date" id="recruit_d_day" name="recruit_d_day"><br><br>
					<span style="font-size: 20px; font-family: 'Gothic A1', sans-serif; font-style: normal; font-weight: 600;">내용작성</span><br>
					<textarea rows="8" cols="50" style="width: 90%;" id="recruit_content" name="recruit_content" placeholder="내용을 입력해주세요"></textarea>
				</div>

				<div class="button-container">

					<button id="backStep"type="button" disabled class="action-button remove">경로 뒤로 한칸 이동</button>
					<button id="lineReset" type="button" class="action-button delete">경로 삭제</button>
					<button type="submit" class="action-button save">글 작성</button>
				</div>


			</form>
		</main>
	</div>

</body>

</html>
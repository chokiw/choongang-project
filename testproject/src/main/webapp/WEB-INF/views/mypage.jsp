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
<link href="/css/common.css" rel="stylesheet">
<link href="/css/mypage.css" rel="stylesheet">
<script src="/js/mypage.js"></script>
<title>Document</title>

</head>

<body>
	<div class="container">

		<!-- 탑 메뉴 -->
		<jsp:include page="header.jsp"></jsp:include>

		<!-- 사이드(왼쪽) 메뉴 -->
		<jsp:include page="side.jsp"></jsp:include>

		<main class="content">
			<div class="track">
				<span style="font-size: 36px; font-weight: 700;">마이페이지</span><br>
				<br>

			</div>

			<div class="profilebox">

				<img src="Penguins.jpg" class="profileimg">

				<div style="margin-top: 30px;">
					<span class="nickname">nickname 님</span><br> <span
						class="location">서울시 강남구</span>
					<!-- 알람 아이콘 -->
					<div class="alert">
						<a href="asd" style="color: black;"><i
							class="fa-solid fa-bell"></i></a>

						<!-- 알람이 있으면 생기는 빨간색 점 없거나 읽으면 사라짐 -->
						<div class="dot"></div>
					</div>

				</div>
			</div>
			<!-- 기록 박스 -->
			<div class="recordbox">
				<div align="center">
					<span class="content1">총 달린 거리</span><br>
					<br> <span class="content2">40.23KM</span>
				</div>

				<div class="crossline"></div>

				<div align="center">
					<span class="content1">총 달린 시간</span><br>
					<br> <span class="content2">5:23:43</span>
				</div>

				<div class="crossline"></div>

				<div align="center">
					<span class="content1">평균 페이스</span><br>
					<br> <span class="content2">4'34"</span>
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
					<td><a href="runnertrack" style="color: black;">내가 달린 트랙</a></td>
				</tr>

				<tr>
					<td><i class="fa-solid fa-pen"></i></td>
					<td><a href="/mywriting" style="color: black;">내가 작성한 글</a></td>
				</tr>

				<tr>
					<td><i class="fa-solid fa-fire"></i></td>
					<td><a href="asd" style="color: black;">추천 누른 글</a></td>
				</tr>

				<tr>
					<td><i class="fa-solid fa-bell"></i></td>
					<td><a href="asd" style="color: black;">알람</a></td>
				</tr>

				<tr>
					<td><i class="fa-solid fa-user-pen"></i></td>
					<td><a href="asd" style="color: black;">정보수정</a></td>
				</tr>

				<tr>
					<td><i class="fa-solid fa-user-slash"></i></td>
					<td><a href="Asd" style="color: black;">회원탈퇴</a></td>
				</tr>
			</table>

		</main>
	</div>
</body>

</html>
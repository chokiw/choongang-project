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
<link
	href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/5e485453d8.js"
	crossorigin="anonymous"></script>
<link href="/css/common.css" rel="stylesheet">
<link href="/css/sns_board.css" rel="stylesheet">
<link href="/css/snslist.css" rel="stylesheet">
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
				<span style="font-size: 36px; font-weight: 700;">내가 달린 트랙</span><br>
				<br> <span style="color: gray;">그동안 달렸던 트랙을 살펴 볼까요?</span>
				<hr>
			</div>
			<br>

			<table>
				<tr>
					<td>번호</td>
					<td>아이디</td>
					<td>거리</td>
					<td>시간</td>
					<td>날짜</td>
				</tr>
				<c:set var="no1" value="${runner_data_no}"></c:set>
				<c:forEach var="runner_data" items="">
				<tr>
					<td>${no1}</td>
					<td>${runner_data.user_id}</td>
					<td>${runner_data.runner_data_distance}</td>
					<td>${runner_data.runner_data_time}</td>
					<td>${runner_data.runner_data_date}</td>
				</tr>
				</c:forEach>
			</table>

		</main>

	</div>
</body>

</html>
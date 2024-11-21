<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
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
<link href="./css/mypage.css" rel="stylesheet">

<title>Document</title>

</head>

<body>
	<div class="container">

		<!-- 탑 메뉴 -->
		<jsp:include page="${path}/WEB-INF/views/header.jsp"></jsp:include>

		<!-- 사이드(왼쪽) 메뉴 -->
		<jsp:include page="${path}/WEB-INF/views/side.jsp"></jsp:include>

		<main class="content">
			<div class="track">
				<span style="font-size: 25px; font-weight: 700;">${runner.user_nickname}의
					페이지</span><br>
				<br>
			</div>

			<div class="profilebox">

				<img
					src="${pageContext.request.contextPath}/uimg/${runner.user_photo}"
					class="profileimg">

				<div style="margin-top: 30px;">
					<span class="nickname">${runner.user_nickname} 님</span><br> <span
						class="location">${runner.user_address1}
						${runner.user_address2}</span>
				</div>

			</div>


			<!-- 기록 박스 -->
			<div class="recordbox">
				<div align="center">
					<span class="content1">총 달린 거리</span><br> <br> <span
						class="content2">${runner.user_distance}</span>
				</div>

				<div class="crossline"></div>

				<div align="center">
					<span class="content1">총 달린 시간</span><br><br>
					<span class="content2">
						<fmt:formatNumber type="number" maxFractionDigits="0" value="${runner.user_runtime/(60*60)}"/>시
						<fmt:formatNumber type="number" maxFractionDigits="0" value="${(runner.user_runtime-(runner.user_runtime/(60*60)))/60}"/>분
                     	<fmt:formatNumber type="number" maxFractionDigits="0" value="${runner.user_runtime%60}"/>초
					</span>
				</div>

				<div class="crossline"></div>

				<div align="center">
					<span class="content1">평균 페이스</span><br><br>
					<span class="content2">
					<c:choose>
							<c:when test="${runner.user_distance==0}">
								00'00"
							</c:when>
							<c:when test="${runner.user_runtime==0}">
								00'00"
							</c:when>
							<c:otherwise>
								<fmt:formatNumber type="number" maxFractionDigits="0"
									value="${runner.user_runtime*1000/runner.user_distance/60}" />'
                     			<fmt:formatNumber type="number"
									maxFractionDigits="0"
									value="${runner.user_runtime*1000/runner.user_distance%60}" />"
							</c:otherwise>
						</c:choose>
					</span>

				</div>
			</div>

		</main>

	</div>
</body>

</html>
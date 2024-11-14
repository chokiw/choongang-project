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
<script src="/js/sns_board.js"></script>
<script type="text/javascript">
	$(function() {
		//댓글목록 요청
		$('#board').load('${path}/snslist');
	});
</script>
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
				<span style="font-size: 36px; font-weight: 700;">내가 추천한 글목록</span><br>
				<br> <span style="color: gray;">자신이 추천한 글 목록을 확인하세요</span>
			</div>
			<br>
			<div class="locationbox">
				<!-- 인기글 버튼 -->
				<div class="hot">
					<a href="sd" class="hot_text"> <i class="fa-solid fa-fire"></i>
						인기글
					</a>
				</div>
			</div>

			<div class="locationbox">
				<!-- 내가 추천한 글 목록 -->

				<c:if test="${empty likedPosts}">
					<p>You haven't liked any posts yet.</p>
				</c:if>
				<c:forEach var="post" items="${likedPosts}">
					<h2>${post.sns_subject}</h2>
					<p>${post.sns_content}</p>
					<p>Liked on: ${post.sns_date}</p>
				</c:forEach>
			</div>

			<a href="sns_write" class="write">글작성</a><br> <br>
		</main>

	</div>
</body>

</html>
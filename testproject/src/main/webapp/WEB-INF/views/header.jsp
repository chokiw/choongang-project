<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
 <link href="/css/icons.css" rel="stylesheet">
</head>
<header class="head">
	<a href="mainpage" class="title">RUNAWAY</a>
	<div class="header-buttons">
		<div class="mypage">
			<a href="mypage" class="mypage_text"> <img
				src=" ${pageContext.request.contextPath}/uimg/${member.user_photo}"
				style="border-radius: 50%; width: 30px; height: 30px;">
				${member.user_nickname }
			</a>
		</div>
		<div class="logout">
			<a href="/logout1" class="logout_text"> <span
				class="material-symbols-outlined"> logout </span>&nbsp; 로그아웃
			</a>
		</div>
	</div>
</header>
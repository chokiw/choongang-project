<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
	<link href="/css/login.css" rel="stylesheet">
	<title>Document</title>
	<script>
	function openPopup(url) {
		// 화면 크기 가져오기
		var screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
		var screenHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

		// 팝업 크기 설정
		var popupWidth = 500;
		var popupHeight = 300;

		// 중앙 위치 계산
		var left = (screenWidth - popupWidth) / 2;
		var top = (screenHeight - popupHeight) / 2;

		// 팝업창 열기
		window.open(url, '_blank',
			'width=' + popupWidth +
			',height=' + popupHeight +
			',left=' + left +
			',top=' + top +
			',scrollbars=yes,resizable=yes');
	}
	</script>
</head>

<body>

<div class="main">
        <div class="title">RUNAWAY</div>
        <form method="post" action="login" class="login_form">
            <label for="user_id" class="id_passwd">아이디</label>
            <input class="input_idpw" type="text" id="user_id" name="user_id">
            <label for="user_passwd" class="id_passwd">비밀번호</label>
            <input class="input_idpw" type="password" id="user_passwd" name="user_passwd">
            <input type="submit" class="button" value="로그인">
        </form>
    </div>
    <hr class="bar">
    <div class="links">
        <a href="/find_id" onclick="openPopup(this.href); return false;" class="link">아이디 찾기</a>
        <a href="/find_pass" onclick="openPopup(this.href); return false;" class="link">비밀번호 찾기</a>
        <a href="/member" class="link">회원가입</a>
    </div>
</body>

</html>
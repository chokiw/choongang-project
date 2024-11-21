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
	
	function confirmWithdraw() {
	    // 확인 창 띄우기
	    const confirmed = confirm('정말로 탈퇴하시겠습니까?');
	    return confirmed; // 확인(예)을 누르면 true, 취소(아니오)를 누르면 false
	}
	
	</script>
</head>

<body>

<div class="main">
        <div class="title">RUNAWAY</div>
<form method="post" action="withdraw_ok" class="login_form" onsubmit="return confirmWithdraw();">
    <label for="user_passwd" class="id_passwd">비밀번호</label>
    <input class="input_idpw" type="password" id="user_passwd" name="user_passwd">
    <input type="submit" class="button" value="회원탈퇴">
</form>
    </div>
</body>

</html>
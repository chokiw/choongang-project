<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<title>Document</title>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/5e485453d8.js" crossorigin="anonymous"></script>


<style>
span {
	font-size: 20px;
	font-family: "Gothic A1", sans-serif;
	font-weight: bold;
	text-align: center;
}

.ok {
	width: 60px;
	height: 30px;
	border-radius: 10px;
	margin-top: 5px;
	font-style: normal;
	font-family: "Gothic A1", sans-serif;
	font-size: 18px;
}
</style>



</head>

<body >

	<form align="center">
	<span>회원님의 아이디는 ${id } 입니다.</span>
	<br>
	<br>
	<input type="button" value="확인" class="ok"  onclick="window.close();" />
	</form>
</body>

</html>
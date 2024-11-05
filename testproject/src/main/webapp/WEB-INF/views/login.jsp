<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

	<title>Document</title>
	<style>
		.main {
			margin-top: 200px;
			margin-left: auto;
			margin-right: auto;
			width: 600px;
		}

		.title {
			font-family: "Bangers", system-ui;
			font-style: normal;
			color: #cf3e00;
			font-size: 120px;
			font-weight: 800;
			text-align: center;
		}

		.login_form {
			margin-top: 100px;
			display: grid;
			grid-template-columns: 400px;
		}

		.box1 {
			grid-column: 1/2;
		}

		.box2 {
			grid-column: 2/3;
			margin-top: 45px;
		}

		.id_passwd {
			font-size: 20px;
			font-weight: 20px;
			font-family: "Gothic A1", sans-serif;
			font-style: normal;
		}

		.input_idpw {
			height: 30px;
			width: 350px;
			border-radius: 8px;
			background-color: #D9D9D9;
			margin-top: 4px;
			border-style: hidden;
			margin-bottom: 4px;
			padding-left: 10px;
		}


		.button {
			display: inline-block;
			padding: 15px 25px;
			font-size: 24px;
			cursor: pointer;
			text-align: center;
			text-decoration: none;
			outline: none;
			color: #fff;
			background-color: #0000FF;
			opacity: 30%;
			border: none;
			border-radius: 15px;




		}

		.button:hover {
			background-color: #6a5ba8
		}

		.button:active {
			background-color: #6a5ba8;
			box-shadow: 0 5px #666;
			transform: translateY(4px);
		}

		.bar {
			margin-top: 14px;
			border: #305346 solid 20px;
			border-radius: 5px;
		}

		.link {
			text-decoration: none;
			color: #666;
		}
	</style>
</head>

<body>

	<div class="main">
		<div class="title">
			RUNAWAY
		</div>
		<form method="post" action="login">
			<div class="login_form">
				<div class="box1">
					<span class="id_passwd">아이디</span><br>
					<input class="input_idpw" type="text" id="user_id" name="user_id" required="required"><br>
					<span class="id_passwd">비밀번호</span><br>
					<input class="input_idpw" type="password" id="user_passwd" name="user_passwd" required="required">
				</div>
				<div class="box2">
					<input type="submit" class=button value="로그인">
				</div>
			</div>
		</form>
	</div>
	<hr class="bar">
	<div align="center">
		<a href="" class="link">아이디 찾기</a> &nbsp; | &nbsp; <a href="" class="link">비밀번호 찾기</a> &nbsp; | &nbsp; <a
			href="" class="link">회원가입</a>
	</div>


</body>

</html>
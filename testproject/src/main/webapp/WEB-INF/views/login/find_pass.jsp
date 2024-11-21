<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
	<script src="/js/find_pass.js"></script>
	<link href="/css/find_pass.css" rel="stylesheet">
    <style>
        
    </style>

</head>

<body>
<div align="center">
    <form style="margin-top: 50px;" method="post" action="find_pass_ok">

        <span>아이디</span><br><br>
        <input type="text" id="user_id" name="user_id" class="box" style=" width: 280px;"><br><br>
       


        <span>주민등록 번호</span><br><br>

        <input type="text" size="6" maxlength="6" id="user_jumin1" name="user_jumin1" class="box">&nbsp; -
        &nbsp;<input type="password" size="7" maxlength="7" id="user_jumin2" name="user_jumin2" class="box"><br>
        <div id="jumincheck" class="alertmsg"></div><br>

        <input type="submit" id="pass_button" disabled value="비밀번호 찾기" class="passok">
        <input type="button"  class="passok" value="취소" class="idok" onclick="window.close();">
    </form>
    </div>
</body>

</html>
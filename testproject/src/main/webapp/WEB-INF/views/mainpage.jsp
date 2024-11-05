<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
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
    <title>Document</title>

    <script>
        $(document).ready(function () {
            $(".logout").mouseover(function () {
                $(".logout").css("background-color", "gray");
            });
            $(".logout").mouseout(function () {
                $(".logout").css("background-color", "#305346");
            });
        });

        $(document).ready(function () {
            $(".mypage").mouseover(function () {
                $(".mypage").css("background-color", "gray");
            });
            $(".mypage").mouseout(function () {
                $(".mypage").css("background-color", "#305346");
            });
        });




        $(document).ready(function () {
            $(".sns").mouseover(function () {
                $(".sns").css("background-color", "#b4b4b4");
            });
            $(".sns").mouseout(function () {
                $(".sns").css("background-color", "white");
            });
        });

        $(document).ready(function () {
            $(".mate").mouseover(function () {
                $(".mate").css("background-color", "#b4b4b4");
            });
            $(".mate").mouseout(function () {
                $(".mate").css("background-color", "white");
            });
        });
        
        $(function() {
    		//댓글목록 요청
    		$('#hotboard').load('${path}/snslist');
    		$('#recruitboard').load('${path}/snslist');
    	});


    </script>












    <style>
        .container {
            display: grid;
            grid-template-columns: 300px;
            grid-template-rows: 100px;
            height: auto;
            gap: 1rem;
        }

        /* 상단 부분 css */
        .head {
            grid-column: 1/3;
            grid-row: 1/2;
            background-color: #305346;
            position: sticky;
            top: 0;

        }

        .title {
            font-family: "Bangers", system-ui;
            font-style: normal;
            color: #cf3e00;
            font-size: 80px;
            text-decoration: none;
            margin-left: 100px;
           
        }

        /* 마이페이지 블럭 */
        .mypage {
            position: absolute;
            top: 8px;
            right: 300px;
            margin-top: 30px;
            height: 30px;
            width: 100px;
            border-width: 1px;
            border-radius: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .mypage_text {
            color: #f4efe2;
            text-decoration: none;
            font-family: "Gothic A1", sans-serif;
            font-weight: 600;
            font-style: normal;

        }


        /* 로그아웃 블럭 */
        .logout {
            position: absolute;
            top: 8px;
            right: 150px;
            margin-top: 30px;
            height: 30px;
            width: 100px;
            border-width: 1px;
            border-radius: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logout_text {
            color: #f4efe2;
            text-decoration: none;
            font-family: "Gothic A1", sans-serif;
            font-weight: 600;
            font-style: normal;

        }


        /* 사이드 부분 css */
        .side {
            grid-column: 1/2;
            grid-row: 2/3;
            height: 800px;
            border-right-color: #b4b4b4;
            border-right-style: groove;
            border-right-width: 1px;
            border-left-color: #b4b4b4;
            border-left-style: groove;
            border-left-width: 1px;
            margin-left: auto;
            margin-right: auto;
            width: 200px;
        }

        /* sns 게시판 */
        .sns{
            margin-top: 200px;
            width: 180px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 5px;

        }

        .sns_text{
            color: black;
            text-decoration: none;
            font-family: "Gothic A1", sans-serif;
            font-weight: 600;
            font-style: normal;  
            font-size: 22px;  
        }
        
        /* 러닝메이트 게시판 */
        .mate{
            margin-top: 100px;
            width: 180px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 5px;
        }

        .mate_text{
            color: black;
            text-decoration: none;
            font-family: "Gothic A1", sans-serif;
            font-weight: 600;
            font-style: normal;  
            font-size: 22px;  
        }





        /* 메인콘텐츠 */
        .content {
            grid-column: 2/3;
            grid-row: 2/3;
            background-color: skyblue;
            margin-right: 100px;
            height: 2000px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="head">
            <!-- 페이지 제목 누르면 메인페이지로 이동 -->
            <a href="mainpage" class="title" >RUNAWAY</a>



            <!-- 마이페이지 버튼 -->
            <div class="mypage">
                <a href="dasd" class="mypage_text">마이페이지</a>
            </div>

            <!-- 로그아웃 버튼 -->
            <div class="logout">
                <i class="fa-solid fa-right-from-bracket" style="color: #f4efe2;"></i>&nbsp;&nbsp;
                <a href="sadad" class="logout_text">로그아웃</a>
            </div>

        </div>




        <div class="side" align="center">

            <div class="sns">
                <i class="fa-solid fa-person-running" style="font-size: 30px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="snsboard" class="sns_text">트랙</a>
            </div>

            <div class="mate">
                <i class="fa-solid fa-people-group" style="font-size: 30px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="sdsa" class="mate_text">메이트</a>
            </div>
        </div>








        <div class="content">
            <div id="hotboard" style="background-color: white; border-style:solid; border-color:black;float:left;"></div>
			<div id="recruitboard" style=" background-color: white; border-style:solid; border-color:black;float:right;"></div>
        </div>
       
    </div>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/mate_detail.css" rel="stylesheet">
    <script src="/js/mate_detail.js"></script>
    <title>Document</title>
    <script type="text/javascript">
		$(function(){
			$(".action-button.start").click(function(){
				alert("참가신청 완료 되었습니다.");
			});
				
			$(".action-button.stop").click(function(){
				alert("신청이 취소 되었습니다.")
			});
		});    
    </script>
</head>

<body>
    <div class="container">
    
          <!-- 탑 메뉴 -->
        <jsp:include page="header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="side.jsp"></jsp:include>


         <main class="content">
            <span style="font-size: 36px; font-weight: 700;">메이트 게시판</span><br><br>
            <div class="sns_title">
                <span style="font-size: 30px; font-weight: 600;">${sns.sns_subject}</span>&nbsp;&nbsp;
                <span style="font-family: 'Gothic A1', sans-serif; color: #747474;">${sns.sns_address1} ${sns.sns_address2}</span>
            </div>
            <div class="sns_writer">
                <img src="Penguins.jpg" class="myimg">
                <span
                    style="font-size: 14px; font-weight: 600; font-family: 'Gothic A1', sans-serif;
                    margin-top: 15px; margin-left: 10px;">${runner.user_nickname}</span>
            </div>
            <div class="date_read">
                <span style="font-size: 14px; font-family: 'Gothic A1', sans-serif;">${sns.sns_date }</span>
                <span style="font-size: 14px; font-family: 'Gothic A1', sans-serif; float: right; font-weight: 600;">조회수
                    : ${sns.sns_readcount}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모집인원 : 2/5</span>
            </div>
            <hr><br><br>
            <div class="maincontent">
                <img src="/img/Hydrangeas.jpg" alt="Route">
                
            </div>
            <div style="margin-top: 20px; height: auto;">
                <span style="font-size: 24px; font-family: 'Gothic A1', sans-serif;">오늘 오후 8시에 위 루트
                    달릴 사람 구합니다 8시에 강남역 12번출구 앞에서 만나요</span>
            </div>

            <div class="button-container">
                <button type="submit" class="action-button start">참가신청</button>
                <button type="submit" class="action-button stop">신청취소</button>
            </div>
           

            <div class="action-buttons">
                <a class="delete" href="#"><i class="fa-solid fa-file-pen"></i>&nbsp;수정</a>
                <a class="delete" href="#"><i class="fa-regular fa-trash-can"></i>&nbsp;삭제</a>
                <a class="delete" href="#"><i class="fa-solid fa-table-list"></i>&nbsp;글목록</a>
            </div>
        </main>
    </div>
</body>

</html>
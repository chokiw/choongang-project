<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <link href="/css/sns_write.css" rel="stylesheet">
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6146d72cd45f3c8d130a2c1504d9647"></script>
    <script src="/js/sns_detail.js"></script>
    <title>Document</title>
	<script>
		function openPopup(url) { 
			// 화면 크기 가져오기
			var screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
			var screenHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

			// 팝업 크기 설정
			var popupWidth = 1050;
			var popupHeight = 700;

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
		
		function setNo(runner_data_no){
			
		}
	</script>

</head>



<body>
    <div class="container">
       	<!-- 탑 메뉴 -->
        <jsp:include page="header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="side.jsp"></jsp:include>
        
        
        <main class="content">
        <form method="post" action="snswrite" onsubmit="return check()">
            <span style="font-size: 36px; font-weight: 700;">트랙 게시판</span><br><br>
            <div class="sns_title">
            	<span style="font-size: 24px; font-weight: 600;">제목</span>&nbsp;&nbsp;
                <input type="text" style="font-size: 20px; font-weight: 500; width: 60%;" maxlength="50" placeholder="제목을 입력하세요"  id="sns_subject" name="sns_subject">  
            </div>
            
            <div class="sns_writer">
                 <select id="sns_address1" name="sns_address1">
                    <option value="">광역시선택</option> 
                    <option value="서울시">서울시</option>
                </select>
                <select id="sns_address2" name="sns_address2">
                    <option value="">지역선택</option>
                    <option value="강남구">강남구</option>
                    <option value="강동구">강동구</option>
                    <option value="강북구">강북구</option>
                    <option value="강서구">강서구</option>
                    <option value="관악구">관악구</option>
                    <option value="광진구">광진구</option>
                    <option value="구로구">구로구</option>
                    <option value="금천구">금천구</option>
                    <option value="노원구">노원구</option>
                    <option value="도봉구">도봉구</option>
                    <option value="동대문구">동대문구</option>
                    <option value="동작구">동작구</option>
                    <option value="마포구">마포구</option>
                    <option value="서대문구">서대문구</option>
                    <option value="서초구">서초구</option>
                    <option value="성동구">성동구</option>
                    <option value="성북구">성북구</option>
                    <option value="송파구">송파구</option>
                    <option value="양천구">양천구</option>
                    <option value="영등포구">영등포구</option>
                    <option value="용산구">용산구</option>
                    <option value="은평구">은평구</option>
                    <option value="종로구">종로구</option>
                    <option value="중구">중구</option>
                    <option value="중랑구">중랑구</option>
                </select>

               
            </div>

            <hr><br><br>
            
            <div class="maincontent">
            	 <img src="/img/route.png" alt="Route">
		 		
		
			  <div class="content-info">
                    <div>
                        <span class="content1">달린 거리</span><br>
                        <span class="content2">4.62km</span><br><br><br>
                    </div>
                    <div>
                        <span class="content1">달린 시간</span><br>
                        <span class="content2"><%--                     <fmt:formatNumber type="number" maxFractionDigits="0" value="${(rd.runner_data_time/60)}"></fmt:formatNumber> --%>0분
                    <%--${rd.runner_data_time%60} --%>초         </span><br><br><br>
                    </div>
                    <div>
                        <span class="content1">평균 페이스</span><br>
                        <span class="content2">   <%--<fmt:formatNumber type="number" maxFractionDigits="0" value="${rd.runner_data_time*1000/rd.runner_data_distance/60}"/> --%>0'
                     <%--<fmt:formatNumber type="number" maxFractionDigits="0" value="${rd.runner_data_time*1000/rd.runner_data_distance%60}"/> --%>0"</span><br><br><br>
                    </div>    
           </div>
           </div>
          
          

            <div style="margin-top: 20px; height: auto;">
                <span style="font-size: 20px; font-family: 'Gothic A1', sans-serif; font-style: normal; font-weight: 600;">내용작성</span><br>
               <textarea name="sns_content"  id="sns_content" rows="8" cols="50" style="width: 90%;" placeholder="내용을 입력해주세요"></textarea>
            </div>

            <div class="button-container">
                <button type="button" onclick="openPopup('sns_write_list')" class="action-button load">내가 달린 트랙 가져오기</button>
                 <button type="submit" class="action-button save">글 작성</button>
            </div>

			</form>
            
           
        </main>
    </div>

</body>

</html>
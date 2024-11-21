<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/5e485453d8.js" crossorigin="anonymous"></script>
    <link href="/css/common.css" rel="stylesheet">
    <link href="./css/mate_board.css" rel="stylesheet">
    <script src="./js/mate_board.js"></script>
    <title>Document</title>
	<script type="text/javascript">
    	$(function() {
			//댓글목록 요청
			$('#board').load('${path}/mate_list');
		});
    	
    	
    	
    	// 지역별로 글 리스트 이동
    	$(function() {
    		
    		// 광역시 선택일때 지역을 선택 못하게 하고 서울시를 선택하면 지역을 선택할 수 있게 한다.
   		 $('#recruit_address1').change(function() {
   	            var city = $(this).val();
   	            var $district = $('#recruit_address2');
   	            
   	            $district.empty().append('<option value="">지역선택</option>');
   	            
   	            if (city === "서울시") {
   	                var seoulDistricts = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
   	                seoulDistricts.forEach(function(district) {
   	                    $district.append('<option value="' + district + '">' + district + '</option>');
   	                });
   	                $district.prop('disabled', false);
   	            } else {
   	                $district.prop('disabled', true);
   	            }
   	        });
    		
  		 	// 페이지 로드 시 초기 상태 설정
	        $('#recruit_address2').prop('disabled', true);
    		
    		
    	    $('form').on('submit', function(e) {
    	        e.preventDefault();
    	        var formData = $(this).serialize();
    	        
    	        $.ajax({
    	            url: '${path}/mate_list_location',
    	            type: 'GET',
    	            data: formData,
    	            success: function(response) {
    	                $('#board').html(response);
    	            },
    	            error: function(xhr, status, error) {
    	                console.error("AJAX 요청 실패:", error);
    	            }
    	        });
    	    });
    	});

    	
    	function getAddressList(pageNum, recruit_address1, recruit_address2) {
    		
    		
    		var uri = '${path}/mate_list_location?pageNum=' + pageNum+'&recruit_address1='+recruit_address1+'&recruit_address2='+recruit_address2;
    		$('#board').load(uri);
    	} 
    </script>

</head>

<body>
    <div class="container">
    
        <!-- 탑 메뉴 -->
        <jsp:include page="${path}/WEB-INF/views/header.jsp"></jsp:include>
        
        <!-- 사이드(왼쪽) 메뉴 -->
        <jsp:include page="${path}/WEB-INF/views/side.jsp"></jsp:include>

        <main class="content">
            <div class="track">
                <span style="font-size: 36px; font-weight: 700;">메이트 게시판</span><br>
                <span style="color: gray;">함께 달리고 싶은 사람을 모집하고 신청할 수 있습니다.</span>
            </div><br>

            <div class="locationbox">
	<form>
				 <select id="recruit_address1"   name="recruit_address1">
                    <option value="">광역시선택</option> 
                    <option value="서울시">서울시</option>
                </select>
                <select id="recruit_address2"  name="recruit_address2" disabled>
                    <option value="">지역선택</option>
                    <option value="강남구">강남구</option>
                    <option value="강동구" >강동구</option>
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
                 <button type="submit" class="search">이동</button>
				</form>	
            </div>
            <div id="board">
			
			</div>
			<br>
            <a href="mate_write" class="write">글작성</a><br><br>
            </main>
        </div>
    
</body>

</html>
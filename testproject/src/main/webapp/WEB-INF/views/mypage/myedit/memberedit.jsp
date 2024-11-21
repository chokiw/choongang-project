<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap"
   rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/5e485453d8.js"
   crossorigin="anonymous"></script>
<script src="/js/memberedit.js"></script>
<link href="/css/member.css" rel="stylesheet">
<title>회원정보 수정</title>



<script>
   $(document).ready(function() {
      const domainValue = "${memberinfo.user_domain}"; // 서버에서 전달된 초기값
      if (domainValue) {
         $("#user_domain").val(domainValue); // <input> 값 설정
         $("#email").val(domainValue); // <select> 값 선택
      }
   });

   // 도메인 선택 변경 시 처리
   function domain_list_edit() {
      const selectedValue = $("#email").val(); // <select>에서 선택한 값
      const domainInput = $("#user_domain"); // <input> 태그

      if (selectedValue === "0") { // "직접입력" 선택 시
         domainInput.val("").prop("readonly", false).focus(); // 입력 가능하게 변경
      } else { // 다른 옵션 선택 시
         domainInput.val(selectedValue).prop("readonly", true); // 값을 설정하고 읽기 전용으로 변경
      }
   }
   
   function confirmWithdraw() {
       // 확인 창 띄우기
       const confirmed = confirm('수정을 완료하시겠습니까?');
       return confirmed; // 확인(예)을 누르면 true, 취소(아니오)를 누르면 false
   }
</script>
</head>

<body style="background-color: #D9D9D9;">
   <div class="member">
      <div class="logo" id="logo">RUNAWAY</div>
      <div class="title" id="title">회원정보 수정</div>
      <br> <br> <br>

      <form method="post" action="/membereditupdate"
         enctype="multipart/form-data" id="edit_form"
         onsubmit="return confirmWithdraw() && check()">
         <input type="hidden" id="basicPhoto" name="basicPhoto" value="">
         <div class="form" id="form_content">

            <!-- <span>아이디</span><br>  -->
            <input type="text" name="user_id" value="${memberinfo.user_id}" readonly class="box">&nbsp;&nbsp;

            <!-- 프로필이미지 삽입 -->
            <div class="imgform" id="imgform">
               <span>프로필 사진</span>
               <div class="profile_img" id="profile_img">
                  <c:if test="${memberinfo.user_photo != null}">
                     <img src="/uimg/${memberinfo.user_photo}"
                        id="user_photo"
                        style="width: 150px; height: 150px; border-radius: 50%;">
                  </c:if>
                  <c:if test="${memberinfo.user_photo == null}">
                      <img src="/uimg/Default.png"
                          id="user_photo"
                          style="width: 150px; height: 150px; border-radius: 50%;">
                  </c:if>
               
                  <%-- <img
                     src="${memberinfo.user_photo != null ? pageContext.request.contextPath + '/uimg/' + memberinfo.user_photo : 'https://cdn.pixabay.com/photo/2021/07/02/04/48/user-6380868_1280.png'}"
                     id="user_photo"
                     style="width: 150px; height: 150px; border-radius: 50%;"> --%>
               </div>
               <input type="file" name="file1" id="file_upload" accept="image/*"
                  onchange="loadFile(this)" style="margin-top: 10px;"><br>
               <button type="button" id="resetimg" style="margin-top: 10px;">기본이미지로
                  변경</button>
            </div>


            <span>이름</span><br> <input type="text" name="user_name"
               id="user_name" value="${memberinfo.user_name}" class="box"><br>
            <br> <span>닉네임</span><br> <input type="text"
               name="user_nickname" id="user_nickname"
               value="${memberinfo.user_nickname}" class="box">&nbsp;
            <button type="button" id="dup_nick" disabled
               onclick="nickname_check()">중복확인</button>
            <br>
            <div id="nickcheck" class="alertmsg"></div>
            <br> <span>핸드폰 번호</span><br> <select name="user_phone1"
               id="user_phone1" class="box2">
               <option value="">번호선택</option>
               <option value="010"
                  ${memberinfo.user_phone1 == '010' ? 'selected' : ''}>010</option>
               <option value="011"
                  ${memberinfo.user_phone1 == '011' ? 'selected' : ''}>011</option>
               <option value="016"
                  ${memberinfo.user_phone1 == '016' ? 'selected' : ''}>016</option>
               <option value="018"
                  ${memberinfo.user_phone1 == '018' ? 'selected' : ''}>018</option>
               <option value="019"
                  ${memberinfo.user_phone1 == '019' ? 'selected' : ''}>019</option>
            </select>- <input type="text" size="4" maxlength="4" name="user_phone2"
               id="user_phone2" value="${memberinfo.user_phone2}" class="box2">-
            <input type="text" size="4" maxlength="4" name="user_phone3"
               id="user_phone3" value="${memberinfo.user_phone3}" class="box2"><br>
            <div id="phonecheck" class="alertmsg"></div>
            <br> <span>이메일</span><br> <input type="text"
               id="user_emailid" name="user_emailid"
               value="${memberinfo.user_emailid}" class="box1">&nbsp; @
            &nbsp; <input type="text" id="user_domain" name="user_domain"
               class="box1" readonly> <select id="email" class="email"
               name="email" onchange="domain_list_edit()">
               <option value="">이메일 선택</option>
               <option value="0">직접입력</option>
               <option value="naver.com"
                  ${memberinfo.user_domain == 'naver.com' ? 'selected' : ''}>네이버</option>
               <option value="daum.net"
                  ${memberinfo.user_domain == 'daum.net' ? 'selected' : ''}>다음</option>
               <option value="nate.com"
                  ${memberinfo.user_domain == 'nate.com' ? 'selected' : ''}>네이트</option>
               <option value="gmail.com"
                  ${memberinfo.user_domain == 'gmail.com' ? 'selected' : ''}>구글</option>
            </select><br> <br> <span>지역</span><br> <select
               id="user_address1" name="user_address1" class="box3">
               <option value="">광역시선택</option>
               <option value="서울시"
                  ${memberinfo.user_address1 == '서울시' ? 'selected' : ''}>서울시</option>
            </select> <select id="user_address2" name="user_address2" class="box3">
               <option value="">지역선택</option>
               <option value="강남구"
                  ${memberinfo.user_address2 == '강남구' ? 'selected' : ''}>강남구</option>
               <option value="강동구"
                  ${memberinfo.user_address2 == '강동구' ? 'selected' : ''}>강동구</option>
               <option value="강북구"
                  ${memberinfo.user_address2 == '강북구' ? 'selected' : ''}>강북구</option>
               <option value="강서구"
                  ${memberinfo.user_address2 == '강서구' ? 'selected' : ''}>강서구</option>
               <option value="관악구"
                  ${memberinfo.user_address2 == '관악구' ? 'selected' : ''}>관악구</option>
               <option value="광진구"
                  ${memberinfo.user_address2 == '광진구' ? 'selected' : ''}>광진구</option>
               <option value="구로구"
                  ${memberinfo.user_address2 == '구로구' ? 'selected' : ''}>구로구</option>
               <option value="금천구"
                  ${memberinfo.user_address2 == '금천구' ? 'selected' : ''}>금천구</option>
               <option value="노원구"
                  ${memberinfo.user_address2 == '노원구' ? 'selected' : ''}>노원구</option>
               <option value="도봉구"
                  ${memberinfo.user_address2 == '도봉구' ? 'selected' : ''}>도봉구</option>
               <option value="동대문구"
                  ${memberinfo.user_address2 == '동대문구' ? 'selected' : ''}>동대문구</option>
               <option value="동작구"
                  ${memberinfo.user_address2 == '동작구' ? 'selected' : ''}>동작구</option>
               <option value="마포구"
                  ${memberinfo.user_address2 == '마포구' ? 'selected' : ''}>마포구</option>
               <option value="서대문구"
                  ${memberinfo.user_address2 == '서대문구' ? 'selected' : ''}>서대문구</option>
               <option value="서초구"
                  ${memberinfo.user_address2 == '서초구' ? 'selected' : ''}>서초구</option>
               <option value="성동구"
                  ${memberinfo.user_address2 == '성동구' ? 'selected' : ''}>성동구</option>
               <option value="성북구"
                  ${memberinfo.user_address2 == '성북구' ? 'selected' : ''}>성북구</option>
               <option value="송파구"
                  ${memberinfo.user_address2 == '송파구' ? 'selected' : ''}>송파구</option>
               <option value="양천구"
                  ${memberinfo.user_address2 == '양천구' ? 'selected' : ''}>양천구</option>
               <option value="영등포구"
                  ${memberinfo.user_address2 == '영등포구' ? 'selected' : ''}>영등포구</option>
               <option value="용산구"
                  ${memberinfo.user_address2 == '용산구' ? 'selected' : ''}>용산구</option>
               <option value="은평구"
                  ${memberinfo.user_address2 == '은평구' ? 'selected' : ''}>은평구</option>
               <option value="종로구"
                  ${memberinfo.user_address2 == '종로구' ? 'selected' : ''}>종로구</option>
               <option value="중구"
                  ${memberinfo.user_address2 == '중구' ? 'selected' : ''}>중구</option>
               <option value="중랑구"
                  ${memberinfo.user_address2 == '중랑구' ? 'selected' : ''}>중랑구</option>
            </select> <br> <br> 
            <input type="submit" id="submit_button" value="회원정보 수정" class="memberok" >
         </div>
      </form>
   </div>
</body>
</html>

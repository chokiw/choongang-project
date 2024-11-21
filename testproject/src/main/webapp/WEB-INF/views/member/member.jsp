<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="/js/member.js"></script>
    <link href="/css/member.css" rel="stylesheet">
    <title>회원가입</title>

</head>

<body style="background-color: #D9D9D9;">
    <div class="member">
        <div class="logo">RUNAWAY</div>
        <div class="title">회원 가입</div><br><br><br>
        <form name="memberForm" method="post" action="/membership" enctype="multipart/form-data" onsubmit="return check()">
            <div class="form">

                <span>아이디</span><br>
                <input type="text" id="user_id" name="user_id" class="box">&nbsp;&nbsp;
                <button type="button" id="dup_id" disabled onclick="id_check()">중복확인</button><br>
                <div id="idcheck" class="alertmsg"></div> <br>

                <span>비밀번호</span><br>
                <input type="password" id="user_passwd" name="user_passwd" class="box"><br>
                <div id="pwcheck" class="alertmsg"></div><br>


                <!-- 프로필이미지 삽입 -->
            
                <div class="imgform">
                    <span>프로필 사진</span>
                    <div class="profile_img"><img src="https://cdn.pixabay.com/photo/2021/07/02/04/48/user-6380868_1280.png" id="user_photo"  style="width: 150px; height: 150px; border-radius: 50%;"></div>
                    <input type="file" name ="file1" accept="image/*" onchange="loadFile(this)" style="margin-top: 10px;"><br>
                    <button type="button" id="resetimg" style="margin-top: 10px;">기본이미지로 변경</button>
                </div>
           



                <span>이름</span><br>
                <input type="text" id="user_name" name="user_name" class="box"><br><br>

                <span>닉네임</span><br>
                <input type="text" id="user_nickname" name="user_nickname" class="box">&nbsp;
                <button type="button" id="dup_nick" disabled onclick="nickname_check()">중복확인</button><br>
                <div id="nickcheck" class="alertmsg"></div><br>

                <span>주민등록번호</span><br>
                <input type="text" size="6" maxlength="6" id="user_jumin1" name="user_jumin1" class="box1">&nbsp; -
                &nbsp;<input type="password" size="7" maxlength="7" id="user_jumin2" name="user_jumin2"
                    class="box1"><br>
                <div id="jumincheck" class="alertmsg"></div><br>

                <span>성별</span><br>
                <input type="radio" name="user_gender" id="male" value="남자">남자
                <input type="radio" name="user_gender" id="female" value="여자">여자<br><br>

                <span>핸드폰 번호</span><br>
                <select name="user_phone1" id="user_phone1" class="box2">
                    <option value="">번호선택</option>
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                </select>-
                <input type="text" size="4" maxlength="4" name="user_phone2" id="user_phone2" class="box2">-
                <input type="text" size="4" maxlength="4" name="user_phone3" id="user_phone3" class="box2"><br>
                <div id="phonecheck" class="alertmsg"></div><br>

                <span>이메일</span><br>
                <input type="text" id="user_emailid" name="user_emailid" class="box1">&nbsp; @ &nbsp;<input type="text"
                    id="user_domain" name="user_domain" class="box1" readonly>
                <select id="email" class="email" name="email" onchange="domain_list()">
                    <option value="">이메일 선택</option>
                    <option value="0">직접입력</option>
                    <option value="naver.com">네이버</option>
                    <option value="daum.net">다음</option>
                    <option value="nate.com">네이트</option>
                    <option value="gmail.com">구글</option>
                </select><br><br>

                <span>지역</span><br>
                <select id="user_address1" name="user_address1" class="box3">
                    <option value="">광역시선택</option>
                    <option value="서울시">서울시</option>
                </select>
                <select id="user_address2" name="user_address2" class="box3">
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
                </select> <br><br>

                <input type="submit" id="submit_button" disabled value="회원가입" class="memberok"> 

            </div>
        </form>
    </div>
</body>

</html>
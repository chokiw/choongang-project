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
    <title>회원가입</title>
    <style>
        .member {
            width: 600px;
            height: 900px;
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            position: relative;
        }

        .logo {
            font-family: "Bangers", system-ui;
            font-style: normal;
            color: #cf3e00;
            font-size: 60px;
            font-weight: 800;
            text-align: center;
        }

        .title {
            font-size: 20px;

            font-family: "Gothic A1", sans-serif;
            font-weight: bold;
            text-align: center;
        }

        .form {
            width: 580px;
            margin-left: 40px;
            margin-right: auto;
        }

        .imgform {
            position: absolute;
            top: 160px;
            right : 80px;
            width: 200px;
            height: 250px;
            border-style: solid;
        }

        span {
            font-size: 18px;
            font-family: "Gothic A1", sans-serif;
            font-weight: 550;
        }
    </style>
<script>
$(document).ready(function(){
//주민번호 뒷자리로 포커스 이동
	$("#user_jumin1").keyup(function(){
		if($("#user_jumin1").val().length == 6)
		$("#user_jumin2").focus();
	});
});

function validate_userid(memid){
	  var pattern= new RegExp(/^[A-Za-z0-9_]+$/);  //영문 소문자,숫자 ,_가능,정규표현식
	  
	  return pattern.test(memid);
};

function id_check(){
	$("#idcheck").hide();//idcheck span 아이디 영역을 숨긴다.
	var memid=$("#user_id").val();
	//1.입력글자 길이 체크
	if($.trim($("#user_id").val()).length < 4){
		var newtext='<font color="red">아이디는 4자 이상이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#user_id").val("").focus();
		return false;
	};
	if($.trim($("#user_id").val()).length >12){
		var newtext='<font color="red">아이디는 12자 이하이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);
		$("#user_id").val("").focus();
		return false;
	};
	//입력아이디 유효성 검사
	if(!(validate_userid(memid))){
		var newtext='<font color="red">아이디는 영문소문자,숫자,_ 조합만 가능합니다.</font>';
		$("#idcheck").text('');		
		$("#idcheck").show();		
		$("#idcheck").append(newtext);
		$("#user_id").val("").focus();
		return false;
	};


//아이디 중복확인
// $.ajax({
//     type:"POST",
//     url:"member_idcheck.do",
//     data: {"memid":memid},        
//     success: function (data) { 
////        	alert("return success="+data);
//   	  if(data==1){			//중복 ID
//   		var newtext='<font color="red">중복 아이디입니다.</font>';
//   			$("#idcheck").text('');
//     		$("#idcheck").show();
//     		$("#idcheck").append(newtext);
//       		$("#join_id").val('').focus();
//       		return false;
     
//   	  }else{				//사용 가능한 ID
//   		var newtext='<font color="blue">사용가능한 아이디입니다.</font>';
//   		$("#idcheck").text('');
//   		$("#idcheck").show();
//   		$("#idcheck").append(newtext);
//   		$("#join_pwd1").focus();
//   	  }  	    	  
//     }
//     ,
// 	  error:function(e){
// 		  alert("data error"+e);
// 	  }
//   });//$.ajax	
};

function domain_list() {
	var num=memberForm.email.selectedIndex;  //selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
	
	if ( num == -1 ) {					//num==-1은 해당 리스트목록이 없다
		return true;
	}
	if(memberForm.email.value=="0"){  		// 직접입력
		memberForm.user_domain.value="";
		memberForm.user_domain.readOnly=false;
		memberForm.user_domain.focus();
	}else {								//리스트목록을 선택했을때	 
		memberForm.user_domain.value=memberForm.email.options[num].value;
		memberForm.user_domain.readOnly=true;
	 }
}

function check(){
	 if($.trim($("#user_id").val())==""){
		 alert("회원아이디를 입력하세요!");
		 $("#user_id").val("").focus();
		 return false;
	 }
	 if($.trim($("#user_passwd").val())==""){
		 alert("회원비번을 입력하세요!");
		 $("#user_passwd").val("").focus();
		 return false;
	 }
//	 if($.trim($("#join_pwd2").val())==""){
//		 alert("회원비번확인을 입력하세요!");
//		 $("#join_pwd2").val("").focus();
//		 return false;
//	 }
//	 if($.trim($("#join_pwd1").val()) != $.trim($("#join_pwd2").val())){
//		 alert("비번이 다릅니다!");
//		 $("#join_pwd1").val("");
//		 $("#join_pwd2").val("");
//		 $("#join_pwd1").focus();
//		 return false;
//	 }
	 if($.trim($("#user_name").val())==""){
		 alert("회원이름을 입력하세요!");
		 $("#user_name").val("").focus();
		 return false;
	 }
	 
	 if($.trim($("#user_nickname").val())==""){
		 alert("닉네임을 입력하세요!");
		 $("#user_nickname").val("").focus();
		 return false;
	 }
	 
	 if($.trim($("#user_jumin1").val())==""){
		 alert("주민번호 앞자리를 입력해주세요!");
		 $("#user_jumin1").val("").focus();
		 return false;
	 }
	 if($.trim($("#user_jumin2").val())==""){
		 alert("주민번호 뒷자리를 입력해주세요!");
		 $("#user_jumin2").val("").focus();
		 return false;
	 }
	 
	 if($("#male").is(":checked")==false &&
		$("#female").is(":checked")==false){
		alert("남.여 중에서 1개를 선택하세요");
		return false;
	 }
	 if($.trim($("#user_phone1").val())==""){
		 alert("전화번호를 입력하세요!");
		 return false;
	 }
	 
	 if($.trim($("#user_phone2").val())==""){
		 alert("전화번호를 입력하세요!");
		 $("#user_phone2").val("").focus();
		 return false;
	 }
	 if($.trim($("#user_phone3").val())==""){
		 alert("전화번호를 입력하세요!");
		 $("#user_phone3").val("").focus();
		 return false;
	 }
	 
	 if($.trim($("#user_emailid").val())==""){
		 alert("메일 아이디를 입력하세요!");
		 $("#user_emailid").val("").focus();
		 return false;
	 }
	 if($.trim($("#user_domain").val())==""){
		 alert("메일 주소를 입력하세요!");
		 $("#user_domain").val("").focus();
		 return false;
	 }
	 
	 if($.trim($("#user_address1").val())==""){
		 alert("광역시를 선택하세요!");
		 return false;
	 }
	 if($.trim($("#user_address2").val())==""){
		 alert("지역을 선택하세요!");
		 return false;
	 }
}
</script>    


</head>

<body style="background-color: #D9D9D9;">
    <div class="member">
        <div class="logo">RUNAWAY</div>
        <div class="title">회원 가입</div><br><br><br>
        <form name="memberForm" method="post" action="/membership" onsubmit="return check()">
            <div class="form">

                <span>아이디</span><br>
                <input type="text" id="user_id" name="user_id"><br><br>
				<div id="idcheck"></div><br>
				
                <span>비밀번호</span><br>
                <input type="password" id="user_passwd" name="user_passwd"><br><br>

                <div class="imgform">
                    <input type="hidden" id="user_photo" name="user_photo" value="photo">
                    <span>프로필 사진</span>
                </div>

                <span>이름</span><br>
                <input type="text" id="user_name" name="user_name"><br><br>

                <span>닉네임</span><br>
                <input type="text"id="user_nickname" name="user_nickname"><br><br>

                <span>주민등록번호</span><br>
                <input type="text" size="6" maxlength="6" id="user_jumin1" name="user_jumin1">&nbsp; - &nbsp;<input type="text" size="7" maxlength="7"id="user_jumin2" name="user_jumin2"><br><br>

                <span>성별</span><br>
                <input type="radio" name="user_gender" id="male" value="남자">남자
                <input type="radio" name="user_gender" id="female" value="여자">여자<br><br>

                <span>핸드폰 번호</span><br>
                <select name="user_phone1" id="user_phone1">
                    <option value="">번호선택</option>
                    <option value="010">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                </select>-
                <input type="text" size="4" maxlength="4" name="user_phone2" id="user_phone2">-
                <input type="text" size="4" maxlength="4" name="user_phone3" id="user_phone3"><br><br>

                <span>이메일</span><br>
                <input type="text" id="user_emailid" name="user_emailid">&nbsp; @ &nbsp;<input type="text" id="user_domain" name="user_domain" readonly>
                <select id="email" class="email" name="email" onchange="domain_list()">
                    <option value="">이메일 선택</option>
                    <option value="0">직접입력</option>
                    <option value="naver.com">네이버</option>
                    <option value="daum.net">다음</option>
                    <option value="nate.com">네이트</option>
                    <option value="gmail.com">구글</option>
                </select><br><br>

                <span>지역</span><br>
                <select id="user_address1" name="user_address1">
                    <option value="">광역시선택</option>
                    <option value="서울시">서울시</option>
                </select>
                <select id="user_address2" name="user_address2">
                    <option value="">지역선택</option>
                    <option value="강남구">강남구</option>
                    <option value="강남구">강동구</option>
                    <option value="강남구">강북구</option>
                    <option value="강남구">강서구</option>
                    <option value="강남구">관악구</option>
                    <option value="강남구">광진구</option>
                    <option value="강남구">구로구</option>
                    <option value="강남구">금천구</option>
                    <option value="강남구">노원구</option>
                    <option value="강남구">도봉구</option>
                    <option value="강남구">동대문구</option>
                    <option value="강남구">동작구</option>
                    <option value="강남구">마포구</option>
                    <option value="강남구">서대문구</option>
                    <option value="강남구">서초구</option>
                    <option value="강남구">성동구</option>
                    <option value="강남구">성북구</option>
                    <option value="강남구">송파구</option>
                    <option value="강남구">양천구</option>
                    <option value="강남구">영등포구</option>
                    <option value="강남구">용산구</option>
                    <option value="강남구">은평구</option>
                    <option value="강남구">종로구</option>
                    <option value="강남구">중구</option>
                    <option value="강남구">중랑구</option>
                </select> <br><br>

                <input type="submit" value="회원가입"> &nbsp;&nbsp;&nbsp;

            </div>
        </form>
    </div>
</body>

</html>
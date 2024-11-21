/**
 * 
 */
function validate_phone(phone) {
	var pattern = new RegExp(/^[0-9]+$/);

	return pattern.test(phone);
};


//넥네임 중복검사
function nickname_check() {
	var memnickname = $("#user_nickname").val();
	$.ajax({
		type: "POST",
		url: "/member_nicknamecheck",
		data: { "memnickname": memnickname },
		success: function(data) {
			if (data == 1) {			//중복 ID
				var newtext = '<font color="red">중복 닉네임입니다.</font>';
				$("#nickcheck").text('');
				$("#nickcheck").show();
				$("#nickcheck").append(newtext);
				$("#user_nickname").val('').focus();
				return false;

			} else {				//사용 가능한 ID
				var newtext = '<font color="blue">사용가능한 닉네임입니다.</font>';
				$("#nickcheck").text('');
				$("#nickcheck").show();
				$("#nickcheck").append(newtext);
				$("#user_jumin1").focus();
				nickname_flag = 1;//중복검사 진행확인
			}
		}
		,
		error: function(e) {
			alert("data error" + e);
		}
	});
};



// 잘못 입력하면 하단에 빨간색으로 경고 메세지를 준다.
$(document).ready(function() {
	//기본이미지로 변경
	$("#resetimg").click(function() {
			// .profile_img 내부에 기존 이미지가 있다면 제거하고 기본 이미지 추가
			let profileImgDiv = $('.profile_img');
			profileImgDiv.empty(); // 기존 이미지 제거
			let defaultImage = $('<img>').attr('src', 'https://cdn.pixabay.com/photo/2021/07/02/04/48/user-6380868_1280.png');
			profileImgDiv.append(defaultImage); // 기본 이미지 삽입
			$("#basicPhoto").val("basic");
			$("input[type='file']").val('');
	});


	//닉네임
	$("#user_nickname").keyup(function() {
		var userNick = $.trim($("#user_nickname").val());

		if (userNick.length < 2 || userNick.length > 12) {
			var newText = '<font color="red">닉네임은 2자 이상 12자 이하 이어야 합니다.</font>';
			$("#nickcheck").html(newText).show();
			$("#submit_button").attr("disabled", true);
			$("#dup_nick").attr("disabled", true);
		} else {
			$("#nickcheck").hide();
			$("#submit_button").attr("disabled", false);
			$("#dup_nick").attr("disabled", false);
		}

		nickname_flag = 0;//value가 바뀌면 다시 중복검사를 진행하려하기 위해서 flag를 0값으로 설정
	});




	//핸드폰 번호
	$("#user_phone2, #user_phone3").keyup(function() {
		var phone2 = $.trim($("#user_phone2").val());
		var phone3 = $.trim($("#user_phone3").val());

		if (!validate_phone(phone2) || !validate_phone(phone3)) {
			var newText = '<font color="red">숫자만 입력하세요</font>';
			$("#phonecheck").html(newText).show();
			$("#submit_button").attr("disabled", true);
		} else {
			$("#phonecheck").hide();
			$("#submit_button").attr("disabled", false);
		}

	});

});



//이미지 삽입
function loadFile(input) {
    let file = input.files[0]; // 선택파일 가져오기

    if (file) {
        let newImage = document.createElement("img"); // 새 이미지 태그 생성
        newImage.src = URL.createObjectURL(file); // 이미지 소스 설정

        // profile_img div에 기존 이미지가 있다면 제거 후 새로운 이미지 삽입
        let profileImgDiv = document.querySelector('.profile_img');
        profileImgDiv.innerHTML = ''; // 기존 이미지를 제거
        profileImgDiv.appendChild(newImage); // 새로운 이미지 삽입
    }
}




function check() {
	
	if ($.trim($("#user_name").val()) == "") {
		alert("회원이름을 입력하세요!");
		$("#user_name").val("").focus();
		return false;
	}

	if ($.trim($("#user_nickname").val()) == "") {
		alert("닉네임을 입력하세요!");
		$("#user_nickname").val("").focus();
		return false;
	}
	//flag에 따른 중복검사 여부 체크
	if (nickname_flag == 0) {
		alert("닉네임중복 체크를 해주세요");
		$("#user_nickname").focus();
		return false;
	}

	if ($.trim($("#user_phone1").val()) == "") {
		alert("전화번호를 입력하세요!");
		return false;
	}

	if ($.trim($("#user_phone2").val()) == "") {
		alert("전화번호를 입력하세요!");
		$("#user_phone2").val("").focus();
		return false;
	}
	if ($.trim($("#user_phone3").val()) == "") {
		alert("전화번호를 입력하세요!");
		$("#user_phone3").val("").focus();
		return false;
	}

	if ($.trim($("#user_emailid").val()) == "") {
		alert("메일 아이디를 입력하세요!");
		$("#user_emailid").val("").focus();
		return false;
	}
	if ($.trim($("#user_domain").val()) == "") {
		alert("메일 주소를 입력하세요!");
		$("#user_domain").val("").focus();
		return false;
	}

	if ($.trim($("#user_address1").val()) == "") {
		alert("광역시를 선택하세요!");
		return false;
	}
	if ($.trim($("#user_address2").val()) == "") {
		alert("지역을 선택하세요!");
		return false;
	}

	// 주민번호 유효성 검사
	let jumin1 = $.trim($("#user_jumin1").val());
	let jumin2 = $.trim($("#user_jumin2").val());
	let jumin = jumin1 + jumin2;
	jumin = jumin.split('');
	let checkchar = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5];

	for (let i = 0; i < jumin.length - 1; i++) {
		jumin[i] = jumin[i] * checkchar[i];
	}

	let juminlast = jumin[jumin.length - 1];

	let sum = 0;
	for (let i = 0; i < jumin.length - 1; i++) {
		sum += jumin[i];
	}

	sum = sum % 11;

	sum = 11 - sum;

	if (sum > 9) {
		sum = sum % 10;
	}

	if (sum != juminlast && juminlast != undefined) {
		alert("유효하지 않는 주민번호 입니다.");
		return false;
	}


}
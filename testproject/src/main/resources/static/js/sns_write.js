
    function check(){

    if ($.trim($("#sns_subject").val()) == "") {
        alert("제목을 입력해주세요!");
        $("#sns_subject").val("").focus();
        return false;
    }

    if ($.trim($("#sns_address1").val()) == "") {
        alert("광역시를 선택해주세요!");
        $("#sns_address1").val("").focus();
        return false;
    }

    if ($.trim($("#sns_address2").val()) == "") {
        alert("지역을 선택해주세요!");
        $("#sns_address2").val("").focus();
        return false;
    }

    if ($.trim($("#sns_content").val()) == "") {
        alert("내용을 입력해주세요!");
        $("#sns_content").val("").focus();
        return false;
    }

}

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
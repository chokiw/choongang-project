// 모집인원을 두자리까지 입력 가능하게 한다.
function numberMaxLength(e) {

	if (e.value.length > e.maxLength) {

		e.value = e.value.slice(0, e.maxLength);
	}

}
function check() {
	if ($.trim($("#recruit_subject").val()) == "") {
		alert("제목을 입력하세요!");
		$("#recruit_subject").val("").focus();
		return false;
	}

	if ($.trim($("#recruit_address1").val()) == "") {
		alert("광역시를 선택하세요!");
		$("#recruit_address1").val("").focus();
		return false;
	}
	if ($.trim($("#recruit_address2").val()) == "") {
		alert("지역을 선택하세요!");
		$("#recruit_address2").val("").focus();
		return false;
	}
	if ($.trim($("#recruit_recruitnum").val()) == "") {
		alert("모집인원을 입력하세요!");
		$("#recruit_recruitnum").val("").focus();
		return false;
	} drawingFlag

	if (drawingFlag == true) {
		alert("지도에 우클릭하여 경로설정을 마무리 해주세요");
		return false;
	}

	if (clickLine == null) {
		alert("지도에 경로설정을 해주세요");
		return false;
	}

	var path = clickLine.getPath();
	var arr = [];

	for (var i = 0; i < path.length; i++) {
		arr.push(path[i].getLat());
		arr.push(path[i].getLng());
	}

	$("#coords").val(arr);

	if ($.trim($("#recruit_d_day").val()) == "") {
		alert("지정날짜를 입력하세요!");
		$("#recruit_d_day").val("").focus();
		return false;
	}
		
	var currentday = new Date();
	var recruitDday = new Date($.trim($("#recruit_d_day").val()));
	if ( recruitDday < currentday){
		alert("과거입니다.");
		$("#recruit_d_day").val("").focus();
		return false;
	}
	

	if ($.trim($("#recruit_content").val()) == "") {
		alert("내용을 입력하세요!");
		$("#recruit_content").val("").focus();
		return false;
	}

}


/**
 * 
 */
$(document).ready(function() {
	//주민번호 뒷자리로 포커스 이동
	$("#user_jumin1").keyup(function() {
		if ($("#user_jumin1").val().length == 6)
			$("#user_jumin2").focus();
	});

	function validate_jumin(jumin) {
		var pattern = new RegExp(/^[0-9]+$/);

		return pattern.test(jumin);
	};

	function validate_phone(phone) {
		var pattern = new RegExp(/^[0-9]+$/);

		return pattern.test(phone);
	};



	$("#user_jumin1, #user_jumin2").keyup(function() {
		var jumin1 = $.trim($("#user_jumin1").val());
		var jumin2 = $.trim($("#user_jumin2").val());

		if (jumin1.length < 6) {
			var newText = '<font color="red">주민번호 앞자리는 6자리입니다.</font>';
			$("#jumincheck").html(newText).show();
			$("#id_button").attr("disabled", true);
		}
		else if (jumin2.length < 7) {
			var newText = '<font color="red">주민번호 뒷자리는 7자리입니다.</font>';
			$("#jumincheck").html(newText).show();
			$("#id_button").attr("disabled", true);
		}
		else if (!validate_jumin(jumin1) || !validate_jumin(jumin2)) {
			var newText = '<font color="red">숫자만 입력하세요</font>';
			$("#jumincheck").html(newText).show();
			$("#id_button").attr("disabled", true);
		} else {
			$("#jumincheck").hide();
			$("#id_button").attr("disabled", false);
		}
	});
});
/**
 * 
 */
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
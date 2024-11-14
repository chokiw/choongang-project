// 모집인원을 두자리까지 입력 가능하게 한다.
       function numberMaxLength(e) {

           if (e.value.length > e.maxLength) {

               e.value = e.value.slice(0, e.maxLength);
           }

       }


   


       //유효성검사
       function check() {

           if ($.trim($("#recruit_subject").val()) == "") {
               alert("제목을 입력해주세요!");
               $("#recruit_subject").val("").focus();
               return false;
           }

           if ($.trim($("#recruit_address1").val()) == "") {
               alert("광역시를 선택해주세요!");
               $("#recruit_address1").val("").focus();
               return false;
           }

           if ($.trim($("#recruit_address2").val()) == "") {
               alert("지역을 선택해주세요!");
               $("#recruit_address2").val("").focus();
               return false;
           }

           if ($.trim($("#recruit_recruitnum").val()) == "") {
               alert("모집인원수를 입력해주세요!");
               $("#recruit_recruitnum").val("").focus();
               return false;
           }

           if ($.trim($("#recruit_content").val()) == "") {
               alert("내용을 입력해주세요!");
               $("#recruit_content").val("").focus();
               return false;
           }

       }
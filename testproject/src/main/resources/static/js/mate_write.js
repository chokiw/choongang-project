// 모집인원을 두자리까지 입력 가능하게 한다.
       function numberMaxLength(e) {

           if (e.value.length > e.maxLength) {

               e.value = e.value.slice(0, e.maxLength);
           }

       }


       // 파일선택을 누르면 사진이 올라간다.
       function loadFile(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   var imgElement = document.querySelector('.maincontent img'); // maincontent 클래스 내의 img 요소 선택
                   imgElement.src = e.target.result; // 선택된 이미지로 src 변경
                   imgElement.style.display = 'block'; // 이미지를 보이게 함

                   document.querySelector('.action-button.delete').style.display = 'inline-block';
               };

               reader.readAsDataURL(input.files[0]); // 선택된 파일을 데이터 URL로 읽기
           }
       }

       // 파일 삭제를 누르면 사진이 삭제된다.
       function deleteFile() {
           var imgElement = document.querySelector('.maincontent img');
           imgElement.src = '';
           imgElement.style.display = 'none';

           // 파일 입력 초기화
           document.getElementById('fileInput').value = '';

           // 삭제 버튼 숨기기
           document.querySelector('.action-button.delete').style.display = 'none';
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
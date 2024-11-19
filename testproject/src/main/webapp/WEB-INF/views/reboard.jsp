<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>Document</title>
    <style>
        .reboard {
            border-collapse: collapse;
            margin-left: auto;
            margin-right: auto;
            width: 100%;
            max-width: 1200px;
            margin-top: 50px;
            table-layout: fixed;
        }

        .reboard th,
        .reboard td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        .reboardwrite {
            border-collapse: collapse;
            margin-left: auto;
            margin-right: auto;
            width: 100%;
            max-width: 1200px;
            margin-top: 50px;
            table-layout: fixed;
        }

        .reboardwrite:th,
        .reboardrite:td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        .reboard_col1 {
            width: 45px;
        }

        .re_image {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin: 0 auto;
        }

        .re_writer {
            font-size: 14px;
            font-family: 'Gothic A1', sans-serif;
            font-weight: 600;
            color: black;
            text-decoration: none;
        }

        .re_writer:visited {
            color: black;
        }

        .re_content {
            font-size: 14px;
            font-family: 'Gothic A1', sans-serif;
        }

        .re_date {
            font-size: 12px;
            font-family: 'Gothic A1', sans-serif;
            color: #b4b4b4;
        }

        .block {
            text-align: right;
            display: inline;
            float: right;
        }

        .re_delete {
            text-decoration: none;
            color: #b4b4b4;
            font-size: 12px;
        }

        .re_delete:hover{
            text-decoration: underline;
            cursor: pointer;
        }

        .re_re_write{
            text-decoration: none;
            color: #b4b4b4;
            font-size: 12px;
        }

        .re_re_write:hover{
            text-decoration: underline;
            cursor: pointer;
            
        }

       

        .re_delete:hover{
            text-decoration: underline;
        }

        /* 댓글 작성폼 css */

        .re_writebox {
            width: 100%;
            border-color: #b4b4b4;
            border-width: 2px;
            border-style: solid;
            height: 160px;
            opacity: 80%;
            border-radius: 5px;
            position: relative;
        }

        .nickname {
            margin-left: 2%;
            margin-top: 5px;
            font-weight: 600;
        }

        .re_write {
            width: 95%;
            margin-left: 2%;
            margin-right: 2%;
            resize: none;
            border-style: none;
            margin-top: 1%;
            height: 80px;
            font-size: 14px;
            font-family: 'Gothic A1', sans-serif;
        }

        .buttonbox {
            position: absolute;
            bottom: 4px;
            right: 4px;
            margin-top: 1%;
        }

        .action-button {
            padding: 5px 20px;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.1s;
            color: white;
            height: 30px;
        }

        .action-button:hover {
            transform: scale(1.05);
        }

        .action-button:active {
            transform: scale(0.95);
        }

        .save {
            background-color: #4CAF50;
            color: white;
        }

        .save:disabled {
            background-color: #cccccc;
            color: #666666;
            cursor: not-allowed;
        }



        @media screen and (max-width: 1200px) {
            .reboard, .reboardwrite {
                max-width: 90%;
            }
        }

        @media screen and (max-width: 768px) {
            .reboard, .reboardwrite {
                max-width: 95%;
            }

            .re_writer {
                font-size: 13px;
            }

            .re_content {
                font-size: 13px;
            }

            .re_date {
                font-size: 11px;
            }

            .re_delete {
                font-size: 11px;
            }
        }

        @media screen and (max-width: 425px) {
            .reboard, .reboardwrite {
                max-width: 100%;
            }

            .col1 {
                width: 35px;
            }

            .re_image {
                width: 30px;
                height: 30px;
            }

            .re_writer {
                font-size: 12px;
            }

            .re_content {
                font-size: 12px;
            }

            .re_date {
                font-size: 10px;
            }

            .re_delete {
                font-size: 10px;
            }
        }
    </style>

    <script>
        $(document).ready(function () {

            // textarea border 제거
            $(".re_write").focus(function () {
                $(this).css('border', 'none');
                $(this).css('outline', 'none');

            });


            // 댓글 byte제한 , 입력값이 없거나 제한 byte를 넘었을때 등록 버튼 비활성화
            var $textarea = $("#sns_r_content");
            var $submitButton = $("#writereply");
            var limitByte = 2000;
            var totalByte = 0;

            function updateButtonState() {
                var isEmpty = $textarea.val().trim().length === 0;
                $submitButton.prop('disabled', isEmpty);
            }

            function fn_chk_byte(obj) {
                totalByte = 0;
                var message = $(obj).val();

                for (var i = 0; i < message.length; i++) {
                    var currentByte = message.charCodeAt(i);                 
                    if (currentByte > 128) {
                        totalByte += 2;
                    } else {
                        totalByte++;
                    }
                }

                $("#messagebyte").text(totalByte);

                if (totalByte > limitByte) {
                    alert(limitByte + "Byte 까지 입력가능합니다.");               

                    $submitButton.prop('disabled', totalByte > limitByte);

                    return false;
                                  
                }

                updateButtonState();
            }

            $textarea.on('input', function () {
                fn_chk_byte(this);
            });

            // 초기 상태 설정
            updateButtonState();





        });

        function re_re_write(){
            location.href="asd";
            
        }




    </script>


</head>

<body>
    <table class="reboard">
        <colgroup>
            <col class="reboard_col1">
            <col class="reboard_col2">
        </colgroup>

        <tr>
            <td><img class="re_image" src="mancity.png" alt="User Avatar"></td>
            <td>
                <a href="asd" class="re_writer">강북구 불주먹</a><br>
                <span class="re_content">정보 감사합니다</span><br>
                <span class="re_date">2024-11-01 17:06</span>
                <div class="block">
                    <a class="re_delete" href="#">수정</a>&nbsp;&nbsp;
                    <a class="re_delete" href="#">삭제</a>
                </div>
            </td>
        </tr>
        <tr>
            <td><img class="re_image" src="Penguins.jpg" alt="User Avatar"></td>
            <td>
                <a href="asd" class="re_writer">강서구 마라토너</a><br>
                <span class="re_content">nice~</span><br>
                <span class="re_date">2024-11-01 17:24</span>&nbsp;<span onclick="re_re_write()" class="re_re_write">답글쓰기</span>
                <div class="block">
                    <span class="re_delete">수정</span>&nbsp;&nbsp;
                    <span class="re_delete">삭제</span>
                </div>
            </td>
        </tr>



    </table>

    <form method="post" action="replywrite">
        <table class="reboardwrite">
            <td colspan="2">
                <div class="re_writebox">
                    <span class="nickname" id="user_id" name="user_id">user_nickname</span>
                    <textarea rows="4" cols="50" class="re_write" id="sns_r_content" name="sns_r_content"
                        placeholder="댓글을 남겨보세요"></textarea>

                    <div style="position: absolute; right: 1%; top: 0; color: #b4b4b4; font-size: 14px;">
                        <span id="messagebyte">0 </span><span>/ 2000Byte</span>
                    </div>
                    <div class="buttonbox">
                        <input type="submit" id="writereply" class="action-button save" disabled value="등록"></button>
                    </div>
                </div>
            </td>

        </table>
    </form>


</body>

</html>
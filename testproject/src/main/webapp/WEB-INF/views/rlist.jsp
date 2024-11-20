<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<!--     <script src="https://kit.fontawesome.com/5e485453d8.js" crossorigin="anonymous"></script> -->
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
        .re td {
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

        .re_delete1,.re_delete2,.re_delete3 {
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
        .re_re_writebox {
            width: 100%;
            border-color: #b4b4b4;
            border-width: 2px;
            border-style: solid;
            height: 140px;
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
        .re_write:focus {
        	border: none;
        	outline: none;
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
        .cancle {
			background-color: #f44336;
            color: white;
            margin-left: 10px; 
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
        .reply-indent td {
            padding-left: 40px;
            /* 대댓글 들여쓰기 */
        }
    </style>

    <script>
	
	function re_re_write2(rno){
		$('.re_'+rno).toggle();
	}
	
	function reInsert(rno){
		alert(rno);
		var user_id = $('.user_id').val();			// 세션id
		var recruit_no = $('.recruit_no').val();	// 글번호		
		
		alert(user_id);
		alert(recruit_no);
		
		if($('#txt_'+rno).val() == ''){
			alert('댓글 입력후에 클릭하시오');
			$('#txt_'+rno).focus();				
			return false;
		}else{
			var recruit_r_content = $('#txt_'+rno).val();
		}
		var formData = "user_id="+user_id+"&recruit_r_no="+rno+'&recruit_r_content='+recruit_r_content
		+"&recruit_no="+recruit_no;		
		$.post('${path}/sInsert', formData, function(data){
			$('#rlist').html(data);
		})
	}
	
	function re_update(rno){
		var txt = $.trim($('#rtxt_'+rno).text());
		$('#td_'+rno).html("<div class='re_writebox'><textarea rows='3' cols='30' class='re_write' name='sns_r_content' id='tt_"+rno+"'>"+txt+"</textarea>"+
				"<div style='position: absolute; right: 1%; top: 0; color: #b4b4b4; font-size: 14px;'>"+
				"<span id='messagebyte'>0 </span><span>/ 2000Byte</span></div>"+
				"<div class='buttonbox'>"+
			
				"<input type='button' id='writereply' class='action-button save' value='수정' onclick='javascript:reUpdate("+rno+")'></button><input type='button' id='writereply' class='action-button cancle' value='취소' onclick='lst()'></button></div></div>");					
	}
	
	function reUpdate(rno){
		var replytext = $('#tt_'+rno).val();
		var formData = "recruit_r_no="+rno+'&recruit_r_content='+replytext+"&recruit_no=${board.recruit_no}";
		$.post('${path}/repUpdate',formData, function(data) { // 댓글 수정 요청(콜백함수)
			$('#rlist').html(data);
		});
	}
	
	function lst() {
		$('#rlist').load('/rlist/num/${board.recruit_no}');
	}	
	
	function re_delete(recruit_r_no, recruit_no){
		if(!confirm('삭제하시겠습니까?')){
			return false;
		   }
		var formData="recruit_r_no="+recruit_r_no+"&recruit_no="+recruit_no;
			$.post('${path}/repDelete', formData , function(data) {	// 댓글 삭제 요청
			$('#rlist').html(data);	
		})		
	}
	
    </script>

</head>

<body>
	<input type="hidden" class=user_id value="${member.user_id}">
	<input type="hidden" class=recruit_no value="${board.recruit_no}">
	<table class="reboard">
		<colgroup>
           	<col class="reboard_col1">
           	<col class="reboard_col2">
        </colgroup>
        		
		<c:forEach var="rb" items="${rlist}">
			<c:set var = "i" value= "${i+1 }"/>
				<c:if test="${rb.recruit_r_level > 0 }">
					<tr class="reply-indent">
				</c:if>
				<c:if test="${rb.recruit_r_level == 0 }">
					<tr>
				</c:if>
				    
					<td><img class="re_image" src="mancity.png" alt="User Avatar"></td>
					
					<td id="td_${rb.recruit_r_no }">
					
						<a href="" class="re_writer">${rb.user_nickname}</a><br>
							<span class="re_content" id="rtxt_${rb.recruit_r_no }">${rb.recruit_r_content }</span>
							<br>
							
						<span class="re_date">${rb.recruit_r_date }</span>&nbsp;
						<a href="javascript:re_re_write2(${rb.recruit_r_no })" class="re_re_write" >답글쓰기</a>
							  
					<div class="block">
						<a class="re_delete1" href="javascript:re_update(${rb.recruit_r_no })">수정</a>&nbsp;&nbsp;
                    	<a class="re_delete2" href="javascript:re_delete(${rb.recruit_r_no },${rb.recruit_no })">삭제</a>&nbsp;&nbsp;
                    	
					</div>
					
					</td>	
				</tr>
					<tbody class="re_${rb.recruit_r_no }" style="display: none" >
						<td colspan="2">
                			<div class="re_writebox">
                    		<span class="nickname" id="user_id" name="user_id">${member.user_nickname }</span>
                   				<textarea rows="4" cols="50" class="re_write" id="txt_${rb.recruit_r_no }" name="sns_r_content"
                        			placeholder="댓글을 남겨보세요"></textarea>

                    			<div style="position: absolute; right: 1%; top: 0; color: #b4b4b4; font-size: 14px;">
                        			<span id="messagebyte">0 </span><span>/ 2000Byte</span>
                    			</div>
                    			<div class="buttonbox">
                        			<input type="button" id="writereply" class="action-button save" value="등록" onclick="javascript:reInsert(${rb.recruit_r_no})"></button>                        			
                    			</div>
                			</div>
            			</td>			
					</tbody>							
			</c:forEach>
		</table>		       
  
</body>

</html>
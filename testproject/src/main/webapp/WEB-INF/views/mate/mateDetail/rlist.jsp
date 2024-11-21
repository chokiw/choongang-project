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
    <link href="/css/srlist.css" rel="stylesheet">
    <title>Document</title>
    <script>
    var $textarea = $("#sns_r_content");
    var $submitButton = $("#writereply");
    
    function fn_chk_byte(obj) {
        var limitByte = 2000;
        var totalByte = 0;
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
    }   
    
    $textarea.on('input', function () {
        fn_chk_byte(this);
    });  
	
	function re_re_write2(rno){
		$('.re_'+rno).toggle();
	}

	function byteCount(str) {
// 		alert(str);
  		let count = 0;
  		for (let i = 0; i < str.length; i++) {
    		let charCode = str.charCodeAt(i);
    	if (charCode <= 0x7f) {
      		count += 1;
    	} else if (charCode <= 0x7ff) {
      		count += 2;
    	} else if (charCode <= 0xffff) {
      		count += 3;
    	} else {
      		count += 4;
    	  }
  		}
  		return count;
	}

	
	function reInsert(rno){
		var user_id = $('.user_id').val();			// 세션id
		var recruit_no = $('.recruit_no').val();	// 글번호		
		
		var recruit_r_content = $('#txt_'+rno).val();			
		var byteLength = byteCount(recruit_r_content);
				
		if(recruit_r_content == ''){
			alert('댓글 입력후에 클릭하시오');
			$('#txt_'+rno).focus();				
			return false;
		} 
				
		if (byteLength > 1000) {
			alert('1000Byte 까지 입력가능합니다.');
		    return false;
		}
		
		var formData = "user_id="+user_id+"&recruit_r_no="+rno+'&recruit_r_content='+recruit_r_content
		+"&recruit_no="+recruit_no;		
		$.post('${path}/sInsert', formData, function(data){
			$('#rlist').html(data);
		})
	}
	
	function re_update(rno){
		var txt = $.trim($('#rtxt_'+rno).text());
		$('#td_'+rno).html("<div class='re_writebox'><textarea rows='3' cols='30' class='re_write' maxlength='1000' name='sns_r_content' id='tt_"+rno+"'>"+txt+"</textarea>"+
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
				    
					<td><img class="re_image" src="${pageContext.request.contextPath}/uimg/${rb.user_photo}" alt="User Avatar"></td>
					
					<td id="td_${rb.recruit_r_no }">
					
						<a href="" class="re_writer">${rb.user_nickname}</a><br>
						
						<c:if test="${rb.recruit_r_del == 1 }">							
							<span class="re_content" id="rtxt_${rb.recruit_r_no }">삭제된 댓글입니다.</span>
						</c:if>						
						<c:if test="${rb.recruit_r_del == 0 }">
							<c:if test="${rb.parent_nickname == null }">
								<span class="re_content" id="rtxt_${rb.recruit_r_no }">${rb.recruit_r_content }</span>
							</c:if>
							<c:if test="${rb.parent_nickname != null }">
								to. ${rb.parent_nickname } <span class="re_content" id="rtxt_${rb.recruit_r_no }">${rb.recruit_r_content }</span>
							</c:if>
							
						</c:if>
							<br>
							
						<span class="re_date">${rb.recruit_r_date }</span>&nbsp;
						<a href="javascript:re_re_write2(${rb.recruit_r_no })" class="re_re_write" >답글쓰기</a>
					<c:if test="${member.user_id == rb.user_id }">
						<div class="block">
							<a class="re_delete1" href="javascript:re_update(${rb.recruit_r_no })">수정</a>&nbsp;&nbsp;
                    		<a class="re_delete2" href="javascript:re_delete(${rb.recruit_r_no },${rb.recruit_no })">삭제</a>&nbsp;&nbsp;
						</div>
					</c:if>		                      	
					
					</td>	
				</tr>
					<tbody class="re_${rb.recruit_r_no }" style="display: none" >
						<td colspan="2">
                			<div class="re_writebox">
                    		<span class="nickname">${sessionScope.member.user_nickname }</span>
                   				<textarea rows="4" cols="50" class="re_write" id="txt_${rb.recruit_r_no }" name="sns_r_content"
                        			placeholder="댓글을 남겨보세요" maxlength="1000"></textarea>
                    			<div style="position: absolute; right: 1%; top: 0; color: #b4b4b4; font-size: 14px;">
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
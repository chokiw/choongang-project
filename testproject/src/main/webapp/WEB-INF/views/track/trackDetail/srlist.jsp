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
    
    function re_re_write2(rno){
		$('.re_'+rno).toggle();
	}
	
	function reInsert(rno){
		var user_id = $('.user_id').val();			// 세션id
		var sns_no = $('.sns_no').val();	// 글번호		
		
		if($('#txt_'+rno).val() == ''){
			alert('댓글 입력후에 클릭하시오');
			$('#txt_'+rno).focus();				
			return false;
		}else{
			var sns_r_content = $('#txt_'+rno).val();
		}
		var formData = "user_id="+user_id+"&sns_r_no="+rno+'&sns_r_content='+sns_r_content
		+"&sns_no="+sns_no;		
		$.post('${path}/srInsert', formData, function(data){
			$('#srlist').html(data);
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
		var formData = "sns_r_no="+rno+'&sns_r_content='+replytext+"&sns_no=${board.sns_no}";
		$.post('${path}/srepUpdate',formData, function(data) { // 댓글 수정 요청(콜백함수)
			$('#srlist').html(data);
		});
	}
	
	function lst() {
		$('#srlist').load('/srlist/num/${board.sns_no}');
	}	
	
	function re_delete(sns_r_no, sns_no){
		if(!confirm('삭제하시겠습니까?')){
			return false;
		   }
		var formData="sns_r_no="+sns_r_no+"&sns_no="+sns_no;
			$.post('${path}/repsDelete', formData , function(data) {	// 댓글 삭제 요청
			$('#srlist').html(data);	
		})		
	}
	
    </script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>

<body>
	<input type="hidden" class=user_id value="${member.user_id}">
	<input type="hidden" class=sns_no value="${board.sns_no}">
		
		
	<table class="reboard">
		<colgroup>
           	<col class="reboard_col1">
           	<col class="reboard_col2">
        </colgroup>
        		
		<c:forEach var="rb" items="${srlist}">
			<c:set var = "i" value= "${i+1 }"/>
				<c:if test="${rb.sns_r_level > 0 }">
					<tr class="reply-indent">
				</c:if>
				<c:if test="${rb.sns_r_level == 0 }">
					<tr>
				</c:if>
				    
					<td><img class="re_image" src="${pageContext.request.contextPath}/uimg/${rb.user_photo}" alt="User Avatar"></td>
					
					<td id="td_${rb.sns_r_no }">
					
							<a href="" class="re_writer">${rb.user_nickname}</a><br>											
						
						<c:if test="${rb.sns_r_del == 1 }">							
								<span class="re_content" id="rtxt_${rb.sns_r_no }">삭제된 댓글입니다.</span>							
						</c:if>
						<c:if test="${rb.sns_r_del == 0 }">
							<c:if test="${rb.parent_nickname == null }">
								<span class="re_content" id="rtxt_${rb.sns_r_no }">${rb.sns_r_content }</span>
							</c:if>
							<c:if test="${rb.parent_nickname != null }">
								to. ${rb.parent_nickname} <span class="re_content" id="rtxt_${rb.sns_r_no }"> ${rb.sns_r_content }</span>
							</c:if>
						</c:if>
						
							<br>
							
						<span class="re_date">${rb.sns_r_date }</span>&nbsp;
						<a href="javascript:re_re_write2(${rb.sns_r_no })" class="re_re_write" >답글쓰기</a>							  
					<c:if test="${member.user_id == rb.user_id }">
					<div class="block">
						<a class="re_delete1" href="javascript:re_update(${rb.sns_r_no })">수정</a>&nbsp;&nbsp;
                    	<a class="re_delete2" href="javascript:re_delete(${rb.sns_r_no },${rb.sns_no })">삭제</a>&nbsp;&nbsp;
					</div>
					</c:if>                    
					
					</td>	
				</tr>
					<tbody class="re_${rb.sns_r_no }" style="display: none" >
						<td colspan="2">
                			<div class="re_writebox">
                    		<span class="nickname">${sessionScope.member.user_nickname }</span>
                   				<textarea rows="4" cols="50" class="re_write" id="txt_${rb.sns_r_no }" name="sns_r_content"
                        			placeholder="댓글을 남겨보세요" maxlength='1000'></textarea>

                    			<div style="position: absolute; right: 1%; top: 0; color: #b4b4b4; font-size: 14px;">
                    			</div>
                    			<div class="buttonbox">
                        			<input type="button" id="writereply" class="action-button save" value="등록" onclick="javascript:reInsert(${rb.sns_r_no})"></button>                        			
                    			</div>
                			</div>
            			</td>			
					</tbody>							
			</c:forEach>
		</table>		       

	</div>
</body>

</html>
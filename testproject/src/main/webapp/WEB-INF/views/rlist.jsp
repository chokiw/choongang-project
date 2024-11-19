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
    <script src="https://kit.fontawesome.com/5e485453d8.js" crossorigin="anonymous"></script>
    <link href="/css/sns_board.css" rel="stylesheet">
    <title>Document</title>

    <script>
    $(function() {
		$('.edit1').click(function() {	   // 수정 버튼 클릭
			var id  = $(this).attr('id');  // rno
			var txt = $.trim($('#td_'+id).text()); // replytext
			$('#td_'+id).html("<textarea rows='3' cols='30' id='tt_"+id+"'>"+txt+"</textarea>");
			$('#btn_'+id).html(
			   "<input type='button' value='확인' onclick='up("+id+")'> "
			  +"<input type='button' value='취소' onclick='lst()'>");
		});
	});
	
	function up(id) {
		var replytext = $('#tt_'+id).val();
		var formData = "recruit_r_no="+id+'&recruit_r_content='+replytext
			+"&recruit_no=${board.recruit_no}";
		$.post('${path}/repUpdate',formData, function(data) { // 댓글 수정 요청(콜백함수)
			$('#rlist').html(data);
		});
	}
	
	function lst() {
		$('#rlist').load('/rlist/num/${recruit.recruit_no}');
	}
		
	function del(recruit_r_no,recruit_no) {
		if(!confirm('삭제하시겠습니까?')){
			return false;
		   }
		var formData="recruit_r_no="+recruit_r_no+"&recruit_no="+recruit_no;
			$.post('${path}/repDelete', formData , function(data) {	// 댓글 삭제 요청
			$('#rlist').html(data);	
		})			
	}	
	
	function re(recruit_r_no,recruit_no) {
		
		var formData="recruit_r_no="+recruit_r_no+"&recruit_no="+recruit_no;
			
			$.post('${path}/sInsert', formData , function(data) {	// 댓글 삭제 요청
			$('#rlist').html(data);	
		})			
	}				
	
	$(function() {
		$('.rbt').click(function() {
			var id  = $(this).attr('id');
			$('.'+id).toggle();			
		});
	});
	
	function rep(rno) {		// rno = recruit_r_no
			var user_id = $('.user_id').val();			// 세션id
			var recruit_no = $('.recruit_no').val();	// 글번호		
		if($('.txt_'+rno).val() == ''){
			alert('댓글 입력후에 클릭하시오');
			$('.txt_'+rno).focus();				
			return false;
		}else{
			var recruit_r_content = $('.txt_'+rno).val();
		}			
		var reData = 'user_id='+user_id+'&recruit_no='+recruit_no+'&recruit_r_no='+rno+'&recruit_r_content='+recruit_r_content;
		$.post('${path}/sInsert', reData, function(data) {
			$('#rlist').html(data);
			frm.replytext.value = '';
		}); 	
	}	
	
	
    </script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>

<body>
  <div align="center">
	<input type="hidden" class=user_id value="${member.user_id}">
	<input type="hidden" class=recruit_no value="${board.recruit_no}">
		<h2 class="text-primary">댓글</h2>
		<table>
			<tr>
				<td>작성자</td>
				<td>내용</td>
				<td>수정일</td>
			</tr>
			<c:forEach var="rb" items="${rlist}">
				<c:set var = "i" value= "${i+1 }"/>
				<tr>
					<td>${rb.user_id}</td>
					<td id="td_${rb.recruit_r_no}" >
					<c:if test="${ rb.recruit_r_level > 0}">
						<c:forEach begin="1" end="${rb.recruit_r_level }">
							&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
					</c:if>
						 ${rb.recruit_r_content}
					</td>
					<td>${rb.recruit_r_date}</td>
					<td id="btn_${rb.recruit_r_no}">
						<c:if test="${rb.user_id==member.user_id}">
							<input type="button" value="수정" class="edit1" id="${rb.recruit_r_no}">
							<input type="button" value="삭제"	 onclick="del(${rb.recruit_r_no},${rb.recruit_no})">
						</c:if>						
						<input type="button" value="댓글"	 class="rbt" id="rbtn_${rb.recruit_r_no}">
					</td>
				</tr>
				<tbody class="rbtn_${rb.recruit_r_no}" style="display: none" >
					<tr>
						<td colspan="4">												
							<textarea rows="3" cols="50" class="txt_${rb.recruit_r_no}"></textarea>
							<input type="button" value="댓글입력" onclick="rep(${rb.recruit_r_no})"> 						
						</td>					
					</tr>							
				</tbody>
							
			</c:forEach>
		</table>
	</div>
</body>

</html>
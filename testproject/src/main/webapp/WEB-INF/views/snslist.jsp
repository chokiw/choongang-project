<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/5e485453d8.js" crossorigin="anonymous"></script>
<link href="/css/sns_board.css" rel="stylesheet">
<link href="/css/snslist.css" rel="stylesheet">
<script type="text/javascript">
function getlist(pageNum){
	var uri = '${path}/snslist?pageNum='+pageNum;
	$('#board').load(uri);
}

function getsearch(pageNum, search, keyword) {
    var uri = '${path}/snslist?pageNum='+pageNum+'&search='+search+'&keyword='+keyword;
    $('#board').load(uri);
}

</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>게시판 목록</h2>
		<table>
			<colgroup>
                    <col class="col1">
                    <col class="col2">
                    <col class="col3">
                    <col class="col4">
                    <col class="col5">
                    <col class="col6">
                </colgroup>
			<tr>
				<td>번호</td>
				<td>작성자</td>
				<td>제목</td>
				<td>작성일</td>
				<td>조회수</td>
				<td>추천수</td>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:set var="no1" value="${no}"></c:set>
				<c:forEach var="board" items="${list }">
					<tr>
						<td>${no1}</td>
						<td><a href="">  ${board.user_id}</a></td>
						<td>${board.sns_subject}</td>
						<td><fmt:formatDate value="${board.sns_date}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${board.sns_readcount}</td>
						<td>${board.sns_good}</td>
						
					</tr>
					<c:set var="no1" value="${no1 - 1}"></c:set>
				</c:forEach>
			</c:if>
		</table>
		<ul class="pagination">
			<!-- 검색 했을 경우의 페이징 처리 -->
			<c:if test="${not empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="javascript:getsearch(${i}&search=${search}&keyword=${keyword})">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a
						href="javascript:getsearch(${pp.endPage + 1}&search=${search}&keyword=${keyword})">다음</a></li>
				</c:if>
			</c:if>
			
			<!-- 전체 목록의 페이징 처리 -->
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="javascript:getlist(${pp.startPage - 1})">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
						<a href="javascript:getlist(${i})">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="javascript:getlist(${pp.endPage + 1})">다음</a></li>
				</c:if>
			</c:if>
		</ul>
		  <form action="snslist">
			<select name="search" style="width: 100px; height: 30px; font-size: 14px;">
				<option value="">검색</option>
				<option value="user_id">아이디</option>
				<option value="sns_subject">제목</option>
				<option value="sns_content">내용</option>
				<option value="subcon">제목+내용</option>
			</select> 
			<input type="text" name="keyword"> 
			<input type="submit" value="확인">
		</form>
	</div>
</body>
</html>
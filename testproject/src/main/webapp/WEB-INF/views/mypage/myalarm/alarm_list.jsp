<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="ko">
<head>

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/5e485453d8.js"
	crossorigin="anonymous"></script>
<link href="/css/sns_board.css" rel="stylesheet">
<link href="/css/snslist.css" rel="stylesheet">

<script type="text/javascript">
function getlist(pageNum){
	var uri = '${path}/alarm_list?pageNum='+pageNum;
	$('#alarm').load(uri);
}





</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<title>Insert title here</title>
</head>
<body>
	<div id="alarm" align="center">
		<h2>참여 리스트</h2>
		<table class="list">
			<colgroup>
				<col class="col1">
				<col class="col2">
				<col class="col3">
				<col class="col4">
			</colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>참가일</th>
				<th>읽음</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="4">데이터가 없습니다</td>
				</tr>
			</c:if>
 			<c:if test="${not empty list}">
 				<c:set var="no1" value="${no}"></c:set>
 				<c:forEach var="board" items="${list}">
 					<tr> 
 						<td>${no1}</td> 
 						<td><a href="alarm_detail?pageNum=${pageNum}&alarm_no=${board.alarm_no}" onclick="openPopup(this.href); return false;">${board.alarm_subject}</a></td>
 						
						<td>
						<c:set var="now" value="<%=new java.util.Date()%>" /> <fmt:formatDate
								var="today" value="${now}" pattern="yyyyMMdd" /> <fmt:formatDate
								var="postDate" value="${board.alarm_date}" pattern="yyyyMMdd" />

							<c:choose>
								<c:when test="${today eq postDate}">
									<fmt:formatDate value="${board.alarm_date}" pattern="HH:mm" />
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${board.alarm_date}" pattern="yyyy-MM-dd" />
								</c:otherwise>
							</c:choose>
 						</td> 
 								
 						<td>${board.alarm_date_readcount}</td> 
 					</tr>
 					<c:set var="no1" value="${no1 - 1}"></c:set>
 				</c:forEach> 
 			</c:if> 
		</table>
		
 		<ul class="pagination">

			<!-- 전체 목록의 페이징 처리 -->
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="javascript:getlist(${pp.startPage - 1})">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
					<a href="javascript:getlist(${i})">${i}</a>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="javascript:getlist(${pp.endPage + 1})">다음</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
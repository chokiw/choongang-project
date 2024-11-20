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
	function getlist(pageNum) {
		var uri = '${path}/liked_list?pageNum=' + pageNum;
		$('#liked').load(uri);
	}
</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="board" align="center">
		<h2>좋아요한 게시글 목록</h2>
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
			<c:if test="${empty likedPosts}">
				<tr>
					<td colspan="6">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty likedPosts}">
				<c:set var="no1" value="${no}"></c:set>
				<c:forEach var="board" items="${likedPosts}">
					<tr>
						<td>${no1}</td>
						<td>${board.user_id}</td>
						<td><a
							href="sns_detail?pageNum=${pageNum}&sns_no=${board.sns_no}">${board.sns_subject}</a></td>
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
			<!-- 전체 목록의 페이징 처리 -->
			<c:if test="${empty keyword}">
				<c:if test="${pp.startPage > pp.pagePerBlk}">
					<li><a href="javascript:getlist(${pp.startPage - 1})">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage == i}">class="active"</c:if>>
						<a href="javascript:getlist(${i})">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="javascript:getlist(${pp.endPage + 1})">다음</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
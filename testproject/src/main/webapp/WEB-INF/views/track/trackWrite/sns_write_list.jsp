<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html  lang="ko">
<head>

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/5e485453d8.js" crossorigin="anonymous"></script>
<link href="/css/sns_write_list.css" rel="stylesheet">
<link href="/css/snslist.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
function goback(runner_data_no){
	window.opener.setNo(runner_data_no);
	window.close();
}
</script>

<title>Insert title here</title>
</head>
<body>
	<div>
	<h2 align="center">트랙 목록</h2>
		<table class="list">
			<colgroup>
                    <col class="col1">
                    <col class="col2">
                    <col class="col3">
                    <col class="col4">
                </colgroup>
               
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>거리</th>
				<th>시간</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">데이터가 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:set var="no1" value="${no}"></c:set>
				<c:forEach var="board" items="${list}">
					<fmt:parseNumber value="${board.runner_data_time}" var="time"/>
					<tr>
						<td>${no1}</td>
						<td><a href="JAVASCRIPT:goback(${board.runner_data_no})">
							<c:set var="now" value="<%=new java.util.Date()%>" /> <fmt:formatDate
                        var="today" value="${now}" pattern="yyyyMMdd" /> <fmt:formatDate
                        var="postDate" value="${board.runner_data_date}" pattern="yyyyMMdd" />

                     <c:choose>
                        <c:when test="${today eq postDate}">
                           <fmt:formatDate value="${board.runner_data_date}" pattern="HH:mm" />
                        </c:when>
                        <c:otherwise>
                           <fmt:formatDate value="${board.runner_data_date}" pattern="yyyy-MM-dd" />
                        </c:otherwise>
                     </c:choose>
							</a></td>
						<td>${board.runner_data_distance}M</td>
						<td>
							<fmt:formatNumber type="number" maxFractionDigits="0" value="${time/(60*60)}"/>시
							<fmt:formatNumber type="number" maxFractionDigits="0" value="${(time-(time/(60*60)))/60}"/>분
                     		<fmt:formatNumber type="number" maxFractionDigits="0" value="${time%60}"/>초
						</td>
					</tr>
					<c:set var="no1" value="${no1 - 1}"></c:set>
				</c:forEach>
			</c:if>
		</table>
		<ul class="pagination">
			<!-- 전체 목록의 페이징 처리 -->
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="sns_write_list?pageNum=${pp.startPage - 1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
						<a href="sns_write_list?pageNum=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="sns_write_list?pageNum=${pp.endPage + 1}">다음</a></li>
				</c:if>
		</ul>
		</div>
</body>
</html>
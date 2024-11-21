<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
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
<link href="/css/common.css" rel="stylesheet">
<link href="/css/sns_board.css" rel="stylesheet">
<link href="/css/snslist.css" rel="stylesheet">
<script src="/js/sns_board.js"></script>

<title>runnertrack</title>

</head>

<body>
	<div class="container">
		<!-- 탑 메뉴 -->
		<jsp:include page="${path}/WEB-INF/views/header.jsp"></jsp:include>

		<!-- 사이드(왼쪽) 메뉴 -->
		<jsp:include page="${path}/WEB-INF/views/side.jsp"></jsp:include>

		<main class="content">
			<div class="track">
				<span style="font-size: 36px; font-weight: 700;">내가 달린 트랙</span><br>
				<br> <span style="color: gray;">여기에서 내가 달린 트랙의 기록을 확인할 수
					있습니다.</span>
				<hr>
			</div>
			<div align="center">
				<table class="list">
					<colgroup>
						<col class="col1">
						<col class="col2">
						<col class="col3">
						<col class="col4">
						<col class="col5">
					</colgroup>
					<tr>
						<th>번호</th>
						<th>작성자</th>
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
						<c:forEach var="track" items="${list}">
							<tr>
								<td>${no1}</td>
								<td>${track.user_id}</td>


								<td><a
									href="runnertrack_detail?runner_data_no=${track.runner_data_no}">
										<c:set var="now" value="<%=new java.util.Date()%>" /> <fmt:formatDate
											var="today" value="${now}" pattern="yyyyMMdd" /> <fmt:formatDate
											var="postDate" value="${track.runner_data_date}" pattern="yyyyMMdd" />

										<c:choose>
											<c:when test="${today eq postDate}">
												<fmt:formatDate value="${track.runner_data_date}" pattern="HH:mm" />
											</c:when>
											<c:otherwise>
												<fmt:formatDate value="${track.runner_data_date}"
													pattern="yyyy-MM-dd" />
											</c:otherwise>
										</c:choose>
								</a></td>


								<td>${track.runner_data_distance}</td>
								<td>${track.runner_data_time}</td>
							</tr>
							<c:set var="no1" value="${no1 - 1}"></c:set>
						</c:forEach>
					</c:if>
				</table>
				<ul class="pagination"
					style="list-style-type: none; display: flex; justify-content: center; padding: 0;">
					<!-- 전체 목록의 페이징 처리 -->
					<c:if test="${pp.startPage > pp.pagePerBlk }">
						<li><a href="runnertrack?pageNum=${pp.startPage - 1}">이전</a></li>
					</c:if>
					<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
						<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
							href="runnertrack?pageNum=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pp.endPage < pp.totalPage}">
						<li><a href="runnertrack?pageNum=${pp.endPage + 1}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</main>
	</div>
</body>

</html>
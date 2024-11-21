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
<link href="/css/userpostlist.css" rel="stylesheet">
<link href="/css/snslist.css" rel="stylesheet">
<script type="text/javascript">

function getlist(pageNum){
	var uri = '${path}/userPostList?pageNum='+pageNum;
	$('#board').load(uri);
  }

</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<meta charset="UTF-8">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<title>User's Post List</title>
</head>
<body>
	<div align="center">
		<h2>내가 쓴 글</h2>
		<table class="list">
			<colgroup>
                    <col class="col1">
                    <col class="col2">
                    <col class="col3">
                    <col class="col4">
                    <col class="col5">
                    <col class="col6">
                </colgroup>
			<tr>
				<th>번호</th>
				<th>글유형</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
            <!-- 게시글이 없을 경우 -->
            <c:if test="${empty list}">
                <tr>
                    <td colspan="5">작성된 게시글이 없습니다.</td>
                </tr>
			</c:if>
            <!-- 게시글이 있을 경우 -->
			<c:if test="${not empty list}">
				<c:set var="no" value="${no}"></c:set>
                <c:forEach var="post" items="${list}">
                    <tr>
                        <td>${no}</td>
                        <c:if test="${post.recruit_no==0 }">
                        	<td>트랙</td>
                        	<td><a href="sns_detail?sns_no=${post.sns_no}">${post.sns_subject}</a></td>
                        	
                        	<td>
                        	<c:set var="now" value="<%=new java.util.Date()%>" /> <fmt:formatDate
								var="today" value="${now}" pattern="yyyyMMdd" /> <fmt:formatDate
								var="postDate" value="${post.sns_date}" pattern="yyyyMMdd" />

							<c:choose>
								<c:when test="${today eq postDate}">
									<fmt:formatDate value="${post.sns_date}" pattern="HH:mm" />
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${post.sns_date}" pattern="yyyy-MM-dd" />
								</c:otherwise>
							</c:choose>
                        	</td>
                        	
                        	<td>${post.sns_readcount}</td>
                        </c:if>
                        <c:if test="${post.recruit_no!=0 }">
                        	<td>모집</td>
                        	<td><a href="mate_detail?recruit_no=${post.recruit_no}">${post.recruit_subject}</a></td>
                        	
                        	
                        	<td>
                        	<c:set var="now" value="<%=new java.util.Date()%>" /> 
						<fmt:formatDate var="today" value="${now}" pattern="yyyyMMdd" />
						<fmt:formatDate var="postDate" value="${post.recruit_date}" pattern="yyyyMMdd"  />

							<c:choose>
								<c:when test="${today eq postDate}">
									<fmt:formatDate value="${post.recruit_date}" pattern="HH:mm"  />
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${post.recruit_date}" pattern="yyyy-MM-dd" />
								</c:otherwise>
							</c:choose>
                        	
                        	</td>
                        	
                        	
                        	<td>${post.recruit_readcount}</td>
                        </c:if>
					</tr>
					<c:set var="no" value="${no - 1}" />
				</c:forEach>
			</c:if>
		</table>

		<!-- 페이지 네비게이션 -->
		<ul class="pagination">
			<!-- 이전 버튼 -->
			<c:if test="${pp.startPage > pp.pagePerBlk}">
				<li><a href="javascript:getlist(${pp.startPage - 1})">이전</a></li>
			</c:if>
			
			<!-- 페이지 번호 출력 -->
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<li <c:if test="${pp.currentPage==i}">class="active"</c:if>>
					<a href="javascript:getlist(${i})">${i}</a>
				</li>
			</c:forEach>

			<!-- 다음 버튼 -->
			<c:if test="${pp.endPage < pp.totalPage}">
				<li><a href="javascript:getlist(${pp.endPage + 1})">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>
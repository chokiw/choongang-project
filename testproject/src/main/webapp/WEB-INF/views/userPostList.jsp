<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<style>
  .pagination {
    display: flex;
    justify-content: center;
    list-style-type: none;
    padding: 0;
  }
  .pagination li {
    margin: 0 5px;
  }
  .pagination li a {
    text-decoration: none;
    color: blue;
  }
  .pagination .active a {
    font-weight: bold;
    color: blue;
  }
</style>

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Gothic+A1&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/5e485453d8.js" crossorigin="anonymous"></script>
<link href="./css/sns_board.css" rel="stylesheet">

<meta charset="UTF-8">
<title>User's Post List</title>
</head>
<body>
	<div align="center">
		<h2>내가 쓴 글</h2>
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
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>추천수</th>
			</tr>
            <!-- 게시글이 없을 경우 -->
            <c:if test="${empty list}">
                <tr>
                    <td colspan="6">작성된 게시글이 없습니다.</td>
                </tr>
			</c:if>
            <!-- 게시글이 있을 경우 -->
			<c:if test="${not empty list}">
                <c:forEach var="post" items="${list}">
                    <tr>
                        <td>${no}</td>
                        <td>${post.user_id}</td>
                        <td><a href="sns_detail?postId=${post.sns_no}">${post.sns_subject}</a></td>
                        <td><fmt:formatDate value="${post.sns_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        <td>${post.sns_readcount}</td>
                        <td>${post.sns_good}</td>
					</tr>
					<c:set var="no" value="${no - 1}" />
				</c:forEach>
			</c:if>
		</table>

		<!-- 페이지 네비게이션 -->
		<ul class="pagination">
			<!-- 이전 버튼 -->
			<c:if test="${pp.startPage > pp.pagePerBlk}">
				<li><a href="userPostList?pageNum=${pp.startPage - 1}">이전</a></li>
			</c:if>
			
			<!-- 페이지 번호 출력 -->
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<li class="${pp.currentPage == i ? 'active' : ''}">
					<a href="userPostList?pageNum=${i}">${i}</a>
				</li>
			</c:forEach>

			<!-- 다음 버튼 -->
			<c:if test="${pp.endPage < pp.totalPage}">
				<li><a href="userPostList?pageNum=${pp.endPage + 1}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>

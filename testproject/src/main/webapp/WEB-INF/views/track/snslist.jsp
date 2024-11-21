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

<c:if test="${not empty search}">var search='${search}' </c:if>
<c:if test="${not empty keyword}">var keyword='${keyword}' </c:if>

function getlist(pageNum){
	var uri = '${path}/snslist?pageNum='+pageNum;
	$('#board').load(uri);
}

function getsearch(pageNum) {
    var uri = '${path}/snslist?pageNum='+pageNum+'&search='+search+'&keyword='+keyword;
    $('#board').load(uri);
}

function getsearchfisrt() {
	if($("select[name='search']").val()=="") return false; 
	else if($("#keyword").val()=="") return false; 
	else{
    	var uri = '${path}/snslist?pageNum='+1+'&search='
    			  +$("select[name='search']").val()
    			  +'&keyword='+$("#keyword").val();
   	 	$('#board').load(uri);
	}
}
</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>게시판 목록</h2>
		<table class="list">
			<colgroup>
				<col class="col1">
				<col class="col2">
				<col class="col3">
				<col class="col4">
				<col class="col5">
				<col class="col6">
				<col class="col7">
			</colgroup>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>지역</th>
				<th>조회수</th>
				<th>추천수</th>
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
						<td>${board.user_nickname}</td>
						<td><a
							href="sns_detail?pageNum=${pageNum}&sns_no=${board.sns_no}">${board.sns_subject}</a></td>

						
						<!-- 글을 작성한 날짜가 오늘이면 시,분만 나오고 하루가 지나면 년,월,일이 나오게 한다. -->
						<td><c:set var="now" value="<%=new java.util.Date()%>" /> <fmt:formatDate
								var="today" value="${now}" pattern="yyyyMMdd" /> <fmt:formatDate
								var="postDate" value="${board.sns_date}" pattern="yyyyMMdd" />

							<c:choose>
								<c:when test="${today eq postDate}">
									<fmt:formatDate value="${board.sns_date}" pattern="HH:mm" />
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${board.sns_date}" pattern="yyyy-MM-dd" />
								</c:otherwise>
							</c:choose></td>


						<td>${board.sns_address1}&nbsp;${board.sns_address2}</td>
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
					<li><a href="javascript:getsearch(${pp.startPage - 1})">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="javascript:getsearch(${i})">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="javascript:getsearch(${pp.endPage + 1})">다음</a></li>
				</c:if>
			</c:if>

			<!-- 전체 목록의 페이징 처리 -->
			<c:if
				test="${empty keyword && empty  sns_address1  && empty  sns_address2 }">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<c:choose>
						<c:when test="${best}">
							<li><a href="javascript:getBestList(${pp.startPage - 1})">이전</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="javascript:getlist(${pp.startPage - 1})">이전</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><c:choose>
							<c:when test="${best}">
								<a href="javascript:getBestList(${i})">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:getlist(${i})">${i}</a>
							</c:otherwise>
						</c:choose></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<c:choose>
						<c:when test="${best}">
							<li><a href="javascript:getBestList(${pp.endPage + 1})">다음</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="javascript:getlist(${pp.endPage + 1})">다음</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
			</c:if>

			<!-- 지역별 페이징 처리 -->
			<c:if test="${not empty sns_address1 && not empty sns_address2}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a
						href="javascript:getAddressList(${pp.startPage - 1},'${sns_address1 }','${sns_address2 }')">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="javascript:getAddressList(${i},'${sns_address1 }'  ,  '${sns_address2 }')">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a
						href="javascript:getAddressList(${pp.endPage + 1},'${sns_address1 }','${sns_address2 }')">다음</a></li>
				</c:if>
			</c:if>




		</ul>
	<div style="display:flex; justify-content: center;">
		<select name="search"
			style="width: 100px; height: 30px; font-size: 14px;">
			<option value="">검색</option>
			<option value="user_id">아이디</option>
			<option value="sns_subject">제목</option>
			<option value="sns_content">내용</option>
			<option value="subcon">제목+내용</option>
		</select> <input type="text" id="keyword" name="keyword">
		<button type="button" class="search" onclick="getsearchfisrt()"><span class="material-symbols-outlined">search</span></button>
	</div>
	</div>
</body>
</html>
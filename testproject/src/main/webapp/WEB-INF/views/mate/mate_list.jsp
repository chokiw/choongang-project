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
	var uri = '${path}/mate_list?pageNum='+pageNum;
	$('#board').load(uri);
}

function getsearch(pageNum) {
    var uri = '${path}/mate_list?pageNum='+pageNum+'&search='+search+'&keyword='+keyword;
    $('#board').load(uri);
}

function getsearchfisrt() {
	if($("select[name='search']").val()=="") return false; 
	else if($("#keyword").val()=="") return false; 
	else{
    	var uri = '${path}/mate_list?pageNum='+1+'&search='
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
				
			</colgroup>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>지역</th>
				<th>모집인원</th>
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
							href="mate_detail?pageNum=${pageNum}&recruit_no=${board.recruit_no}">${board.recruit_subject}</a></td>
							
							
						<td>
						<c:set var="now" value="<%=new java.util.Date()%>" /> 
						<fmt:formatDate var="today" value="${now}" pattern="yyyyMMdd" />
						<fmt:formatDate var="postDate" value="${board.recruit_date}" pattern="yyyyMMdd"  />

							<c:choose>
								<c:when test="${today eq postDate}">
									<fmt:formatDate value="${board.recruit_date}" pattern="HH:mm"  />
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${board.recruit_date}" pattern="yyyy-MM-dd"  />
								</c:otherwise>
							</c:choose>
						</td>
								
						<td>${board.recruit_address1}&nbsp;${board.recruit_address2}</td>	
						<!-- 조회수 대신 모집인원  -->	
						<td>${board.recruit_recruitnum}명</td>
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
			
			
			<!-- 지역별 페이징 처리 -->
			<c:if test="${not empty recruit_address1 && not empty recruit_address2}">
				<c:if test="${pp.startPage > pp.pagePerBlk }">
					<li><a href="javascript:getAddressList(${pp.startPage - 1},'${recruit_address1 }','${recruit_address2 }')">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
					<li <c:if test="${pp.currentPage==i}">class="active"</c:if>><a
						href="javascript:getAddressList(${i},'${recruit_address1 }'  ,  '${recruit_address2 }')">${i}</a></li>
				</c:forEach>
				<c:if test="${pp.endPage < pp.totalPage}">
					<li><a href="javascript:getAddressList(${pp.endPage + 1},'${recruit_address1 }','${recruit_address2 }')">다음</a></li>
				</c:if>
			</c:if>
			
		</ul>
	<div style="display:flex; justify-content: center;">
		<select name="search"
			style="width: 100px; height: 30px; font-size: 14px;">
			<option value="">검색</option>
			<option value="user_nickname">작성자</option>
			<option value="recruit_subject">제목</option>
			<option value="recruit_content">내용</option>
			<option value="subcon">제목+내용</option>
		</select> <input type="text" id="keyword" name="keyword">
		<button type="button" class="search" onclick="getsearchfisrt()"><span class="material-symbols-outlined">search</span></button>
	</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="/js/sns_board.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>


<title>Document</title>

<script>
	function goback(runner_data_no) {
		console.log(runner_data_no);
		window.opener.setNo(runner_data_no);
		window.close();
	}
</script>

</head>

<body>

	<div align="center" style="margin-top: 50px;">
		<span
			style="font-family: 'Bangers', system-ui; color: #cf3e00; font-size: 80px;">RUNAWAY</span><br>
		<br> <span style="font-size: 18px;">${alarm.alarm_content}</span><br>
		<c:choose>
			<%-- 내가 작성한 글에 다른 사용자가 참가 신청한 경우 --%>
			<c:when test="${isWriter}">
				<span style="font-size: 18px;"><a
					href=" JAVASCRIPT:goback('mate_detail?pageNum=${pageNum}&recruit_no=${alarm.recruit_no}')">이곳을
						누르면 작성하신 글로 이동합니다.</a></span>
			</c:when>

			<%-- 내가 다른 사람의 글에 참가 신청한 경우 --%>
			<c:otherwise>
				<span style="font-size: 18px;"><a
					href=" JAVASCRIPT:goback('mate_detail?pageNum=${pageNum}&recruit_no=${alarm.recruit_no}')">이곳을
						누르면 참가신청한 글로 이동합니다.</a></span>
			</c:otherwise>
		</c:choose>
	</div>

</body>

</html>
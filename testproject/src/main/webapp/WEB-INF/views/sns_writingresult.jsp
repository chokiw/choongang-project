<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 결과</title>
</head>
<body>
	<c:if test="${result==1}">
		<script>
			alert("글쓰기에 성공했습니다");
			location.href="sns_board";
		</script>
	</c:if>
	<c:if test="${result!=1}">
		<script>
			alert("글쓰기 실패");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>
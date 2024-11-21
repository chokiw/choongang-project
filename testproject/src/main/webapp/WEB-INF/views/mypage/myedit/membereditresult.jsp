<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result==1}">
		<script>
			alert("수정 성공");
			location.href="mainpage";
		</script>
	</c:if>
	<c:if test="${result==2}">
		<script>
			alert("프로필사진 크기가 너무 큽니다. 100kb미만으로 맞춰주세요.");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${result==3}">
		<script>
			alert("프로필 사진이 지정된 파일확장자가 아닙니다.");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${result==0}">
		<script>
			alert("수정 실패");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>
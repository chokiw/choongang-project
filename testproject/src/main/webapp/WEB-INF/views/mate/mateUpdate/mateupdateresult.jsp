<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<script>
			alert("수정 성공");
			location.href="mate_detail?pageNum=${pageNum}&recruit_no=${recruit_no}"
		</script>
	
</body>
</html>
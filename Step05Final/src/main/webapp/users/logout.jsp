<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>logout.jsp</title>
</head>
<body>
	<%
		//sessions scope에 id 라는 키값으로 저장된 값 삭제하기
		session.removeAttribute("id");
	%>
	<script>
		alert("로그아웃 되었습니다");
		//javscript를 이용해서 페이지 이동
		location.herf="${pageContext.request.contextPath}/index.jsp";
	</script>
</body>
</html>
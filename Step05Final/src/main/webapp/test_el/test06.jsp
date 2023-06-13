<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트에게 쿠키를 응답하기 위해 쿠키 객체생성
	Cookie cook = new Cookie("savedId","kimgura");
	cook.setMaxAge(60);
	//HttpservletResponse객체에 addCookie메소드를 호출하면서 Cookie객체를 전달하면
	response.addCookie(cook);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키에 저장된 내용도 EL로 추출할 수 있다</h1>
	<p>savedId라는 키값으로 60초동안 유지되는 쿠키를 응답했습니다</p>
	<a href="test07.jsp">쿠키값 확인하기</a>
</body>
</html>
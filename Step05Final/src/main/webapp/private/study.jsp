<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 된 아이디가 있는지 확인해서 
	String id=(String)session.getAttribute("id");
	//만일 로그인 되지 않았다면
	/*if(id == null){
		String cPath=request.getContextPath();//contect 경로 구하기
		//로그인 페이지로 리다일렉트 이동 시킨다.
		response.sendRedirect(cPath+"/useres/loginform.jsp");
	}
	filter에서 대신 해줌
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<h1>공부 페이지입니다.</h1>
	<p><%=id %> 님 열심히 공부해요</p>
</body>
</html>
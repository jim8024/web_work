<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	int num=Integer.parseInt(request.getParameter("num"));
	GuestDao dao=GuestDao.getInstance();
	boolean isSuccess=dao.delete(num);

 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){%>
	<script>
		alert("<%=num%> 번 회원의 정보를 삭제 했습니다.");
		location.href="list.jsp";
	</script>
<%}else{%>
	<script>
		alert("삭제 실패!");
		location.href="list.jsp";
	</script>
<%} %>
</body>
</html>
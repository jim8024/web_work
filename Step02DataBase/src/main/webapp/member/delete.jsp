<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.삭제할 회원의 번호를 얻어내서
	request.setCharacterEncoding("utf-8");
	//요청 파라미터 추출
	int num=Integer.parseInt(request.getParameter("num"));
	//2.DB에서 삭제하고
	boolean isSuccess=MemberDao.getInstance().delete(num);
	
	//3.응답한다
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/delete.jsp</title>
</head>
<body>
<div class="container">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p>
				<strong><%=num %></strong>번 회원의 정보를 삭제 하였습니다
				<a href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				 삭제실패!
				<a href="list.jsp"></a>
			</p>
		<%} %>
	</div>
</body>
</html>
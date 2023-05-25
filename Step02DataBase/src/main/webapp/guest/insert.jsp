<%@page import="test.guest.dto.GuestDto"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1.post방식으로 전송되는 회원의 이름,주소를 추출한다
	//요청 인코딩 설정
	request.setCharacterEncoding("utf-8");
	//요청 파라미터 추출
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	String regdate=request.getParameter("regdate");
	//추가할 회원 정보를 DTO에 담기
	GuestDto dto= new GuestDto();
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setPwd(pwd);
	dto.setRegdate(regdate);
	//2.DB에 저장한다
	GuestDao dao=GuestDao.getInstance();
	boolean isSuccess=dao.insert(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="container" mt-5>
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p class="alert alert-warning">
				<strong><%=writer %></strong>님의 정보가 저장되었습니다
				<a href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p class="alert alert-danger">
				회원 정보 저장실패
				<a href="list.jsp"></a>
			</p>
		<%} %>
	</div>
</body>
</html>
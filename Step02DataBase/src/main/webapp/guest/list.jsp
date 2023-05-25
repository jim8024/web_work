<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
GuestDao dao=GuestDao.getInstance();
List<GuestDto> list=dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>방명록 입니다</h1>
		<div>
			<a href="insertform.jsp">회원 추가</a>
		</div>

	<table class="table table-sm">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>내용</th>
				<th>날짜</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%for(GuestDto tmp:list){%>
				<tr>
					<td><%=tmp.getNum()%></td>
					<td><%=tmp.getWriter()%></td>
					<td><textarea name="content" id="content" cols="30" rows="10"><%=tmp.getContent()%></textarea></td>
					<td><%=tmp.getRegdate()%></td>	
					<td>
					<a href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a>
					</td>
					<td>
					<a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a>
				</td>	
				</tr>
			<%}%>
		</tbody>
	</table>
		</div>
		<script>https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js</script>
</body>
</html>
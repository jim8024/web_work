<%@page import="java.util.List"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
FileDao dao=FileDao.getInstance();
List<FileDto> list=dao.getList();
String id=(String)session.getAttribute("id");  //http session 객체
%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script>https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>list.jsp</title>
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드하기</a>
		<br>
		<a href="${pageContext.request.contextPath}/file/private/upload_form2.jsp">ajax 업로드하기2</a>
		<h1>자료실 입니다</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
                 <%for(FileDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>	
					<td><%=tmp.getTitle() %></td>
					<td>
					<a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName()%></a>
					</td>	
					<td><%=tmp.getRegdate() %></td>
					<td>
					<% if(tmp.getWriter().equals(id)){ //순서 바뀌면 안됨(작성자와 id  비교해서 null 아니게 하기%> 
						<a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a>
					<% }%>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>
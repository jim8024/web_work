<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET파라미터 방식으로 url이라는 이름으로 전달되는 값이 있는지 읽어와 본다
	String url=request.getParameter("url");
	if(url==null){
		String cPath=request.getContextPath();
		url=cPath+"/index.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>loginform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script>https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js</script>
</head>
<body>
	<div class="container">
		<h1>로그인 폼</h1>
		<form action="login.jsp" method="post">
			<!-- 폼에 입력한 정보외에 추가로 같이 전송할 같이 있으면 input type hidden 을 활용 -->
			<input type="hidden" name="url" value="<%=url %>" />
			<div>
				<label for="id" class="form-label">아이디</label>
				<input type="text" class="form-control" name="id" id="id" />
			</div>
			<div>
				<label for="pwd" class="form-label">비밀번호</label>
				<input type="password" class="form-control" name="pwd" id="pwd" />
			</div>
			<button class="btn btn-primary" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>
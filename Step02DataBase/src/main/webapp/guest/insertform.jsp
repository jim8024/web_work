<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
        <h2>Insert Form</h2>
        <form action="insert.jsp" method="post"  id="insert_form">
        	<div class="mb-2">
        		<label for="name" class="form-label">작성자</label>
        		<input type="text" id="writer" name="writer"  class="form-control"/>
        	</div>
        	<div class="mb-2">
        		<label for="content" class="form-label">내용</label>
        		<tearea><input type="text" id="content" name="content"  class="form-control"/></tearea>
        	</div>
        	<div class="mb-2">
        		<label for="pwd" class="form-label">비밀번호</label>
        		<input type="text" id="pwd" name="pwd"  class="form-control"/>
        	
        	</div>
        	<button class="btn btn-primary mb-3" type="submit">추가</button>
        </form>
    </div>
</body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</html>
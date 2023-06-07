<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>upload)form2.jsp</title>
</head>
<body>
	<div class="container">
		<h3>파일 업로드 폼입니다</h3>
		<!-- 
			파일 업로드 폼 작성법
			1.method="post"
			2.enctype="multipart/form-data"
			3.<input type="file"
		 -->
		<form action="ajax_upload.jsp" method="post" enctype="multipart/form-data">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" />
			</div>
					<div>
				<label for="myFile">파일</label>
				<input type="file" name="myFile" id="myFile" />
			</div>
			<button type="submit">업로드</button>
		</form>
	</div>
	<script>src="${pageContext.request.contextPath}/js/gura.util.js"</script>
	<script>
	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>event.jsp</title>
<style>
	.box{
		width:100px;
		height:100px;
		border:1px solid red;
	}
</style>
</head>
<body>
		<h1>이벤트 리스너 함수 등록</h1>
		<div class="box">div1</div>
		<div class="box">div2</div>
		<div class="box">div3</div>
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
		<script>
			$(".box").on("mouseover",function(e){
				//이벤트가 발행한 바로 그 요소의 참조값은  e.target
				console.log(e.target);
				//$()함수에 문서객체의 참조값을 전달하면 해당 문서 객체를 jaquery의 기능을 통해서 조작할 수 있다.
				$(e.target)
				.css("background-color","yellow")
				.css("width","200px")
				.css("height","200px")
				.text("mouseOver!");
			});
		
		</script>
</body>
</html>
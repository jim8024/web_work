<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>event4.jsp</title>
</head>
<body>
	<h1>이벤트 처리</h1>
	<input type="text" id="inputMsg" placeholder="메세지 입력..." />
	<button id="sendBtn">전송</button>
	<p id="current"></p>
	<ul id="msgList">
	
	</ul>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		$("#inputMsg").on("input",function(e){
			const msg=$(e.target).val();
			$("#current").text(msg);
		});
		//전송 버튼을 눌렀을때 실행할 함수 등록
		$("#sendBtn").on("click",function(){
			//1.입력한 문자열 읽어오기
			const msg=$("#inputMsg").val();
			//2.li요소를 만들어서 innerText에 출력하고 id 가 msgList 인 요소에 추가하기
			$("<li>").text(msg).appendTo("#msgList");
		});
	</script>
</body>
</html>
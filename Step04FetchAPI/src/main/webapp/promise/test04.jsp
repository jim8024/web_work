<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/promise/test04.jsp</title>
</head>
<body>
	<h1>Promise 테스트</h1>
	<script>
		new Promise(function(resolve,reject){
			//무언가 작업을 하고 결과 데이터가 있다면
			let data={num:1,name:"김구라"};
			// resolve혹은 reject 함수를 호출하면서 전달 할 수 있다.
			resolve(data);
			console.log("resolve 호출 됨")
		}).then(function(result){
			console.log(result);
		}).catch(function(){
			console.log("catch() 안에 함수 호출 됨");
		});
	</script>
</body>
</html>
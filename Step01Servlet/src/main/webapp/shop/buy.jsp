<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//몇번 상품 몇개인지를 HTTPServletRequest객체를 이용해서 얻어낸 다음
	//아래의 html 요소에 출략해보세요.
	
	//get방식 전송은 한글이 깨지지 않기 때문에 아래의 한줄은 필요 없다.
	request.setCharacterEncoding("utf-8");
	//전달되는 파라미터가 숫자인 경우 실제 숫자로 바꿔야 하는 경우가 많다
	//그런 경우 Integer 클래스 혹은 Double클래스의 
	//parse메소드를 활용하면 된다
	int number=Integer.parseInt(request.getParameter("num"));
	int amount=Integer.parseInt(request.getParameter("amount"));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/buy.jsp</title>
</head>
<body>
	<p>
		<strong><%=number %></strong>번 상품 <strong><%=amount %></strong>개를 주문했습니다.
	</p>
</body>
</html>
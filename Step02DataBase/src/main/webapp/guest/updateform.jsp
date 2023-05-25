<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1. 수정할 회원의 번호를 얻어낸다
int num=Integer.parseInt(request.getParameter("num"));
//2. 번호를 이용해서 DB 에 저장된 수정할 회원의 정보를 얻어낸다.
GuestDto dto=GuestDao.getInstance().getData(num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	 <div class="container">
      <h1>회원 정보 수정 양식</h1>
      <form action="update.jsp" method="post">
         <div class="mb-1">
            <label for="num" class="form-label">번호</label>
            <input class="form-control" type="text" id="num" name="num" value="<%=dto.getNum()%>" readonly/>
         </div>
         <div  class="mb-1">
            <label for="name">작성자</label>
            <input class="form-control" type="text" id="name" name="name" value="<%=dto.getWriter()%>"/>
         </div>
         <div  class="mb-1">
            <label for="addr">내용</label>
            <input class="form-control"type="text" id="addr" name="addr" value="<%=dto.getContent()%>"/>
         </div>
          <div class="mb-1">
            <label for="regdate" class="form-label">날짜</label>
            <input class="form-control" type="text" id="num" name="num" value="<%=dto.getRegdate()%>" readonly/>
         </div>
         <button class="btn btn-outline-primary"type="submit">수정확인</button>
         <button class="btn btn-outline-warning" type="reset">취소</button>
      </form>
</body>
</html>
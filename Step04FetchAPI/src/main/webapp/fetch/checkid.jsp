<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//get방식 파라미터로 전달되는 아이디 읽어내기
	String inputId=request.getParameter("inputId");
	//Db에 이미 존재하는 아이디 인지 알ㄴ아내서 사용가능 여부 판정
	boolean canUse=true;
	if(inputId.equals("gura")||inputId.equals("monkey")){
		canUse=false;
	}

	//json으로 사용가능 여부를 응답하기.
%>
{"canUse":<%=canUse %>}

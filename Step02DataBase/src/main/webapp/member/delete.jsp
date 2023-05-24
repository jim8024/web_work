<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.삭제할 회원의 번호를 얻어내서
	request.setCharacterEncoding("utf-8");
	//요청 파라미터 추출
	int num=Integer.parseInt(request.getParameter("num"));
	//2.DB에서 삭제하고
	MemberDao.getInstance().delete(num);
	
	/*
		[리다일렉트 응답]
		-클라이언트에게 특정 경로로 요청을 다시 하라고 하는 응답하는 것이다.
		-다시 요청할 경로를 전달하면 클라이언트가 해당영로롤 요청을 다시 하게 된다.
		-따라서 순간적으로 페이지가 이동되ㅔ 한다
		-HttpServletResponse 객체의 기능을 활용하면 된다
		-요청을 다시 할 경로를 전달할때는 반드시 절대경로로 전달하는 것이 좋다.
		-새로운 경로로 요청을 다시 하라고 강요하는것도 응답이다.
	*/
	//context 경로 얻어내기
	String cPath=request.getContextPath();//context경로는 추후에 수정되거나 제거될 예정이라 하드코딩하면 안된다.
	//리다일렉트 응답하기
	response.sendRedirect(cPath+"/member/list.jsp");
	
%>

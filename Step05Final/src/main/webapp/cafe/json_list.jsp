<%@page import="org.json.JSONWriter"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	CafeDto dto = new CafeDto();
	dto.setStartRowNum(1);
	dto.setEndRowNum(10);

	//글목록
	List<CafeDto> list=CafeDao.getInstance().getList(dto);
	String json = JSONWriter.valueToString(list);
%>
<%=json%>
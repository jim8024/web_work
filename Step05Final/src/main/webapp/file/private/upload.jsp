
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	//파일 시스템 사에서 webapp의 upload 포더까지 절대 경로를 얻어낸다.
	String realPath=application.getRealPath("/upload");
	//해당 경로에 access 할 수 있는 파일 객체 생성
	File f=new File(realPath);
	if(!f.exists()){
		f.mkdir(); //uplaod 폴더 만들기
	}
	MultipartRequest mr=new MultipartRequest(request,//내부적으로 필요한 request 객체 전달
			realPath,//업로드된 파일을 저장할 경로
			1024*1024*100,//업로드 사이즈 제한
			"utf-8",//한글 파일명 꺠지지 않도록
			new DefaultFileRenamePolicy());//동일한 파일이 존재하면 파일을 rename해서 저장
			//위의 MultipartRequest 객체가 Exception이 발생하지 않고 잘 생성이 되면 파일 업로드는 성공된것이다
			//따라서 mr에 들어있는 참조값을 이용해서 폼전송된 값을 추춘해서 DB에 저장만 잘 하면 된다.
	String title=mr.getParameter("title");
	String writer=(String)session.getAttribute("id");
	String orgFileName=mr.getOriginalFileName("myFile");
	String saveFileName=mr.getFilesystemName("myFile");
	long fileSize=mr.getFile("myFile").length();
	FileDto dto=new FileDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setOrgFileName(orgFileName);
	dto.setSaveFileName(saveFileName);
	dto.setFileSize(fileSize);
	
	boolean isSuccess=FileDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>upload.jsp</title>
</head>
<body>
	
		
		<%if(isSuccess){ %>
			<p>
				<strong><%=writer %></strong>님 업로드한 <%=orgFileName %>파일을 저장했습니다
				<a href="${pageContext.request.contextPath}/file/list.jsp">목록보기</a>
			</p>
			<p><%=realPath %></p>
			<%}else{ %>
				
			<%} %>
	
</body>
</html>
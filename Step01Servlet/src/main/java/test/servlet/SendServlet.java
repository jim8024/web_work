package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dto.MemberDto;

@WebServlet("/send")
public class SendServlet extends HttpServlet{
	/*
	 * service() 메소드에는 2개의 객체의 참조값이 매게 변수에 전달된다.
	 * 
	 * HttpServletRequest객체=>요청과 관련된 작업을 처리할때 사용한다  
	 * HttpServletResponse객체=>응답과 관련된 작업을 처리할때 사용한다.
	 */
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//msg라는 파라미터명으로 전달되는 문자열을 읽어와서  msg라는 지역변수에
		//해당 파라미터명으로 전달되는 정보가 없으면 null이 리턴된다.
		String msg=req.getParameter("msg");
		
		System.out.println("msg:"+msg);
		 //응답 인코딩 설정
	      resp.setCharacterEncoding("utf-8");
	      //응답 컨텐트 설정
	      resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw=resp.getWriter();
		  pw.println("<!doctype html>");
	      pw.println("<html>");
	      pw.println("<head>");
	      pw.println("<meta charset='utf-8'>");
	      pw.println("<title>메세지 전송결과 페이지</title>");
	      pw.println("</head>");
	      pw.println("<body>");
	      pw.println("<p>메세지 잘 받았어 클라이언트야</p>");
	      pw.println("</body>");
	      pw.println("</html>");
	      pw.close();
	   }
	}


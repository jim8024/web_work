package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/send2")
public class SendServelt2 extends HttpServlet{
@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

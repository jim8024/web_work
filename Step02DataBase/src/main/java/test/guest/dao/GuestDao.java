package test.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.guest.dto.GuestDto;
import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class GuestDao {
	private static GuestDao dao;
	
	private GuestDao() {}

public static GuestDao getInstance() {
    //서버 시작후 최초 요청이라면
    if(dao==null) {
       //객체를 생성해서 static 필드에 저장해 놓는다.
       dao=new GuestDao();
    }
    //필드에 저장된 참조값 리턴해주기
    return dao;
 }

//글 하나의 정보를 DB 에 저장하는 메소드 
public boolean insert(GuestDto dto) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	int rowCount = 0;
	try {
		conn = new DbcpBean().getConn();
		String sql = "INSERT INTO board_guest"
				+ " (num, writer, content, pwd, regdate)"
				+ " VALUES(board_guest_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
		pstmt = conn.prepareStatement(sql);
		//실행할 sql 문이 미완성이라면 여기서 완성
		pstmt.setString(1, dto.getWriter());
		pstmt.setString(2, dto.getContent());
		pstmt.setString(3, dto.getPwd());
		//sql 문을 수행하고 변화된(추가, 수정, 삭제된) row 의 갯수 리턴 받기
		rowCount = pstmt.executeUpdate();
	} catch (SQLException se) {
		se.printStackTrace();
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}
	//만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
	if (rowCount > 0) {
		return true;
	} else {
		return false;
	}
}

//전체 글의 목록을 리턴해주는 메소드 
public List<GuestDto> getList(){
	//글목록을 담을 객체를 미리 생성
	List<GuestDto> list=new ArrayList<>();
	//필요한 객체의 참조값을 담을 지역변수 미리 만들기
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		//DbcpBean 객체를 이용해서 Connection 객체를 얻어온다(Connection Pool 에서 얻어오기)
		conn = new DbcpBean().getConn();
		//실행할 sql 문 
		String sql = "SELECT num, writer, content, pwd, regdate"
				+ " FROM board_guest"
				+ " ORDER BY num DESC";
		pstmt = conn.prepareStatement(sql);
		//sql 문이 미완성이라면 여기서 완성

		//select 문 수행하고 결과값 받아오기
		rs = pstmt.executeQuery();
		//반복문 돌면서 ResultSet 에 담긴 내용 추출
		while (rs.next()) {
			GuestDto dto=new GuestDto();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setContent(rs.getString("content"));
			dto.setPwd(rs.getString("pwd"));
			dto.setRegdate(rs.getString("regdate"));//날짜도 getString() 으로 읽어온다.
			//글정보가 담긴 dto 를 ArrayList 객체에 누적시킨다.
			list.add(dto);
		}
	} catch (SQLException se) {
		se.printStackTrace();
	} finally {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close(); //Connection 이 Connection Pool 에 반납된다.
		} catch (Exception e) {
		}
	}
	return list;
}

//회원 정보를 
public GuestDto getData(int num){
	   //회원 목록을 담을 객체 미리 생성하기 
		GuestDto dto=null;
	   
	   //필요한 객체의 참조값을 담을 지역변수 미리 만들기
	   Connection conn=null;
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;
	   try {
	      //DbcpBean 객체를 이용해서 Connection 객체를 얻어온다(Connection Pool 에서 얻어오기)
	      conn=new DbcpBean().getConn();
	      //실행할 sql 문 
	      String sql="select num, writer, content, pwd, regdate"
	      		+ " from board_guest"
	      		+ " where num=?";
	      pstmt=conn.prepareStatement(sql);
	      //sql 문이 미완성이라면 여기서 완성
	      pstmt.setInt(1, num);
	      //select 문 수행하고 결과값 받아오기
	      rs=pstmt.executeQuery();
	      //반복문 돌면서 ResultSet 에 담긴 내용 추출
	      while(rs.next()) {
	         dto=new GuestDto();
	         dto.setNum(rs.getInt("num"));
	         dto.setWriter(rs.getString("writer"));
	         dto.setContent(rs.getString("content"));
	         dto.setPwd(rs.getString("pwd"));
	         dto.setRegdate(rs.getString("regdate"));
	      }
	   }catch(SQLException se) {
	      se.printStackTrace();
	   }finally {
	      try {
	         if(rs!=null)rs.close();
	         if(pstmt!=null)pstmt.close();
	         if(conn!=null)conn.close(); //Connection 이 Connection Pool 에 반납된다.
	      }catch(Exception e) {}
	   }
	   //회원 목록이 담긴 ArrayList 객체 리턴해주기
		return dto;
	}

//회원 한명의 정보를 삭제하는 메소드
public boolean delete(GuestDto dto) {
   //필요한 객체를 담을 지역 변수를 미리 만들기
   Connection conn = null;
   PreparedStatement pstmt = null;
   //insert, update, delete 작업을 통해서 변화된(추가, 수정, 삭제) row 의 갯수를 담을 변수
   int rowCount = 0; //초기값을 0으로 부여한다. 
   try {
      //Connection 객체의 참조값 얻어오기
 	  conn=new DbcpBean().getConn();
      //실행할 sql 문
      String sql = "DELETE FROM board_guest"
            + " WHERE num=? and pwd=?";
      //sql 문을 대신 실행해줄 PreparedStatement 객체의 참조값 얻어오기
      pstmt = conn.prepareStatement(sql);
      //sql 문이 ? 가 존재하는 미완성이라면 여기서 완성한다.
      pstmt.setInt(1, dto.getNum());
      pstmt.setString(2, dto.getPwd());
      // insert or update or delete 문을 실제 수행한다. 변화된 row 의 갯수가 리턴된다.
      rowCount = pstmt.executeUpdate();//수행하고 리턴되는값을 변수에 담는다.
   } catch (Exception e) {
      e.printStackTrace();
   } finally { //예외가 발생을 하던 안하던 실행이 보장되는 블럭에서 마무리 작업
      try {
         if (pstmt != null)
            pstmt.close();
         if (conn != null)
            conn.close();
      } catch (Exception e) {
      }
   }
   //변화된 row 의 갯수가 0 보다 크면 작업 성공
   if (rowCount > 0) {
      return true;
   } else {//그렇지 않으면 작업 실패
      return false;
   }
}
//회원 한명의 정보를 수정하고 해당 작업의 성공여부를 리턴해주는 메소드
public boolean update(GuestDto dto) {
   //필요한 객체를 담을 지역 변수를 미리 만들기
   Connection conn = null;
   PreparedStatement pstmt = null;
   //insert, update, delete 작업을 통해서 변화된(추가, 수정, 삭제) row 의 갯수를 담을 변수
   int rowCount = 0; //초기값을 0으로 부여한다. 
   try {
      //Connection 객체의 참조값 얻어오기
 	  conn = new DbcpBean().getConn();
      //실행할 sql 문
      String sql = "UPDATE borad_guest"
            + " SET writer=?, content=?,regdate=SYSDATE,"
            + " WHERE num=? and pwd=?";
      //sql 문을 대신 실행해줄 PreparedStatement 객체의 참조값 얻어오기
      pstmt = conn.prepareStatement(sql);
      //sql 문이 ? 가 존재하는 미완성이라면 여기서 완성한다.
      pstmt.setString(1, dto.getWriter());
      pstmt.setString(2, dto.getContent());
      pstmt.setInt(3, dto.getNum());
      pstmt.setString(4, dto.getPwd());
      // insert or update or delete 문을 실제 수행한다. 변화된 row 의 갯수가 리턴된다.
      rowCount = pstmt.executeUpdate();//수행하고 리턴되는값을 변수에 담는다.
   } catch (Exception e) {
      e.printStackTrace();
   } finally { //예외가 발생을 하던 안하던 실행이 보장되는 블럭에서 마무리 작업
      try {
         if (pstmt != null)
            pstmt.close();
         if (conn != null)
            conn.close();
      } catch (Exception e) {
      }
   }
   //변화된 row 의 갯수가 0 보다 크면 작업 성공
   if (rowCount > 0) {
      return true;
   } else {//그렇지 않으면 작업 실패
      return false;
   }
}
}
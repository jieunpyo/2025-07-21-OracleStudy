package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.vo.YES24VO;
// => Adapter Pattern 
public class YES24DAO {
	   private Connection conn; // 오라클 연결 
	   private PreparedStatement ps; // 송수신 => SQL 전송 => 결과값을 메모리 저장
	   private static YES24DAO dao; // DAO객체를 한사람당 1개씩만 사용 
	   // 메모리 공간을 한개만 생성 => 메모리 누수현상을 방지 = 싱글턴 
	   private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	   // 변경할 수 없다 ======================>@localhost (ip) port:1521 XE:데이터베이스(폴더)
	   // se(XE) pe(ORCL) 
	   private final int rowSize=10;
	   // 1. 드라이버 등록 
	   public YES24DAO()
	   {
		   try
		   {
			   Class.forName("oracle.jdbc.driver.OracleDriver");
			   // 리플렉션 => 클래스이름 변수,메소드,생성자 => 제어할 수 있게 만든 프로그램 
			   // MyBatis / Spring 
			   // oracle.jdbc.driver.OracleDriver = DriverManager
		   }catch(Exception ex) {}
	   }
	   // 2. 싱글턴 => 반드시 static : 메모리 공간이 한개만 생성 
	   /*
	    *   가비지컬렉션 : 사용하지 않거나 / null 인 상태의 객체의 메모리 회수 
	    *   ---------- 메모리가 커지면서 역할을 잘 못한다 : 프로그램 종료시 회수 
	    */
	   public static YES24DAO newInstance()
	   {
		   if(dao==null)
			   dao=new YES24DAO();
		   return dao;
	   }
	   // 반복 제거 => 연결 / 해제 
	   // 메소드는 한개의 기능을 가지고 있다 
	   // 반복코딩 / 재사용 / 다른 클래스 통신 / 단락 나누기 
	   public void getConnection()
	   {
		   try
		   {
			   conn=DriverManager.getConnection(URL,"hr","happy");
		   }catch(Exception ex) {}
	   }
	   public void disConnection()
	   {
		   try
		   {
			   if(ps!=null) ps.close();
			   // OutputStream / BufferedReader 
			   if(conn!=null) conn.close();
			   // conn => Socket
		   }catch(Exception ex) {}
	   }
	   /*
			NO        NOT NULL NUMBER        
			CON                NUMBER        
			RANK      NOT NULL NUMBER        
			TITLE     NOT NULL VARCHAR2(200) 
			AUTHOR             VARCHAR2(200) 
			IMAGE              VARCHAR2(500) 
			PUBLISHER          VARCHAR2(200) 
			PRICE              VARCHAR2(50)  
			STATE              CHAR(6)       
			IDCREMENT          NUMBER 
	    */
	   public void YES24Insert(YES24VO vo)
	   {
		   try
		   {
			   getConnection();
			   String sql="INSERT INTO yes24(no,cno,rank,title,author,"
					     +"image,publisher,price,state,idcrement) "
					     +"VALUES(yes_no_seq.nextval,?,?,?,?,?,?,?,?,?)";
			    ps = conn.prepareStatement(sql);
	            ps.setInt(1, vo.getCno());
	            ps.setInt(2, vo.getRank());
	            ps.setString(3, vo.getTitle());
	            ps.setString(4, vo.getAuthor());
	            ps.setString(5, vo.getImage());
	            ps.setString(6, vo.getPublisher());
	            ps.setString(7, vo.getPrice());
	            ps.setString(8, vo.getState());
	            ps.setInt(9, vo.getIdcrement());
			    ps.executeUpdate();
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
	   }
	   
	   public List<YES24VO> genieListData(int cno)
	   {
		   List<YES24VO> list=
				   new ArrayList<YES24VO>();
		   try
		   {
			   getConnection();
			   String sql="SELECT /*+ INDEX_ASC(yes24 yes_no_pk) */no,rank,title,author,"
					   +"image,publisher,price,state,idcrement "
					   +"FROM yes24 "
					   +"WHERE cno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, cno);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				    YES24VO vo=new YES24VO();
				    vo.setNo(rs.getInt(1));
	                vo.setRank(rs.getInt(2));
	                vo.setTitle(rs.getString(3));
	                vo.setAuthor(rs.getString(4));
	                vo.setImage(rs.getString(5));
	                vo.setPublisher(rs.getString(6));
	                vo.setPrice(rs.getString(7));
	                vo.setState(rs.getString(8));
	                vo.setIdcrement(rs.getInt(9));
			   }
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return list;
	   }
	   
}
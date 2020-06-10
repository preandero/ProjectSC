package cs_board.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import common.DataBase_query;
import pos.beans.MemberDTO;


public class CS_WriteDAO {

   Connection conn = null;
   Statement stmt = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;

   //Connection 생성하기
   public CS_WriteDAO() {
      try {
         Class.forName(DataBase_query.DRIVER);
         conn = DriverManager.getConnection(DataBase_query.URL, DataBase_query.USERID, DataBase_query.USERPW);
         System.out.println("WriteDAO생성, 데이터베이스 연결!!");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   
   //DB자원반납 메소드
   public void close() throws SQLException {
      if (rs != null) rs.close();
      if (stmt != null) stmt.close();
      if (pstmt != null) pstmt.close();
      if (conn != null) conn.close();
   }// end close()

   
   // 새글 작성 <---DTO
   public int insert(CS_WriteDTO dto) throws SQLException {
            
      String subject=dto.getSubject();            
      String content=dto.getContent();
      int mem_uid=dto.getM_uid();

      int cnt = this.insert(subject, content, mem_uid);
      return cnt;
   }//end insert

   
   // 새글 작성 <-- 제목, 내용
   public int insert(String subject, String content, int mem_uid) throws SQLException {
      int cnt = 0;

      try {   
         pstmt = conn.prepareStatement(DataBase_query.SQL_WRITE_INSERT);
         pstmt.setString(1, subject);
         pstmt.setString(2, content);
         pstmt.setInt(3, mem_uid);
         cnt = pstmt.executeUpdate();

      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         close();
      }
      return cnt;
   }//end insert

   
   
   // ResultSet --> DTO 배열로 return
   public CS_WriteDTO[] createArray(ResultSet rs) throws SQLException {
      
      CS_WriteDTO[] arr = null;   //DTO 배열 초기화
      ArrayList<CS_WriteDTO> list = new ArrayList<CS_WriteDTO>();
      
         
      while(rs.next()){
         int uid = rs.getInt("cs_uid");
         String subject = rs.getString("cs_subject");
         String content = rs.getString("cs_content");
         String mem_id = rs.getString("mem_id");
         Date d = rs.getDate("cs_regdate");
         Time t = rs.getTime("cs_regdate");
//         int m_uid=rs.getInt("mem_uid");
//         String name = rs.getString("cs_name");
         //위에 Date, Time 은  java.sql 걸로 돌아감
         
         String regDate="";
         if(d != null){
            regDate = new SimpleDateFormat("yyyyMMdd").format(d)+" "+
                     new SimpleDateFormat("hhmmss").format(t);
         }
   
         CS_WriteDTO dto = new CS_WriteDTO(uid, subject, content, mem_id);
         dto.setRegDate(regDate);
         list.add(dto);
      }//end while
      
      int size = list.size();
      if(size == 0 ) return null;
      arr = new CS_WriteDTO[size];
      list.toArray(arr);
      
      return arr;
   
   }// end createArray
   
   
   //전체 SELECT
   public CS_WriteDTO [] select() throws SQLException{
      
      CS_WriteDTO[] arr =null;
      try {
         pstmt = conn.prepareStatement(DataBase_query.SQL_WRITE_SELECT);
         rs= pstmt.executeQuery();
         arr = createArray(rs);
      }finally {
         close();
      }
   
      return arr;
   }//end select
   

   //특정 uid의 글 내용 읽기, 조회수 증가
   
   public CS_WriteDTO[] readByUid(int uid) throws SQLException{
      
      CS_WriteDTO[] arr = null;
      
      try {
         //트랜잭션 처리
         //Auto - commit 비 활성화
         
         conn.setAutoCommit(false);
         
         
         pstmt = conn.prepareStatement(DataBase_query.SQL_WRITE_SELECT_BY_UID);
         pstmt.setInt(1, uid);
         rs = pstmt.executeQuery();
         
         arr= createArray(rs);
         conn.commit();
         
      } catch (Exception e) {
         e.printStackTrace();
         conn.rollback();
         throw e;
      }finally {
         close();
      }
      return arr;
      
   }//end readByUid
   
   
   
   //특정 uid 의 글 만 select
   public CS_WriteDTO[] selectByUid(int uid) throws SQLException{
      CS_WriteDTO[] arr =null;
      try {
         pstmt=conn.prepareStatement(DataBase_query.SQL_WRITE_SELECT_BY_UID);
         pstmt.setInt(1, uid);
         rs=pstmt.executeQuery();
         arr=createArray(rs);
         
      }finally {
         close();
      }
      
      return arr;
      
   }//end selectByUid
   
   
   //특정 uid의 글 수정(제목 , 내용)
   public int update(int uid, String subject, String content) throws SQLException{
      
      int cnt = 0;
      try {
         //트랜잭션 실행
         pstmt = conn.prepareStatement(DataBase_query.SQL_WRITE_UPDATE);
         pstmt.setString(1, subject);
         pstmt.setString(2, content);
         pstmt.setInt(3, uid);
         
         cnt = pstmt.executeUpdate();
      }finally {
         close();
      }
      
      return cnt;
      
   }//end update
   
   //특정 uid 글 삭제하기
   public int deleteByUid(int uid) throws SQLException{
      int cnt = 0;
      
      try {
         pstmt = conn.prepareStatement(DataBase_query.SQL_WRITE_DELETE_BY_UID);
         pstmt.setInt(1, uid);
         cnt = pstmt.executeUpdate();
      }finally {
         close();
      }
      
      return cnt;
   }//end deleteByUid
   
   // 모든 게시판 가져오기 (member_tb)에 있는 id를 참조를 해서... [SELECT]
   public CS_WriteDTO[] selectCSbyId(int uid) throws SQLException{
      CS_WriteDTO[] arr = null;
      
      try {
      pstmt=conn.prepareStatement(DataBase_query.SQL_SELECT_UID);
      pstmt.setInt(1, uid);
      rs=pstmt.executeQuery();
      arr=createArray(rs);
      } finally {
         close();
      }
      
      return arr;
   } 
   
   
   
}
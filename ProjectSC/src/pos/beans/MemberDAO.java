package pos.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.DataBase_query;

public class MemberDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// DAO 객체가 생성될때 Connection 도 생성된다.
		public MemberDAO() {
			
			try {
				Class.forName(DataBase_query.DRIVER);
				conn = DriverManager.getConnection(DataBase_query.URL, DataBase_query.USERID, DataBase_query.USERPW);
				System.out.println("WriteDAO 생성, 데이터 베이스 연결!");
			} catch(Exception e) {
				e.printStackTrace();
			}		
			
		} // 생성자
		
		// DB 자원 반납 메소드,
		public void close() throws SQLException {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} // end close()
		
		
		// 회원가입해서 DB 에 INSERT
		public int insert(String id, String pw, String name, String email, int phonenum) throws SQLException{
			int cnt = 0;
			
			try {
				pstmt = conn.prepareStatement(DataBase_query.SQL_MEM_INSERT);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.setString(4, email);
				pstmt.setInt(5,phonenum);
				cnt = pstmt.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
		}
		
		
		// 로그인 했을때 DB에서 mem_uid를 SELECT
//		public MemberDTO [] createArray (ResultSet rs) throws SQLException{
//			MemberDTO [] arr = null;  // DTO 배열
//			
//			ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
			
//			while(rs.next()) {
//				int uid = rs.getInt("mem_uid");
//				String id = rs.getString("mem_id");
//				String pw = rs.getString("mem_pw");
//				String name = rs.getString("mem_name");
//				String email = rs.getInt("mem_email");
//				int phonenum = rs.getDate("mem_phonenum");
//				Date d = rs.getTime("mem_sub_regdate");
//				
//				String regDate = "";
//				if(d != null){
//					regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
//							+ new SimpleDateFormat("hh:mm:ss").format(t);
//				}
//				
//				WriteDTO dto = new WriteDTO(uid, subject, content, name, viewCnt);
//				dto.setRegDate(regDate);
//				list.add(dto);
//				

//		}
		
		// 회원가입후 이용권 결제완료 됬을때 정보가 DB에 UPDATE 상황
//		public int insert(String id, String pw, String name, String email, int phonenum) throws SQLException{
//			int cnt = 0;
//			
//			try {
//				pstmt = conn.prepareStatement(DataBase_query.SQL_MEM_INSERT);
//				pstmt.setString(1, id);
//				pstmt.setString(2, pw);
//				pstmt.setString(3, name);
//				pstmt.setString(4, email);
//				pstmt.setInt(5,phonenum);
//				cnt = pstmt.executeUpdate();
//				
//			} catch(Exception e) {
//				e.printStackTrace();
//			} finally {
//				close();
//			}
//			return cnt;
//		}
		
		
	
} // PaySuccessDAO{}

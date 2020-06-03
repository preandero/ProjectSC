package pos.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
		
		// 이용권 성공 --> 디비에 저장
		public int insert(int period, int price, String pay_method, String email) throws SQLException{
			int cnt = 0;
			
			try {
				pstmt = conn.prepareStatement(DataBase_query.SQL_MEM_SUB_UPDATE);
				pstmt.setInt(1, period);
				pstmt.setInt(2, price);
				pstmt.setString(3, pay_method);
				pstmt.setString(4, email);
				
				cnt = pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
		}
	
} // PaySuccessDAO{}

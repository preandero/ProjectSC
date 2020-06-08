package pos.beans;

import java.sql.Connection;
import java.sql.Date;
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
		
		
//		// 회원가입해서 DB 에 INSERT
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
//
//
//	} 


	// 회원 가입 INSERT
	public int insertJoin(String id, String pw, String email, String phoneNum,
			String storeName, String location, String storePhone ) throws SQLException {
		int cnt = 0;
		int mem_uid = 0;
		try {
			
			// 자동 생성된 컬럼의 이름(들)이 담긴 배열 준비(auto-generated keys) 받아오기
			String[] generatedCols = {"mem_uid"};
			
			// 회원가입 성공 이후 DB에 저장 member_tb
			pstmt = conn.prepareStatement(DataBase_query.SQL_MEM_INSERT, generatedCols);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, email);
			pstmt.setString(4, phoneNum);
			
			cnt = pstmt.executeUpdate();
			
			// auto-generated Keys 값 뽑아오기
			rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				mem_uid = rs.getInt(1); // 첫번째 컬럼
			}
			pstmt.close();
			cnt = 0;

			// 회원가입이 성공적으로 들어갔을 경우, store info 저장
			pstmt = conn.prepareStatement(DataBase_query.SQL_STORE_INFO_INSERT);
			pstmt.setString(1, storeName);
			pstmt.setString(2, location);
			pstmt.setString(3, storePhone);
			pstmt.setInt(4, mem_uid);
			cnt = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}


	// 로그인 했을때 DB에서 mem_uid를 SELECT
	public MemberDTO[] selectByIdPw(String id, String pw) throws SQLException{
		MemberDTO[] arr = null;
		
		try {
		pstmt = conn.prepareStatement(DataBase_query.SQL_MEM_CHK);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
		arr = createArray(rs);
		}finally {
			close();
		}
		return arr;
	}
	
	public int insertpayInfo(int period, int payment, String pay_method, int mem_uid) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(DataBase_query.SQL_PAYINFO_INSERT);
			pstmt.setInt(1, period);
			pstmt.setInt(2, payment);
			pstmt.setString(3, pay_method);
			pstmt.setInt(4, mem_uid);
			
			cnt = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public MemberDTO[] createArray(ResultSet rs) throws SQLException {
		MemberDTO[] arr = null; // DTO 배열

		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();

		while (rs.next()) {
			int uid = rs.getInt("mem_uid");
			String id = rs.getString("mem_id");
			String pw = rs.getString("mem_pw");
			String phonenum = rs.getString("mem_phonenum");
			String email = rs.getString("mem_email");
			Date regdate = rs.getDate("mem_sub_regdate");
			int period = rs.getInt("mem_sub_period");
			int payment = rs.getInt("mem_sub_payment");
			String method = rs.getString("mem_sub_method");

			MemberDTO dto = new MemberDTO(uid, id, pw, email, phonenum, regdate, period, payment, method);
			list.add(dto);

		} // while
		int size = list.size();

		if (size == 0)
			return null;

		arr = new MemberDTO[size];
		list.toArray(arr); // List -> 배열
		return arr;

	}
	
	public MemberDTO[] select() throws SQLException{
		MemberDTO[] arr = null;
		pstmt = conn.prepareStatement(DataBase_query.SQL_MEM_SELECT);
		rs = pstmt.executeQuery();
		arr = createArray(rs);
		return arr;
	}
	
	public Date periodSelectByIdPw(String id, String pw) throws SQLException{
		
		Date period = null;
		try {
		pstmt = conn.prepareStatement(DataBase_query.SQL_MEM_PERIOD);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
		
		period = rs.getDate(0);
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return period;
		
	}


} // PaySuccessDAO{}

package cs_board.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.DataBase_query;

public class FileDAO {

	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public FileDAO() {

		try {
			Class.forName(DataBase_query.DRIVER);
			conn = DriverManager.getConnection(DataBase_query.URL, DataBase_query.USERID, DataBase_query.USERPW);
			System.out.println("FileDAO생성, 데이터베이스 연결!!");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	} //end 생성자
	
	// DB 자원 반납 메소드, 만들어놓으면 편함..
		public void close() throws SQLException{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} // end close();

	public int insert(int cs_Uid,
			List<String> originalFileNames,
			List<String> fileSystemNames) throws SQLException{
		
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(DataBase_query.SQL_FILE_SELECT);
			for(int i = 0; i< originalFileNames.size(); i++) {
				pstmt.setString(1, originalFileNames.get(i));
				pstmt.setString(2, fileSystemNames.get(i));
				pstmt.setInt(3, cs_Uid);
				cnt += pstmt.executeUpdate();
			}//end for
		} finally {
			close();
		}
		
		return cnt;
		
		
	}
	
	
	// ResultSet --> DTO배열로 리턴
		public FileDTO[] createArray(ResultSet rs) throws SQLException{
			FileDTO arr[] = null;   // DTO 배열로 리턴할거다
			ArrayList<FileDTO> list = new ArrayList<FileDTO>();
			
			while(rs.next()){
				int uid = rs.getInt("bf_uid");
				String source = rs.getString("bf_source");
				String file = rs.getString("bf_file");

				FileDTO dto = new FileDTO(uid, source, file);
				list.add(dto);
			}//end while		
			
			arr = new FileDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큰의 배열 생성
			list.toArray(arr); //리스트에 저장된 데이터를 배열 객체에 복사
			return arr;
		} // end createArray()

		// 특정 wr_uid 의 첨부파일(들) 정보 SELECT
		public FileDTO[] selectFilesByWrUid(int csUid) throws SQLException{

			FileDTO arr[] = null;
			try{
				// 트랜잭션 처리
				pstmt = conn.prepareStatement(DataBase_query.SQL_FILE_SELECT);
				pstmt.setInt(1, csUid);
				rs = pstmt.executeQuery();
				
				arr = createArray(rs);
			}finally{
				close();
			} // end try		
			return arr;
		} // end selectFilesByWrUid()


		// 특정 bf_uid 의 첨부파일 정보 SELECT
		public FileDTO[] selectByUid(int uid) throws SQLException{

			FileDTO arr[] = null;
			try{
				// 트랜잭션 처리
				pstmt = conn.prepareStatement(DataBase_query.SQL_FILE_SELECT_BY_UID);
				pstmt.setInt(1, uid);
				rs = pstmt.executeQuery();
				
				arr = createArray(rs);
			}finally{
				close();
			} // end try	
			
			return arr;
		} // end selectByUid()


	
}

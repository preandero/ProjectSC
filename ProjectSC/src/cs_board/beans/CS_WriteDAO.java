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
import java.util.List;

import common.DataBase_query;


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
				
		int mem_uid=dto.getMem_uid();
		String subject=dto.getSubject();				
		String content=dto.getContent();

		int cnt = this.insert(subject, content,mem_uid);
		return cnt;
	}//end insert

	
	// 새글 작성 <-- 제목, 내용
	public int insert(String subject, String content,int mem_uid) throws SQLException {
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

	//-------------------------------파일 첨부 게시글 -----------------------------
//	<-- 첨부파일들
public int insert(String subject, String content, int mem_uid, 
	//이미 파일은 cos 라이브러리 덕분에 저장되어있다.
	List<String> originalFileNames, List<String> fileSystemNames
	) throws SQLException {

		int cnt = 0;
		int uid = 0;  //insert 된 글의 cs_uid 값

try {
	//자동 생성된 컬럼의 이름들이 담긴 배열 준비 (auto-generated keys)
	String[] generatedCols = {"cs_uid"};
	
	//Statement 나 prepareStatement 생성시 두번째 매개변수로
	//auto -generated keys 배열 넘겨줌
	pstmt = conn.prepareStatement(DataBase_query.SQL_WRITE_INSERT, generatedCols);
	pstmt.setString(1, subject);
	pstmt.setString(2, content);
	pstmt.setInt(3, mem_uid);
	
	cnt = pstmt.executeUpdate();
	
	
	//auto-generated 값 뽑아오기
	rs=pstmt.getGeneratedKeys();
	if(rs.next()) {
		uid = rs.getInt(1);	//첫번째 컬럼
	}
	pstmt.close();
	//첨부파일 정보 테이블에 insert 하기
	pstmt = conn.prepareStatement(DataBase_query.SQL_FILE_INSERT);
	for(int i = 0; i<originalFileNames.size(); i++) {
		pstmt.setString(1, originalFileNames.get(i));
		pstmt.setString(2, fileSystemNames.get(i));
		pstmt.setInt(3, uid);
		pstmt.executeUpdate();
	}//end for
	
} catch (Exception e) {
	e.printStackTrace();
} finally {
	close();
}
return cnt;
}//end insert
	
	//-------------------------------파일 첨부 게시글 -----------------------------
	
	// ResultSet --> DTO 배열로 return
	public CS_WriteDTO[] createArray(ResultSet rs) throws SQLException {
		
		CS_WriteDTO[] arr = null;   //DTO 배열 초기화
		ArrayList<CS_WriteDTO> list = new ArrayList<CS_WriteDTO>();
		
			
		while(rs.next()){
			int uid = rs.getInt("cs_uid");
			String subject = rs.getString("cs_subject");
			String content = rs.getString("cs_content");
			Date d = rs.getDate("cs_regdate");
			Time t = rs.getTime("cs_regdate");
			int mem_uid = rs.getInt("mem_uid");
			String mem_id = rs.getString("mem_id");
//			int m_uid=rs.getInt("mem_uid");
//			String name = rs.getString("cs_name");
			//위에 Date, Time 은  java.sql 걸로 돌아감
			
			String regDate="";
			if(d != null){
				regDate = new SimpleDateFormat("yyyyMMdd").format(d)+" "+
							new SimpleDateFormat("hhmmss").format(t);
			}
	
			CS_WriteDTO dto = new CS_WriteDTO(uid, subject,regDate, content, mem_uid, mem_id);
			dto.setRegDate(regDate);
			list.add(dto);
		}//end while
		
		int size = list.size();
		if(size == 0 ) return null;
		arr = new CS_WriteDTO[size];
		list.toArray(arr);
		
		return arr;
	
	}// end createArray
	
public CS_WriteDTO[] createArraylist(ResultSet rs) throws SQLException {
		
		CS_WriteDTO[] arr = null;   //DTO 배열 초기화
		ArrayList<CS_WriteDTO> list = new ArrayList<CS_WriteDTO>();
		
			
		while(rs.next()){
			int uid = rs.getInt("cs_uid");
			String subject = rs.getString("cs_subject");
			String mem_id = rs.getString("mem_id");
			String content = rs.getString("cs_content"); //테스트
			Date d = rs.getDate("cs_regdate");
			Time t = rs.getTime("cs_regdate");
//			int m_uid=rs.getInt("mem_uid");
//			String name = rs.getString("cs_name");
			//위에 Date, Time 은  java.sql 걸로 돌아감
			
			String regDate="";
			if(d != null){
				regDate = new SimpleDateFormat("yyyyMMdd").format(d)+" "+
							new SimpleDateFormat("hhmmss").format(t);
			}
	
			CS_WriteDTO dto = new CS_WriteDTO(uid, subject, mem_id);
			dto.setRegDate(regDate);
			list.add(dto);
		}//end while
		
		int size = list.size();
		if(size == 0 ) return null;
		arr = new CS_WriteDTO[size];
		list.toArray(arr);
		
		return arr;
	
	}// end createArray




public CS_WriteDTO[] createArrayView(ResultSet rs) throws SQLException {
	
	CS_WriteDTO[] arr = null;   //DTO 배열 초기화
	ArrayList<CS_WriteDTO> list = new ArrayList<CS_WriteDTO>();
	
		
	while(rs.next()){
		int uid = rs.getInt("cs_uid");
		String subject = rs.getString("cs_subject");
		String content = rs.getString("cs_content");
		Date d = rs.getDate("cs_regdate");
		Time t = rs.getTime("cs_regdate");
		String mem_id = rs.getString("mem_id");
		int mem_uid=rs.getInt("mem_uid");
//		String name = rs.getString("cs_name");
		//위에 Date, Time 은  java.sql 걸로 돌아감
		
		String regDate="";
		if(d != null){
			regDate = new SimpleDateFormat("yyyyMMdd").format(d)+" "+
						new SimpleDateFormat("hhmmss").format(t);
		}

		CS_WriteDTO dto = new CS_WriteDTO(uid, subject, content, mem_id, mem_uid);
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
			
			arr= createArrayView(rs);
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
			arr=createArrayView(rs);
			
		}finally {
			close();
		}
		
		return arr;
		
	}//end selectByUid
	
	
	//특정 uid의 글 수정(제목 , 내용)
	public int update(String subject, String content, int uid) throws SQLException{
		
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
		rs=pstmt.executeQuery();
		arr=createArraylist(rs);
		} finally {
			close();
		}
		
		return arr;
	} 
	
	
	//-------------------------pagination ---------------------------
	//페이징관련 
		//몇번째 from부터 몇개 rows를 select 
		public CS_WriteDTO[] selectFromRow(int from, int rows) throws SQLException{
			CS_WriteDTO[] arr = null;
			
			try {
				pstmt = conn.prepareStatement(DataBase_query.SQL_WRITE_SELECT_FROM_ROW3);
				pstmt.setInt(1, from);
				pstmt.setInt(2, from+rows);
				rs= pstmt.executeQuery();
				arr = createArray(rs);
			}finally {
				close();
			}
			
			return arr;
		}// end selectFromRow()
		
		//전체 글의 개수
		public int countAll() throws SQLException{
			int cnt = 0 ;
			try {
				pstmt=conn.prepareStatement(DataBase_query.SQL_WRITE_COUNT_ALL);
				rs = pstmt.executeQuery();
				rs.next();
				cnt = rs.getInt(1);
			} finally {
				close();
			}
			return cnt;
		}//end countAll
		
		
	
	
	
}
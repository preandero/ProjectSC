package common;

public class DataBase_query {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@winetree94.io:1521:XE";
	public static final String USERID = "bini1004";
	public static final String USERPW = "soonmo1004";
	
	// 회원가입해서 DB 에 INSERT

	public static final String SQL_MEM_INSERT =
			"INSERT INTO member_tb "
			+ "(mem_uid, mem_id, mem_pw, mem_email, mem_phonenum) "
			+ "VALUES "
			+ "(SEQ_mem_uid.nextval, ?, ?, ?, ?)";

	// 회원가입 직후, store info 저장해줄 query
	public static final String SQL_STORE_INFO_INSERT = 
			"INSERT INTO storeinfo_tb "
			+ "(store_uid, store_name, store_loca, store_phonenum, mem_uid) "
			+ "VALUES "
			+ "(SEQ_store_uid.nextval, ?, ?, ?, ?)"
			;
	
	
	public static final String SQL_UPDATE_MEM = "UPDATE MEMBER_TB SET mem_id= ? ,MEM_PW = ? , MEM_EMAIL = ?,MEM_PHONENUM = ? WHERE MEM_UID = ? ";
			
	public static final String SQL_UPDATE_STORE = "UPDATE storeinfo_tb "
			+ "SET "
			+ "store_name = ?,"
			+ "store_loca = ?,"
			+ "store_phonenum = ? "
			+ "WHERE STORE_UID = ?";
	
	public static final String SQL_MEM_SELECT = 
			"SELECT * FROM member_tb";
	
	// 로그인시 확인할 id & pw 확인하기
	public static final String SQL_MEM_CHK = 
			"SELECT m.MEM_UID , m.MEM_ID , s.STORE_UID, m.MEM_SUB_PERIOD FROM member_tb m, storeinfo_tb s WHERE m.mem_id = ? AND m.mem_pw = ? AND m.MEM_UID = s.MEM_UID" ;
	
	public static final String SQL_PAYINFO_INSERT = 
			"UPDATE member_tb SET "
			+ "(mem_sub_regdate, mem_sub_period, mem_sub_payment, mem_sub_method) "
			+ "= "
			+ "(SELECT SYSDATE, ?, ?, ? FROM DUAL) "
			+ "where mem_uid = ?"
			;
	
	
	
//	CREATE TABLE order_detail
//	(
//		orderdetail_uid number NOT NULL,
//		orderdetail_price number NOT NULL,
//		orderdetail_menuname varchar2(40) NOT NULL,
//		orderdetail_quantity number NOT NULL,
//		order_uid number NOT NULL,
//		menu_uid number NOT NULL,
//		PRIMARY KEY (orderdetail_uid)
//	);
//
//
//	CREATE TABLE order_tb
//	(
//		order_uid number NOT NULL,
//		order_regdate date,
//		order_totalprice number,
//		store_uid number NOT NULL,
//		PRIMARY KEY (order_uid)
//	);

	// -------       pos_mgmt_query    start ---------------
	public static String SQL_MENU_INSERT = "insert into menu_tb values (SEQ_menu_uid.nextval, ?, ?, ?)";
	
//	public static String SQL_MENU_SELECT_ALL ="SELECT menu_name, menu_price FROM menu_tb WHERE store_uid = ?";
	public static String SQL_MENU_SELECT_ALL ="select * from menu_tb WHERE store_uid = ?";
	
	public static String SQL_MENU_DELETE = "delete from menu_tb where menu_uid = ?";
	
	public static String SQL_MENU_UPDATE = "update menu_tb set menu_name = ?, menu_price = ? where menu_uid = ?";  // 여기 해야해
	//세션 테스트용 쿼리
	public static String SQL_MENU_SELECT_ALL2 ="SELECT menu_name, menu_price FROM menu_tb where store_uid = ?";
	
	public static String SQL_MEM_PERIOD =  "SELECT (MEM_SUB_REGDATE + MEM_SUB_PERIOD) AS PERIOD  FROM MEMBER_TB WHERE mem_id = ? AND mem_pw = ?";
	
	// -------       pos_mgmt_query     end ---------------
	
	

	//---------------- POS 결제 후 ORDER TABLE에 저장 *시작점* ------------------
	
	// order table에 데이터 넣기
	public static String SQL_ORDER_INSERT = 
		"INSERT INTO order_tb (order_uid, order_regdate, order_totalprice, store_uid) " + 
		"VALUES " + 
		"(SEQ_order_uid.nextval, SYSDATE, ?, ?)";
	
	// order detail table 에 넣기
	public static String SQL_ORDER_DETAIL_INSERT = 
		"INSERT INTO order_detail_tb (order_uid, menu_uid, menu_quantity) " +
		"VALUES " + 
		"(?, ?, ?)";
	
	//---------------- POS 결제 후 ORDER TABLE에 저장 *끝점* ------------------
	
	//---------------- 매출 뽑기 -------------------------------
	public static String SQL_REVENUE_SELECT = 
		"SELECT SUM(order_totalprice) totalprice, " +
		"to_char(order_regdate, 'YYYY-MM-DD') AS daily " +
		"FROM " + 
		"order_tb " +
		"WHERE " +
		"to_char(ORDER_REGDATE , 'YYYY-MM-DD') >= '2013-05-01' " +
		"AND " +
		"to_char(ORDER_REGDATE , 'YYYY-MM-DD') <= '2020-06-13'" +
		"GROUP BY " +
		"to_char(ORDER_REGDATE , 'YYYY-MM-DD')";
		
	//---------------- 매출 뽑기 -------------------------------

	
	// -------	cs_tb_query	 start ---------------

	//게시글 추가 (C)
	public static final String SQL_WRITE_INSERT = "INSERT INTO cs_tb "
					+"(cs_uid, cs_subject, cs_content, cs_regdate,mem_uid)"
					+" VALUES(SEQ_cs_uid.nextval, ?, ?, sysdate,?)";
	
	// 1명 게시글 읽어오기(R)
	public static final String SQL_WRITE_SELECT_BY_UID = 
			"SELECT c.cs_uid, c.cs_subject, c.cs_content, c.cs_regdate, m.mem_id, m.mem_uid "+ 
			"FROM cs_tb c , member_tb m " + 
			"WHERE c.mem_uid = m.mem_uid AND c.cs_uid=?";
	
	// 모든 게시글 보여주기(R)
	public static final String SQL_WRITE_SELECT = 
			"SELECT * FROM cs_tb ORDER BY cs_uid DESC";
	
	//게시글 업데이트(U)
	public static final String SQL_WRITE_UPDATE = 
			"UPDATE (SELECT c.cs_uid, c.cs_subject, c.cs_content, c.cs_regdate, m.mem_id FROM cs_tb c , member_tb m WHERE c.mem_uid = m.mem_uid)"
			+"SET cs_subject = ?, cs_content = ?"
			+"WHERE cs_uid = ?";

	//게시글 삭제(D)
	public static final String SQL_WRITE_DELETE_BY_UID =
			"DELETE FROM cs_tb WHERE cs_uid = ?";
	
	// 모든 게시글 보여주기(R-1)
	public static final String SQL_SELECT_UID =
			"SELECT c.CS_UID, c.CS_SUBJECT, m.MEM_ID, c.CS_REGDATE " + 
			"FROM cs_tb c , member_tb m " + 
			"WHERE c.mem_uid = m.mem_uid";
	
	// 모든 게시글 보여주기(R-2 테스트 - 상빈)
	public static final String SQL_SELECT_UID2 =
			"SELECT c.CS_UID, c.CS_SUBJECT, c.CS_CONTENT, m.MEM_ID, c.CS_REGDATE " + 
					"FROM cs_tb c , member_tb m " + 
					"WHERE c.mem_uid = m.mem_uid";
	
	String test = "SELECT c.CS_UID, c.CS_SUBJECT, c.CS_CONTENT, m.MEM_ID, c.CS_REGDATE " + 
			"FROM cs_tb c , member_tb m " + 
			"WHERE c.mem_uid = m.mem_uid";
	
	// -------------------- pagination ----------------------------
	// 글 목록 전체 개수 가져오기
		public static final String SQL_WRITE_COUNT_ALL = 
				"SELECT count(*) FROM cs_tb";
		
		// fromRow 부터 pageRows 만큼 SELECT
		// (몇번째) 부터 (몇개) 만큼
		public static final String SQL_WRITE_SELECT_FROM_ROW =  
				"SELECT * FROM " + 
				"(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM cs_tb ORDER BY cs_uid DESC) T) " + 
				"WHERE RNUM >= ? AND RNUM < ?";
		
		public static final String SQL_WRITE_SELECT_FROM_ROW2 =  
//						"SELECT * FROM "+
						"SELECT c.CS_UID, c.CS_SUBJECT, c.CS_CONTENT, c.CS_REGDATE, c.MEM_UID, m.MEM_ID FROM cs_tb c, member_tb m WHERE c.mem_uid = m.mem_uid " + 
						"AND c.CS_UID >= ? AND c.CS_UID < ? order by c.cs_uid ASC";
		
		
		public static final String SQL_WRITE_SELECT_FROM_ROW3 =
				"select * from "
				+ "(select rownum as rnum, t.* "
				+ "from (SELECT c.CS_UID, c.CS_SUBJECT, c.CS_CONTENT, c.CS_REGDATE, c.MEM_UID, m.MEM_ID FROM cs_tb c, member_tb m WHERE c.mem_uid = m.mem_uid ORDER BY cs_uid DESC) t) "
				+ "where rnum >= ? and rnum < ?";
		
		
		public static final String SQL_GET_MEM_BY_UID = "SELECT * FROM MEMBER_TB WHERE MEM_UID = ?";
		
		public static final String SQL_GET_STORE_BY_UID = "SELECT * FROM STOREINFO_TB WHERE STORE_UID = ?";
		
		//첨부파일용 쿼리
		//특정 글 (wr_uid) 의 첨부파일 1개 insert
		public static final String SQL_FILE_INSERT =
				"insert into test_file"+"(bf_uid, bf_source, bf_file, cs_uid) "
				+"values"
				+"(test_file_seq.nextval, ?, ?, ?)"
				;
		
		
		//특정 글 (wr_uid) 의 첨부파일 들을 select  (0개일수도 여러개일 수 도 있음)
		public static final String SQL_FILE_SELECT = 
				"select bf_uid, bf_source, bf_file from test_file "
				+"where cs_uid = ? "
				+"order by bf_uid desc"
				;
		
		
		
		//특정 첨부파일 (bf_uid) 을 select 
		public static final String SQL_FILE_SELECT_BY_UID =
				"select bf_uid, bf_source, bf_file from test_file "
				+"where bf_uid = ?"
			 	;
		
		
		//특정 첨부파일 (bf_uid) 을 delete
		public static final String SQL_FILE_DELETE_BY_UID =
				"delete from test_file where bf_uid = ?"
				;
		
		//특정 글 (wr_uid)의 첨부파일들을 delete
		public static final String SQL_FILE_DELETE_BY_WRUID =
				"delete from test_file where cs_uid = ?"
				;
		

	
	
}
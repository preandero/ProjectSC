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
	
	public static final String SQL_MEM_SELECT = 
			"SELECT * FROM member_tb";
	
	// 로그인시 확인할 id & pw 확인하기
	public static final String SQL_MEM_CHK = 
			"SELECT * FROM member_tb WHERE mem_id = ? AND mem_pw = ?";
	
	public static final String SQL_PAYINFO_INSERT = 
			"UPDATE member_tb SET "
			+ "(mem_sub_regdate, mem_sub_period, mem_sub_payment, mem_sub_method) "
			+ "= "
			+ "(SELECT SYSDATE, ?, ?, ? FROM DUAL) "
			+ "where mem_uid = ?"
			;
	
	public static final String SQL_ORDER_INSERT = "INSERT INTO order_tb"
			+ "(order_uid, order_regdate, order_totalprice, store_uid)"
			+ "VALUES"
			+ "(SEQ_ORDER_UID.nextval, SYSDATE, ?, ?)";
	
	public static final String SQL_ORDER_DETAIL_INSERT = "INSERT INTO order_detail"
			+ "(orderdetail_uid, orderdetail_price, order_menuname, orderdetail_quantity, ?, ?)"
			+ "VALUES"
			+ "(SEQ_ORDER_UID.nextval, SYSDATE, ?, ?)";
	
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
	
	
	
	// -------	cs_tb_query	 start ---------------

	//게시글 추가 (C)
	public static final String SQL_WRITE_INSERT = "INSERT INTO cs_tb "
					+"(cs_uid, cs_subject, cs_content, cs_regdate,mem_uid)"
					+" VALUES(SEQ_cs_uid.nextval, ?, ?, sysdate,?)";
	
	// 1명 게시글 읽어오기(R)
	public static final String SQL_WRITE_SELECT_BY_UID = 
			"SELECT c.cs_uid, c.cs_subject, c.cs_content, c.cs_regdate, m.mem_id "+ 
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
				"SELECT * FROM " + 
						"(SELECT ROWNUM AS RNUM, T.* FROM (SELECT c.CS_UID, c.CS_SUBJECT, c.CS_CONTENT, m.MEM_ID, c.CS_REGDATE FROM cs_tb c, member_tb m WHERE c.mem_uid = m.mem_uid) T) " + 
						"WHERE RNUM >= ? AND RNUM < ?";

	
	
}
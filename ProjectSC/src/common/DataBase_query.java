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
	
	public static final String SQL = "";

	// -------       pos_mgmt_query    start ---------------
	public static String SQL_MENU_INSERT = "insert into menu_tb values (SEQ_menu_tb_menu_uid.nextval, ?, ?, ?)";
	
	public static String SQL_MENU_SELECT_ALL ="SELECT menu_name, menu_price FROM menu_tb WHERE store_uid = ?";
	
	//세션 테스트용 쿼리
	public static String SQL_MENU_SELECT_ALL2 ="SELECT menu_name, menu_price FROM menu_tb where store_uid = ?";
	
	// -------       pos_mgmt_query     end ---------------
	
	
	
	// -------	cs_tb_query	 start ---------------

	//게시글 추가 (C)
	public static final String SQL_WRITE_INSERT = "INSERT INTO cs_tb "
					+"(cs_uid, cs_subject, cs_content, mem_uid)"
					+" VALUES(cs_SEQ.nextval, ?, ?, ?)";
	
	// 1명 게시글 읽어오기(R)
	public static final String SQL_WRITE_SELECT_BY_UID = 
			"SELECT * FROM cs_tb WHERE mem_uid = ?";
	
	// 모든 게시글 보여주기(R)
	public static final String SQL_WRITE_SELECT = 
			"SELECT * FROM cs_tb ORDER BY cs_uid DESC";
	
	//게시글 업데이트(U)
	public static final String SQL_WRITE_UPDATE = 
			"UPDATE cs_tb SET cs_subject = ?, cs_content = ?, cs_regdate=?  WHERE mem_uid = ?";

	//게시글 삭제(D)
	public static final String SQL_WRITE_DELETE_BY_UID =
			"DELETE FROM cs_tb WHERE cs_uid = ?";
	
	
	
	
	
}

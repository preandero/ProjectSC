package common;

public class DataBase_query {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USERID = "scott0316";
	public static final String USERPW = "tiger0316";
	
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
	
}
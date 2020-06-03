package common;

public class DataBase_query {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USERID = "scott0316";
	public static final String USERPW = "tiger0316";
	
	// subscribe_tb database
	public static final String SQL_SUBSCRIBE_INSERT = 
			"INSERT INTO subscribe_tb "
			+ "(sub_uid, sub_regdate, sub_period, sub_payment, sub_method, sub_email, mem_uid) "
			+ "VALUES "
			+ "(SEQ_subscribe_uid.nextval, SYSDATE, ?, ?, ?, ?, 1)"
			;
}

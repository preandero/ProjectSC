package pos.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.DataBase_query;

public class OrderDetailDAO {

	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public OrderDetailDAO() {
		try {
			Class.forName(DataBase_query.DRIVER);
			conn = DriverManager.getConnection(DataBase_query.URL, DataBase_query.USERID, DataBase_query.USERPW);
			System.out.println("OrderDetailDAO 생성 성공!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException{
		if( rs != null) rs.close();
		if( stmt != null) stmt.close();
		if( pstmt != null) pstmt.close();
		if( conn != null) conn.close();
	}
	
	
	// ajax로 menu_uid, order_uid, menu_qty, ordered_price
	public int insert_into_ordertb(OrderDetailDTO dto) throws SQLException{
		int cnt = 0;
		return cnt;
	}
	
}

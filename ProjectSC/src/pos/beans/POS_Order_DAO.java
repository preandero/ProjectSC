package pos.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.DataBase_query;

public class POS_Order_DAO {

	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public POS_Order_DAO() {
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
	public int insertOrder(int totalPrice, int store_uid, int[] menu_uids, int[] qty) throws SQLException {
		int cnt = 0;
		int order_uid = 0;
		
		try {
			String[] generatedCols = {"order_uid"};
			pstmt = conn.prepareStatement(DataBase_query.SQL_ORDER_INSERT, generatedCols);
			
			pstmt.setInt(1, totalPrice);
			pstmt.setInt(2, store_uid);
			cnt = pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				order_uid = rs.getInt(1);
			}
			
			pstmt.close();
			
			if(menu_uids == null || menu_uids.length == 0 || qty == null || qty.length == 0 ) return 0;
			cnt = 0;
			for(int i = 0; i < menu_uids.length; i++) {
			pstmt = conn.prepareStatement(DataBase_query.SQL_ORDER_DETAIL_INSERT);
			pstmt.setInt(1, order_uid);
			pstmt.setInt(2, menu_uids[i]);
			pstmt.setInt(3, qty[i]);
			cnt += pstmt.executeUpdate();
			}
			
		} finally {
			close();
		}
		
		return cnt;
	}
	
}

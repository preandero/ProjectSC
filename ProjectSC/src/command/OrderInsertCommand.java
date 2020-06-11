package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pos.beans.POS_Order_DAO;

public class OrderInsertCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		POS_Order_DAO pdao = new POS_Order_DAO();
		HttpSession session = request.getSession();
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		String[] menus = request.getParameterValues("menu_uid");
		String[] quantities = request.getParameterValues("quantity");
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		int store_uid = (Integer)session.getAttribute("store_uid");
		
		// 파라미터 유효성 검증
		if(menus == null) {
			message.append("[메뉴가 인식되지 않았습니다.]");
		} else if(quantities == null) {
			message.append("[수량이 인식되지 않았습니다.]");
		} else if (totalPrice == 0) {
			message.append("[총금액이 인식되지 않았습니다.]");
		} else {
			try {
				
				// String[] 을 int[] 로 변환하기
				int[] menu_uids = new int[menus.length];
				int[] qty = new int[quantities.length];
				for(int i = 0; i < menu_uids.length; i++) {
					menu_uids[i] = Integer.parseInt(menus[i]);
					qty[i] = Integer.parseInt(quantities[i]);
				}
				
				cnt = pdao.insertOrder(totalPrice, store_uid, menu_uids, qty);
				if(cnt == 0) {
					message.append("[트랜잭션 실패 : 0 insert");
				} else {
					status = "OK";
				}
			} catch(SQLException e) {
				message.append("[유효하지 않은 parameter : 작성자 필수]");
			}
		} // if
		
		request.setAttribute("result", cnt);
		request.setAttribute("status", status);
		request.setAttribute("message", message.toString());
	}

}

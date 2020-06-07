package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pos.beans.MemberDTO;
import pos_mgmt.beans.WriteDAO;

public class PosMgmtAddCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();

		String menu_name = request.getParameter("menu_name");
		int menu_price = Integer.parseInt(request.getParameter("menu_price"));

		HttpSession session = request.getSession(false);
		
		
		int store_uid = (Integer)session.getAttribute("mem_uid"); // 임시


		if (menu_name != null && menu_name.trim().length() > 0) {

			try {
				cnt = dao.insert(menu_name, menu_price, store_uid);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end if
		request.setAttribute("pos_mgmt_add", cnt);
		// write 로 담았으니 꺼낼때도 write

	}// end execute

}

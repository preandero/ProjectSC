package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pos_mgmt.beans.WriteDAO;

public class PosMgmtUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		//업데이트 작업중입니다
		WriteDAO dao = new WriteDAO();
		int uid = Integer.parseInt(request.getParameter("uid"));
		String menu_update_name = request.getParameter("menu_update_name");
		int  menu_update_price = Integer.parseInt(request.getParameter("menu_update_price"));
		
		try {
			cnt = dao.update(uid, menu_update_name, menu_update_price);
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("update", cnt);
	}

}

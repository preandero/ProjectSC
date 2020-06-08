package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs_board.beans.CS_WriteDAO;

public class CSDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		CS_WriteDAO dao = new CS_WriteDAO();
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		try {
			cnt = dao.deleteByUid(uid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("delete", cnt);
	}

}

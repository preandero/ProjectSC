package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pos_mgmt.beans.WriteDAO;

public class PosMgmtDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();
		int uid = Integer.parseInt(request.getParameter("uid"));
		String[] uidlist = (request.getParameterValues("uid"));
		
		for(int i = 0; i < uidlist.length; i ++) {
			
			System.out.println(uidlist[i]);
			
		}
		
		try {
			
			
			cnt = dao.deleteByUid(uid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("delete", cnt);
	}

}

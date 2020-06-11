package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs_board.beans.CS_WriteDAO;
import cs_board.beans.CS_WriteDTO;

public class CSViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		HttpSession session=request.getSession(false);
		
		CS_WriteDTO[] arr = null;  //초기값
		CS_WriteDAO dao = new CS_WriteDAO();
		
//		int uid = (int)(session.getAttribute("mem_uid"));
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		
//		if(uid < 0 ) uid = 1;
		try {
			arr = dao.readByUid(uid);
			request.setAttribute("view", arr);
			
			System.out.println(uid);
			System.out.println((int)session.getAttribute("mem_uid"));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

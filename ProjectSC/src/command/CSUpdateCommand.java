package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs_board.beans.CS_WriteDAO;
import cs_board.beans.CS_WriteDTO;

public class CSUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		
		CS_WriteDTO[] arr = null;  //초기값
		CS_WriteDAO dao = new CS_WriteDAO();
		int uid = Integer.parseInt(request.getParameter("uid"));
		
//		if(uid < 0 ) uid = 1;
		try {
			arr = dao.selectByUid(uid);
			request.setAttribute("update", arr);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

}

package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs_board.beans.CS_WriteDAO;
import cs_board.beans.CS_WriteDTO;

public class CSViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
//		view는 uid로 봄
		
		CS_WriteDTO[] arr = null;  //초기값
		CS_WriteDAO dao = new CS_WriteDAO();
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		if(uid < 0 ) uid = 1;
		try {
			arr = dao.readByUid(uid);
			request.setAttribute("view", arr);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
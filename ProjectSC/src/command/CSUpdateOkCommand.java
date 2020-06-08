package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs_board.beans.CS_WriteDAO;

public class CSUpdateOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		CS_WriteDAO dao = new CS_WriteDAO();
		
		//매개변수 받아오기  .   매개변수들은 이제 전부다 request에 있다
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		
			try {
				cnt = dao.update(uid, subject, content);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		request.setAttribute("updateOk", cnt);
	}

}

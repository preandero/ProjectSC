package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs_board.beans.CS_WriteDAO;

public class CSWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		CS_WriteDAO dao = new CS_WriteDAO();
		
		//매개변수 받아오기  . 매개변수들은 이제 전부다 request에 있다

		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int mem_uid = Integer.parseInt(request.getParameter("mem_uid"));
		
		
		if(subject !=null 
				&& subject.trim().length()>0) {
			
			try {
				cnt = dao.insert(subject,content,mem_uid);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}//end if
		
		request.setAttribute("result", cnt);
		//result 로 담았으니 꺼낼때도 result
		
	}//end execute

}//end command

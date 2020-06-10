package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs_board.beans.CS_WriteDAO;

public class CSWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		CS_WriteDAO dao = new CS_WriteDAO();
		HttpSession session = request.getSession();
		//매개변수 받아오기  . 매개변수들은 이제 전부다 request에 있다
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int mem_uid = (int) session.getAttribute("mem_uid");
		String mem_id=request.getParameter("mem_id");
		
//		// 이게 진짜
//		if(subject !=null 
//				&& subject.trim().length()>0) {
//			
//			try {
//				cnt = dao.insert(subject,content,mem_uid);
//			}catch (Exception e) {
//				e.printStackTrace();
//			}
//			
//			
//		}//end if
//		//여기 까지 진짜
		// ------------ Ajax Response 에 필요한 값들-----------------------------------
				StringBuffer message = new StringBuffer();
				String status = "FAIL"; // 기본은 FAIL로 설정

				//유효성 체크
				if(subject == null || subject.trim().length() == 0){
					message.append("[유효하지않은 parameter: 글 제목(subject) 필수]");
				}else {
			
					try {
						cnt = dao.insert(subject, content, mem_uid);
						if(cnt == 0) {
							message.append("[트랜젝션 실패 : 0 insert");
						}else {
							status = "Ok";
						}
					} catch (Exception e) {
//						e.printStackTrace(); 
						message.append("[트랜젝션 에러 :" + e.getMessage()+"]");
					}
				} // end if
		
		request.setAttribute("result", cnt);
		//result 로 담았으니 꺼낼때도 result
		request.setAttribute("status", status);
		request.setAttribute("message", message.toString());
	}//end execute

}//end command

package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pos.beans.MemberDAO;
import pos.beans.MemberDTO;

public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO mdao = new MemberDAO();
		MemberDTO[] arr = null;
		HttpSession session = null;
		
		String id = request.getParameter("Id");
		String pw = request.getParameter("Password");
		
		if(id != null && id.trim().length() != 0 && pw != null && pw.trim().length() != 0) {
			
			try {
				arr = mdao.selectByIdPw(id, pw);
				
			} catch(SQLException e) {
				e.printStackTrace();
			} // try
			
		} else {
			// 로그인 실패!!
		}
		
		
		
		
		request.setAttribute("list", arr);
		
		
	} // execute()

}

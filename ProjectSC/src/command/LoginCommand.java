package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pos.beans.MemberDAO;
import pos.beans.MemberDTO;

public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO mdao = new MemberDAO();
		MemberDTO[] arr = null;
		
		String id = request.getParameter("Id");
		String pw = request.getParameter("Password");
		System.out.println("id + pw " + id + pw);
		
		
		try {
			arr = mdao.selectByIdPw(id, pw);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("list", arr);
		
	} // execute()

}

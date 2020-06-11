package command;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pos.beans.MemberDAO;
import pos.beans.SessionDTO;

public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO mdao = new MemberDAO();
		SessionDTO[] arr = null;
		HttpSession session = null;
		
		String id = request.getParameter("Id");
		String pw = request.getParameter("Password");
		System.out.println("id + pw " + id + pw);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date sysdate = new Date();
		
		String date = dateFormat.format(sysdate);
		
		
		Date comparedate;
		
		if(id != null && id.trim().length() != 0 && pw != null && pw.trim().length() != 0) {
			
			try {
				arr = mdao.selectByIdPw(id, pw);
				
				Date paydate = new MemberDAO().periodSelectByIdPw(id, pw);
				System.out.println(paydate);
				if(arr != null) {
				
				request.setAttribute("list", arr);
				}
				
				
				if(paydate != null) {

					comparedate = dateFormat.parse(date);
					int compare = paydate.compareTo(comparedate);
					
					System.out.println("paydate = " + paydate);
					System.out.println("sysdate = " + date);
					System.out.println(compare);
					
					request.setAttribute("compare", (Object)compare);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} 
			catch (ParseException e1) {
				e1.printStackTrace();
			}// try
			
		} else {
			// 로그인 실패!!
			return;
		}
		
		
		
		
		
		
		
	} // execute()

}
package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pos.beans.MemberDAO;

public class JoinCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		MemberDAO mdao = new MemberDAO();
		
		// jsp로 부터 받아올 파라미터 나열
		// 회원가입에서 가져올 파라미터들...
		String id = request.getParameter("Id");
		String pw = request.getParameter("Password");
		String email = request.getParameter("Email");
		String phoneNum = request.getParameter("PhoneNumber");
		
		// store info에서 가져올 파라미터들...
		String storeName = request.getParameter("StoreName");
		String location = request.getParameter("StreetAddr");
		location += " " + request.getParameter("ZipCode");
		location += " " + request.getParameter("DetailAddr");
		location += " " + request.getParameter("ExtraAddr");
		
		String storePhone = request.getParameter("StoreNumber");
		
		try {
			cnt = mdao.insertJoin(id, pw, email, phoneNum, storeName, location, storePhone);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

}

package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pos.beans.MemberDAO;

public class JoinCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		MemberDAO mem_dao = new MemberDAO();
		
		// jsp로 부터 받아올 파라미터 나열
		// 회원가입에서 가져올 파라미터들...
		String id = request.getParameter("Id");
		System.out.println("id : " + id);
		String pw = request.getParameter("Password");
		String email = request.getParameter("Email");
		int phoneNum = Integer.parseInt(request.getParameter("PhoneNumber"));
		System.out.println("phoneNum : " + phoneNum);
		
		// store info에서 가져올 파라미터들...
		String storeName = request.getParameter("StoreName");
		String location = request.getParameter("StreetAddr");
		location += " " + request.getParameter("ZipCode");
		location += " " + request.getParameter("DetailAddr");
		location += " " + request.getParameter("ExtraAddr");
		System.out.println("location : " + location);
		
		int storePhone = Integer.parseInt(request.getParameter("StoreNumber"));
		
		try {
			cnt = mem_dao.insertJoin(id, pw, email, phoneNum, storeName, location, storePhone);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

}

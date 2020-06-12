package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pos.beans.MemberDAO;
import pos.beans.MemberDTO;
import pos.beans.StoreDTO;

public class MyPageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		StoreDTO[] strarr = null;
		MemberDTO[] memarr = null;
		
		
		
		HttpSession session = request.getSession();
		int uid = (int)session.getAttribute("mem_uid");
		int storeuid = (int)session.getAttribute("store_uid");
				
		
		
		try {
			strarr = new MemberDAO().Store_Select_By_Uid(storeuid);
			
			memarr = new MemberDAO().Mem_Select_By_Uid(uid);
			
			
			request.setAttribute("meminfo", memarr);
			request.setAttribute("storeinfo", strarr);
			
			System.out.println(memarr[0].getId());
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		

	}

}

package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pos_mgmt.beans.WriteDAO;
import pos_mgmt.beans.WriteDTO;

public class PosMgmtListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();   
		WriteDTO[] arr = null;  
		
		HttpSession session = request.getSession(false);
		
		// int uid = (Integer)session.getAttribute("mem_uid");
		// 여기에 mem_uid 값이 파라미터로 보내지면 안돼고 store_uid 값이 session
		// 에 저장되어 파라미터로 보내져야 한다.
		// TODO
		int uid = 0;
		
		try {
			//트랜잭션수행
			arr = dao.select(uid);

			//결과를 담아야한다.  결과 = arr ,  바구니 = request
			// list 란 name 으로 request에 arr 값 전달
			//즉 request에 담아서 컨트롤러에 전달되는 셈.
			request.setAttribute("pos_mgmt_list", arr);
			// list 로 set 했으니 나중에 꺼낼때도 (get 할때도 ) list로 꺼내야함
			//잊지마세염
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}

	}

}

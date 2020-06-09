package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs_board.beans.CS_WriteDAO;
import cs_board.beans.CS_WriteDTO;
import pos.beans.MemberDAO;
import pos.beans.MemberDTO;

public class CSListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		CS_WriteDAO dao = new CS_WriteDAO();
		CS_WriteDTO[] arr = null;  //초기값
		int mem_uid = (int) session.getAttribute("mem_uid");
		// TODO 세션이 잘 넘어오는지 확인해줘
		
		try {
			//트랜잭션수행
			arr = dao.selectCSbyId(mem_uid);
			
			System.out.println(arr.toString());
			
			//결과를 담아야한다.  결과 = arr ,  바구니 = request
			// list 란 name 으로 request에 arr 값 전달
			//즉 request에 담아서 컨트롤러에 전달되는 셈.
			request.setAttribute("list", arr);
			// list 로 set 했으니 나중에 꺼낼때도 (get 할때도 ) list로 꺼내야함
			//잊지마세염
			
		}catch(SQLException e) {
			e.printStackTrace();
			
			//만약에 Connection Pool을 사용한다면
			//Naming Exception 도 처리해줘야함
		}
	}

}

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
		CS_WriteDTO[] arrlist = null;
		
		// TODO 세션이 잘 넘어오는지 확인해줘
		
		// 여기 아래로
		//------------ Ajax Response 에 필요한 값들-----------------------------------
		StringBuffer message = new StringBuffer();
		String status = "FAIL";  //기본은 FAIL로 설정
		//------------ 페이징 에 필요한 겂들 Default ------------------------------------
				int page = 1;  //현재 페이지 ( 디폴트 = 1)
				int pageRows = 8;  //한 페이지에 8개의 글
				int writePages = 10;  //한 페이징에 몇개의 페이지를 표시 하는지  ==> 아래의 페이지네이션의 개수를 말하는 거임
				int totalCnt = 0;  //글은 총 몇개인지
				int totalPage = 0;  //그리고 페이지는 총 몇 페이지 인지
				
				//2개를 받아와야함 ppt 에 있음
				String param;
				param = request.getParameter("page");
				
				//매개변수 검증
				// page 값 => 현재 몇 페이지?
				if(param != null && param.trim().length() != 0) {
					try {
						page = Integer.parseInt(param);
					} catch (NumberFormatException e) {
						//e.printStackTrace();  
						//예외처리 안함 에러 나면 1로 남아있음
					}
				}
				param = request.getParameter("pageRows");
				//pageRows 값 => '한 페이지' 에 몇개의 글 ?
				if(param != null && param.trim().length() != 0) {
					try {
						pageRows = Integer.parseInt(param);
					} catch (NumberFormatException e) {
						//e.printStackTrace();  
						//예외처리 안함 에러 나면 1로 남아있음
					}
				}
		//여기 위로 
				
		//진짜 		
//		try {
//			//트랜잭션수행
//			arr = dao.selectCSbyId(mem_uid);
//			
//			System.out.println(arr.toString());
//			
//			//결과를 담아야한다.  결과 = arr ,  바구니 = request
//			// list 란 name 으로 request에 arr 값 전달
//			//즉 request에 담아서 컨트롤러에 전달되는 셈.
//			request.setAttribute("list", arr);
//			// list 로 set 했으니 나중에 꺼낼때도 (get 할때도 ) list로 꺼내야함
//			//잊지마세염
//			
//		}catch(SQLException e) {
//			e.printStackTrace();
//			
//			//만약에 Connection Pool을 사용한다면
//			//Naming Exception 도 처리해줘야함
//		}
		//여기 위로 진짜

		
		//테스트
		try {
			//글 전체목록 개수 구하기
			totalCnt = dao.countAll();
			// 총 몇 페이지 분량인가?
			totalPage = (int)Math.ceil(totalCnt / (double)pageRows);
			//몇번째 row 부터?
			int fromRow = (page - 1) * pageRows + 1; //오라클 특징 rownum이 1부터 시작
			//int fromRow = (page - 1) * pageRows;  //MySQL 특징 rownum이 0부터 시작
			dao = new CS_WriteDAO();
			arr = dao.selectFromRow(fromRow, pageRows);
//			arrlist = new CS_WriteDAO().selectCSbyId(mem_uid);
			
			if(arr==null) {
				message.append("[리스트할 데이터가 없다리]");
			}else {
				status="okeey";
			}
		}catch(SQLException e) {
			//e.printStackTrace();
			message.append("[Transaction error :" +e.getMessage()+"]");
		}//end try
		request.setAttribute("status", status);
		request.setAttribute("message", message.toString());
//		request.setAttribute("list", arrlist);
		request.setAttribute("page", page);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("writePages", writePages);
		request.setAttribute("pageRows", pageRows);
		request.setAttribute("totalCnt", totalCnt);
		
		request.setAttribute("testlist", arr);
		//테스트
	}

}

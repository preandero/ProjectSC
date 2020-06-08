package com.pay.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.JoinCommand;
import command.LoginCommand;
import command.PaySuccessCommand;
import command.PosMgmtAddCommand;
import command.PosMgmtListCommand;
import command.PosSalesMenuListCommand;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		System.out.println("doGet 방식으로 호출됨");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost() 호출");

		request.setCharacterEncoding("UTF-8");

		// 컨트롤러는 다음 두개를 선택해야 한다.
		String viewPage = null; // 어떠한 뷰? --> 페이지
		Command command = null; // 어떠한 커맨드? --> 어떠한 로직 수행.

		// URL로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("com : " + com);

		switch (com) {
		case "/HTML/joinUs.do":
			System.out.println("joinUs 성공");
			command = new JoinCommand();
			command.execute(request, response);
			viewPage = "joinOk.jsp";
			break;
			
		case "/HTML/loginOk.do":
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "loginOk.jsp";
			break;
			
		case "/HTML/paySuccess.do":
			System.out.println("성공");
			command = new PaySuccessCommand();
			command.execute(request, response);
			viewPage = "pay_success.jsp";
			break;
			
		case "/HTML/pos_mgmt_list.do":
			System.out.println("pos_mgmt.list 성공");
			command = new PosMgmtListCommand();  //바꿔야함
			command.execute(request, response);
			viewPage = "pos_mgmt_list.jsp";
			break;
		case "/HTML/pos_mgmt_writeOk.do":
			System.out.println("pos_mgmt.writeOk 성공");
			command = new PosMgmtAddCommand();  //바꿔야함
			command.execute(request, response);
			viewPage = "pos_mgmt_writeOk.jsp";
			break;
			
		case "/HTML/pos_sales.do":
			System.out.println("pos_sales 성공");
			command = new PosSalesMenuListCommand();  //바꿔야함
			command.execute(request, response);
			viewPage = "pos_sales.jsp";
			break;

		} // switch
		
		// request 를 위에서 결정된 view 에 forward 해줌.
				if(viewPage != null) {
					RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
					dispatcher.forward(request, response);
				}
	}

}

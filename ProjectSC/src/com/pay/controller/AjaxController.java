package com.pay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.*;
import pos.beans.AjaxPOSResult;

@WebServlet("*.ajax")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ajaxAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ajaxAction(request, response);
	}
	
	protected void ajaxAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		Command command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("com : " + com);

		
		switch (com) {
		

			
		case "/HTML/cs_list.ajax":		//글 목록 (메뉴목록)
			new CSListCommand().execute(request, response);	//한줄 처리 
			new AjaxListCommand().execute(request, response);  //위에서 받아온 REQUEST를 쓰는거
			break;
		case "/HTML/cs_view.ajax":		//글 읽기
			new CSViewCommand().execute(request, response);
			new AjaxListCommand().execute(request, response);
			break;
		case "/HTML/cs_write.ajax":  //글 작성 (메뉴)
			new CSWriteCommand().execute(request, response);
			new AjaxResultCommand().execute(request, response);
			break;
		case "/HTML/cs_update.ajax":  //글 수정 (메뉴)
			new CSUpdateCommand().execute(request, response);
			new AjaxResultCommand().execute(request, response);
			break;
		case "/HTML/cs_deleteOk.ajax":  //글 삭제 (메뉴)
			new CSDeleteCommand().execute(request, response);
			new AjaxResultCommand().execute(request, response);
			break;
			
		case "/HTML/orderInsert.ajax":
			new OrderInsertCommand().execute(request, response);
			new AjaxResultCommand2().execute(request, response);
			break;
		}
		
	}

}
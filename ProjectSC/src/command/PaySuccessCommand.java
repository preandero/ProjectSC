package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pos.beans.PaySuccessDAO;

public class PaySuccessCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		PaySuccessDAO psDAO = new PaySuccessDAO();
		
		int period = Integer.parseInt(request.getParameter("period"));
		int price = Integer.parseInt(request.getParameter("price"));
		String method = request.getParameter("method");
		String email = request.getParameter("email");
		
		if(period != 0 && price != 0 && method != null && email != null) {
			
			try {
				cnt = psDAO.insert(period, price, method, email);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} // if
		
		
		
	}

}

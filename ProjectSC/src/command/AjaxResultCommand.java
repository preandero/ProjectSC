package command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import pos.beans.AjaxPOSResult;

public class AjaxResultCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		AjaxPOSResult apr = new AjaxPOSResult();
		
		apr.setStatus((String)request.getAttribute("status"));
		apr.setMessage((String)request.getAttribute("message"));
		apr.setCount((Integer)request.getAttribute("result"));
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			String jsonString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(apr);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);
			
		} catch(JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	} // execute()

} // AjaxResultCommand{}

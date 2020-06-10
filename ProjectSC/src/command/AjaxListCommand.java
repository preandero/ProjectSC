package command;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cs_board.beans.AjaxWriteList;
import cs_board.beans.*;


public class AjaxListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
//		CS_WriteDTO[] dtoArr = (CS_WriteDTO[])request.getAttribute("list");
		CS_WriteDTO[] dtoArr = (CS_WriteDTO[])request.getAttribute("testlist");
		
		AjaxWriteList result = new AjaxWriteList();
		result.setStatus((String)request.getAttribute("status"));
		result.setMessage((String)request.getAttribute("message"));
		if(dtoArr != null) {
			result.setCount(dtoArr.length);
			result.setList(Arrays.asList(dtoArr));
		}
		
		//테스트 구간
//		CS_WriteDTO[] dtoArr2 = (CS_WriteDTO[])request.getAttribute("testlist");
		//테스트 구간
		//------------------ 페이징할 때 필요한 값들 -----------------------------
		try {
			result.setPage((Integer)request.getAttribute("page"));
			result.setTotalPage((Integer)request.getAttribute("totalPage"));
			result.setWritePages((Integer)request.getAttribute("writePages"));
			result.setPageRows((Integer)request.getAttribute("pageRows"));
			result.setTotalCnt((Integer)request.getAttribute("totalCnt"));
		} catch (Exception e) {
		}
		
		ObjectMapper mapper = new ObjectMapper(); //Json 매핑할 객체
		try {
			String jsonString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(result);
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write(jsonString);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
		
}



package pos.beans;

import java.util.List;

public class AjaxPOSList extends AjaxPOSResult{
	// TODO
	// 메뉴의 이름
	// 메뉴 가격
	// 메뉴 수량
	
	// 데이터에 담아줄것 (order detail에 들어갈 row)
	private List<OrderDetailDTO> data;

	public List<OrderDetailDTO> getData() {
		return data;
	}

	public void setData(List<OrderDetailDTO> data) {
		this.data = data;
	}
	
	
}

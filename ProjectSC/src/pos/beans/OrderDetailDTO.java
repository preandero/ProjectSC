package pos.beans;

public class OrderDetailDTO {
	
	int uid;
	int price;
	String menuname;
	int quantity;
	int order_uid;
	int menu_uid;
	
	public OrderDetailDTO() {}
	
	
	
	public OrderDetailDTO(int uid, int price, String menuname, int quantity, int order_uid, int menu_uid) {
		super();
		this.uid = uid;
		this.price = price;
		this.menuname = menuname;
		this.quantity = quantity;
		this.order_uid = order_uid;
		this.menu_uid = menu_uid;
	}



	public int getUid() {
		return uid;
	}



	public void setUid(int uid) {
		this.uid = uid;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getMenuname() {
		return menuname;
	}



	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public int getOrder_uid() {
		return order_uid;
	}



	public void setOrder_uid(int order_uid) {
		this.order_uid = order_uid;
	}



	public int getMenu_uid() {
		return menu_uid;
	}



	public void setMenu_uid(int menu_uid) {
		this.menu_uid = menu_uid;
	}
	
	
	
	
}

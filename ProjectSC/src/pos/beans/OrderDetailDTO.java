package pos.beans;

public class OrderDetailDTO {
	
	int order_uid;
	int menu_uid;
	int quantity;
	int price;
	
	public OrderDetailDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public OrderDetailDTO(int order_uid, int menu_uid, int quantity, int price) {
		super();
		this.order_uid = order_uid;
		this.menu_uid = menu_uid;
		this.quantity = quantity;
		this.price = price;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
	
	
	
}

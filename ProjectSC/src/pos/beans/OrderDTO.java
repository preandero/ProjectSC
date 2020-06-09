package pos.beans;

import java.util.Date;

public class OrderDTO {
	
	int uid;
	Date regdate;
	int totalprice;
	int store_uid;
	
	public OrderDTO() {}
	
	public OrderDTO(int uid, Date regdate, int totalprice, int store_uid) {
		super();
		this.uid = uid;
		this.regdate = regdate;
		this.totalprice = totalprice;
		this.store_uid = store_uid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public int getStore_uid() {
		return store_uid;
	}

	public void setStore_uid(int store_uid) {
		this.store_uid = store_uid;
	}
	
	
	
}

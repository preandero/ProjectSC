package pos.beans;

import java.sql.Date;

public class MemberDTO {
	private int period;
	private int price;
	private String pay_method;
	private String email;


	public MemberDTO() {
		super();
	}

	public MemberDTO(int period, int price, String pay_method, String email) {
		super();
		this.period = period;
		this.price = price;
		this.pay_method = pay_method;
		this.email = email;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

} // PaySuccessDTO{}

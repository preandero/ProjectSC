package pos.beans;

public class SessionDTO {

	// 내가 session에 담고 싶은 값들을 모두 넣어 로그인이 되었을 경우 기억하고 있어야
	// 한다
	
	// ----------------------------
	private int mem_uid;
	private String mem_id;
	private int store_uid;
	private int period;
	
	public SessionDTO() {
		// TODO Auto-generated constructor stub
	}

	public SessionDTO(int mem_uid, String mem_id, int store_uid, int period) {
		super();
		this.mem_uid = mem_uid;
		this.mem_id = mem_id;
		this.store_uid = store_uid;
		this.period = period;
	}

	public int getMem_uid() {
		return mem_uid;
	}

	public void setMem_uid(int mem_uid) {
		this.mem_uid = mem_uid;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getStore_uid() {
		return store_uid;
	}

	public void setStore_uid(int store_uid) {
		this.store_uid = store_uid;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}
	
	
	
	
}

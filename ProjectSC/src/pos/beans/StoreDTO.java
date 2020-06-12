package pos.beans;

public class StoreDTO {
	private int uid;
	private String name;
	private String location;
	private String phonenum;

	public StoreDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public StoreDTO(String name, String phonenum) {
		super();
		this.name = name;
		this.phonenum = phonenum;
	}

	public StoreDTO(int uid, String name, String location, String phonenum) {
		super();
		this.uid = uid;
		this.name = name;
		this.location = location;
		this.phonenum = phonenum;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	
	
	
} // StoreDTO{}



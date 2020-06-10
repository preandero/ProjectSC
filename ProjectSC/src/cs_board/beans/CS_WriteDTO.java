package cs_board.beans;


public class CS_WriteDTO {
	private int uid;				
	private String subject;				
	private String content;		
	private String regDate;
	private int mem_uid;
	private String mem_id;
	



	public CS_WriteDTO() {
		super();
		System.out.println("WriteDTO() 생성");
	}


	public CS_WriteDTO(int uid, String subject, String content,int m_uid) {
		super();
		this.uid = uid;
		this.subject = subject;
		this.content = content;
		this.mem_uid = m_uid;
	}
	
	public CS_WriteDTO(int uid, String subject, String content, String mem_id) {
		super();
		this.uid = uid;
		this.subject = subject;
		this.content = content;
		this.mem_id = mem_id;
	}
	
	

//	public CS_WriteDTO(int uid, String subject, String content,int m_uid) {
//		super();
//		this.uid = uid;
//		this.subject = subject;
//		this.content = content;
//		this.mem_uid = m_uid;
//		
//
//	}

	


	//getter & setter
	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public int getM_uid() {
		return mem_uid;
	}
	
	
	public void setM_uid(int m_uid) {
		this.mem_uid = m_uid;
	}
	
	
//	public String getName() {
//		return name;
//	}
//	
//	
//	public void setName(String name) {
//		this.name = name;
//	}
//	
	
}

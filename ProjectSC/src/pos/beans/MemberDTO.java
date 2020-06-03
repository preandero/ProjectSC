package pos.beans;

import java.util.Date;

public class MemberDTO {
   private int uid;
   private String id;
   private String pw;
   private String name;
   private String email;
   private int phonenum;
   private Date regdate;
   private int period;
   private int payment;
   private String method;
   


   public MemberDTO() {
      super();
   }


   public MemberDTO(int uid, String id, String pw, String name, String email, int phonenum, Date regdate, int period,
         int payment, String method) {
      super();
      this.uid = uid;
      this.id = id;
      this.pw = pw;
      this.name = name;
      this.email = email;
      this.phonenum = phonenum;
      this.regdate = regdate;
      this.period = period;
      this.payment = payment;
      this.method = method;
   }





   public int getUid() {
      return uid;
   }



   public void setUid(int uid) {
      this.uid = uid;
   }



   public String getId() {
      return id;
   }



   public void setId(String id) {
      this.id = id;
   }



   public String getPw() {
      return pw;
   }



   public void setPw(String pw) {
      this.pw = pw;
   }



   public String getName() {
      return name;
   }



   public void setName(String name) {
      this.name = name;
   }



   public String getEmail() {
      return email;
   }



   public void setEmail(String email) {
      this.email = email;
   }



   public int getPhonenum() {
      return phonenum;
   }



   public void setPhonenum(int phonenum) {
      this.phonenum = phonenum;
   }



   public Date getRegdate() {
      return regdate;
   }



   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }



   public int getPeriod() {
      return period;
   }



   public void setPeriod(int period) {
      this.period = period;
   }



   public int getPayment() {
      return payment;
   }



   public void setPayment(int payment) {
      this.payment = payment;
   }



   public String getMethod() {
      return method;
   }



   public void setMethod(String method) {
      this.method = method;
   }




} // PaySuccessDTO{}
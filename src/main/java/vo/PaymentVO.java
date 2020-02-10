package vo;

import java.sql.Date;

public class PaymentVO {

	private int pPrice;
	private int pNum;
	private String pDate;
	private String pPayment;

	
	private String gImg1;
	private String gName;
	private String Member_mId;
	private int gPirce;
	private String mPhone;
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public String getpPayment() {
		return pPayment;
	}
	public void setpPayment(String pPayment) {
		this.pPayment = pPayment;
	}
	public String getgImg1() {
		return gImg1;
	}
	public void setgImg1(String gImg1) {
		this.gImg1 = gImg1;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getMember_mId() {
		return Member_mId;
	}
	public void setMember_mId(String member_mId) {
		Member_mId = member_mId;
	}
	public int getgPirce() {
		return gPirce;
	}
	public void setgPirce(int gPirce) {
		this.gPirce = gPirce;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	@Override
	public String toString() {
		return "PaymentVO [pPrice=" + pPrice + ", pNum=" + pNum + ", pDate=" + pDate + ", pPayment=" + pPayment
				+ ", gImg1=" + gImg1 + ", gName=" + gName + ", Member_mId=" + Member_mId + ", gPirce=" + gPirce
				+ ", mPhone=" + mPhone + "]";
	}
	
	
	
	


	



//	public PaymentVO(int pPrice, int pNum, String pDate, String pPayment) {
//		super();
//		this.pPrice = pPrice;
//		this.pNum = pNum;
//		this.pDate = pDate;
//		this.pPayment = pPayment;
//	
//	}
	
}

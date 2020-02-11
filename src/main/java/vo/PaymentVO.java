package vo;

import java.sql.Date;

public class PaymentVO {

	private int pPrice;
	private int pNum;
	private Date pDate;
	private String pPayment;

	
	private String gImg1;
	private String gName;
	private String member_mId;
	private int gPrice;
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
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
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
		return member_mId;
	}
	public void setMember_mId(String member_mId) {
		member_mId = member_mId;
	}
	public int getgPrice() {
		return gPrice;
	}
	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
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
				+ ", gImg1=" + gImg1 + ", gName=" + gName + ", member_mId=" + member_mId + ", gPrice=" + gPrice
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

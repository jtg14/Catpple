package vo;

import java.sql.Date;

public class PaymentVO {
	int pPrice;
	int pNum;
	Date pDate;
	String pPayment;
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
	@Override
	public String toString() {
		return "PaymentVO [pPrice=" + pPrice + ", pNum=" + pNum + ", pDate=" + pDate + ", pPayment=" + pPayment + "]";
	}
	
}

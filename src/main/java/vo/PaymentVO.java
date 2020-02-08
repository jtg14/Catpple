package vo;

import java.sql.Date;

public class PaymentVO {
	int pPrice;
	int pNum;
	Date pData;
	String pPayment;
	int order_oNum;
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
	public Date getpData() {
		return pData;
	}
	public void setpData(Date pData) {
		this.pData = pData;
	}
	public String getpPayment() {
		return pPayment;
	}
	public void setpPayment(String pPayment) {
		this.pPayment = pPayment;
	}
	public int getOrder_oNum() {
		return order_oNum;
	}
	public void setOrder_oNum(int order_oNum) {
		this.order_oNum = order_oNum;
	}
	@Override
	public String toString() {
		return "PaymentVO [pPrice=" + pPrice + ", pNum=" + pNum + ", pData=" + pData + ", pPayment=" + pPayment
				+ ", order_oNum=" + order_oNum + "]";
	}
	
	
}

package vo;

import java.sql.Date;

public class DeliveryVO {
	int dAddr;
	String dAddr2;
	String dAddr3;
	String dState;
	String dInfo;
	int dNum;
	Date dDate;
	int order_oNum;
	public int getdAddr() {
		return dAddr;
	}
	public void setdAddr(int dAddr) {
		this.dAddr = dAddr;
	}
	public String getdAddr2() {
		return dAddr2;
	}
	public void setdAddr2(String dAddr2) {
		this.dAddr2 = dAddr2;
	}
	public String getdAddr3() {
		return dAddr3;
	}
	public void setdAddr3(String dAddr3) {
		this.dAddr3 = dAddr3;
	}
	public String getdState() {
		return dState;
	}
	public void setdState(String dState) {
		this.dState = dState;
	}
	public String getdInfo() {
		return dInfo;
	}
	public void setdInfo(String dInfo) {
		this.dInfo = dInfo;
	}
	public int getdNum() {
		return dNum;
	}
	public void setdNum(int dNum) {
		this.dNum = dNum;
	}
	public Date getdDate() {
		return dDate;
	}
	public void setdDate(Date dDate) {
		this.dDate = dDate;
	}
	public int getOrder_oNum() {
		return order_oNum;
	}
	public void setOrder_oNum(int order_oNum) {
		this.order_oNum = order_oNum;
	}
	@Override
	public String toString() {
		return "DeliveryVO [dAddr=" + dAddr + ", dAddr2=" + dAddr2 + ", dAddr3=" + dAddr3 + ", dState=" + dState
				+ ", dInfo=" + dInfo + ", dNum=" + dNum + ", dDate=" + dDate + ", order_oNum=" + order_oNum + "]";
	}
	
	
}

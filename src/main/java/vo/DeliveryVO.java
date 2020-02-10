package vo;

import java.sql.Date;

public class DeliveryVO {
	int dAddr1;
	String dAddr2;
	String dAddr3;
	String dState;
	String dInfo;
	int dNum;
	Date dDate;
	int order_oNum;
	public int getdAddr1() {
		return dAddr1;
	}
	public void setdAddr1(int dAddr1) {
		this.dAddr1 = dAddr1;
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
		return "DeliveryVO [dAddr1=" + dAddr1 + ", dAddr2=" + dAddr2 + ", dAddr3=" + dAddr3 + ", dState=" + dState
				+ ", dInfo=" + dInfo + ", dNum=" + dNum + ", dDate=" + dDate + ", order_oNum=" + order_oNum + "]";
	}
	public DeliveryVO(int dAddr, String dAddr2, String dAddr3, String dState, String dInfo, int dNum, Date dDate,
			int order_oNum) {
		super();
		this.dAddr1 = dAddr;
		this.dAddr2 = dAddr2;
		this.dAddr3 = dAddr3;
		this.dState = dState;
		this.dInfo = dInfo;
		this.dNum = dNum;
		this.dDate = dDate;
		this.order_oNum = order_oNum;
	}
	
	
}

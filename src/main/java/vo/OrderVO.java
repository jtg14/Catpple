package vo;

import java.sql.Date;

public class OrderVO {
	int oNum;
	Date oDate;
	int oPrice;
	int oStock;
	int oAddr1;
	String oAddr2;
	String oAddr3;
	String oAddr4;
	String oPhone;
	String oState;
	String dInfo;
	String member_mId;
	int goods_gNum;
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;

	}
	public int getoPrice() {
		return oPrice;
	}
	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}
	public int getoStock() {
		return oStock;
	}
	public void setoStock(int oStock) {
		this.oStock = oStock;
	}
	public int getoAddr1() {
		return oAddr1;
	}
	public void setoAddr1(int oAddr1) {
		this.oAddr1 = oAddr1;
	}
	public String getoAddr2() {
		return oAddr2;
	}
	public void setoAddr2(String oAddr2) {
		this.oAddr2 = oAddr2;
	}
	public String getoAddr3() {
		return oAddr3;
	}
	public void setoAddr3(String oAddr3) {
		this.oAddr3 = oAddr3;
	}
	public String getoAddr4() {
		return oAddr4;
	}
	public void setoAddr4(String oAddr4) {
		this.oAddr4 = oAddr4;
	}
	public String getoPhone() {
		return oPhone;
	}
	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}
	public String getoState() {
		return oState;
	}
	public void setoState(String oState) {
		this.oState = oState;
	}
	public String getdInfo() {
		return dInfo;
	}
	public void setdInfo(String dInfo) {
		this.dInfo = dInfo;
	}
	public String getMember_mId() {
		return member_mId;
	}
	public void setMember_mId(String member_mId) {
		this.member_mId = member_mId;
	}
	public int getGoods_gNum() {
		return goods_gNum;
	}
	public void setGoods_gNum(int goods_gNum) {
		this.goods_gNum = goods_gNum;
	}
	@Override
	public String toString() {
		return "OrderVO [oNum=" + oNum + ", oDate=" + oDate + ", oPrice=" + oPrice + ", oStock=" + oStock + ", oAddr1="
				+ oAddr1 + ", oAddr2=" + oAddr2 + ", oAddr3=" + oAddr3 + ", oAddr4=" + oAddr4 + ", oPhone=" + oPhone
				+ ", oState=" + oState + ", dInfo=" + dInfo + ", member_mId=" + member_mId + ", goods_gNum="
				+ goods_gNum + "]";

	}
	
	
}

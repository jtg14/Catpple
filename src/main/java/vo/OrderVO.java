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
	String oStatus;
	String oName;
	String oPhone;
	String dNum;
	String dInfo;
	int pNum;
	String pPayment;
	String member_mId;
	int goods_gNum;
	String gName;
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
	public String getoStatus() {
		return oStatus;
	}
	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public String getoPhone() {
		return oPhone;
	}
	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}
	public String getdNum() {
		return dNum;
	}
	public void setdNum(String dNum) {
		this.dNum = dNum;
	}
	public String getdInfo() {
		return dInfo;
	}
	public void setdInfo(String dInfo) {
		this.dInfo = dInfo;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getpPayment() {
		return pPayment;
	}
	public void setpPayment(String pPayment) {
		this.pPayment = pPayment;
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
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	@Override
	public String toString() {
		return "OrderVO [oNum=" + oNum + ", oDate=" + oDate + ", oPrice=" + oPrice + ", oStock=" + oStock + ", oAddr1="
				+ oAddr1 + ", oAddr2=" + oAddr2 + ", oAddr3=" + oAddr3 + ", oAddr4=" + oAddr4 + ", oStatus=" + oStatus
				+ ", oName=" + oName + ", oPhone=" + oPhone + ", dNum=" + dNum + ", dInfo=" + dInfo + ", pNum=" + pNum
				+ ", pPayment=" + pPayment + ", member_mId=" + member_mId + ", goods_gNum=" + goods_gNum + ", gName="
				+ gName + "]";
	}
}

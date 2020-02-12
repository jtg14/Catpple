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
	String dState;
	int midPrice;
	String member_mId;
	String mPhone;
	int goods_gNum;
	String gName;
	String gImg1;
	String sellerID;
	int payment_pNum;
	String pPayment;
	int gStock;
	int gPrice;
	Date dDate;
	int dPk;
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
	public String getdState() {
		return dState;
	}
	public void setdState(String dState) {
		this.dState = dState;
	}
	public int getMidPrice() {
		return midPrice;
	}
	public void setMidPrice(int midPrice) {
		this.midPrice = midPrice;
	}
	public String getMember_mId() {
		return member_mId;
	}
	public void setMember_mId(String member_mId) {
		this.member_mId = member_mId;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
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
	public String getgImg1() {
		return gImg1;
	}
	public void setgImg1(String gImg1) {
		this.gImg1 = gImg1;
	}
	public String getSellerID() {
		return sellerID;
	}
	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
	}
	public int getPayment_pNum() {
		return payment_pNum;
	}
	public void setPayment_pNum(int payment_pNum) {
		this.payment_pNum = payment_pNum;
	}
	public String getpPayment() {
		return pPayment;
	}
	public void setpPayment(String pPayment) {
		this.pPayment = pPayment;
	}
	public int getgStock() {
		return gStock;
	}
	public void setgStock(int gStock) {
		this.gStock = gStock;
	}
	public int getgPrice() {
		return gPrice;
	}
	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}
	public Date getdDate() {
		return dDate;
	}
	public void setdDate(Date dDate) {
		this.dDate = dDate;
	}
	public int getdPk() {
		return dPk;
	}
	public void setdPk(int dPk) {
		this.dPk = dPk;
	}
	@Override
	public String toString() {
		return "OrderVO [oNum=" + oNum + ", oDate=" + oDate + ", oPrice=" + oPrice + ", oStock=" + oStock + ", oAddr1="
				+ oAddr1 + ", oAddr2=" + oAddr2 + ", oAddr3=" + oAddr3 + ", oAddr4=" + oAddr4 + ", oStatus=" + oStatus
				+ ", oName=" + oName + ", oPhone=" + oPhone + ", dNum=" + dNum + ", dInfo=" + dInfo + ", dState="
				+ dState + ", midPrice=" + midPrice + ", member_mId=" + member_mId + ", mPhone=" + mPhone
				+ ", goods_gNum=" + goods_gNum + ", gName=" + gName + ", gImg1=" + gImg1 + ", sellerID=" + sellerID
				+ ", payment_pNum=" + payment_pNum + ", pPayment=" + pPayment + ", gStock=" + gStock + ", gPrice="
				+ gPrice + ", dDate=" + dDate + ", dPk=" + dPk + "]";
	}
	
	
	

	
}

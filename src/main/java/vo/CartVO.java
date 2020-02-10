package vo;

public class CartVO {
	private int cId;
	private int cAmount;
	private String member_mId;
	private int goods_gNum;
	private String gName;
	private int gPrice;
	private String sellerID; 
	private String gimg1;
	private String dstate;
	private int gstock;
	private String ddate;
	private int dpk;
	public int getDpk() {
		return dpk;
	}
	public void setDpk(int dpk) {
		this.dpk = dpk;
	}
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	public int getGstock() {
		return gstock;
	}
	public void setGstock(int gstock) {
		this.gstock = gstock;
	}
	public String getDstate() {
		return dstate;
	}
	public void setDstate(String dstate) {
		this.dstate = dstate;
	}
	public int getOstock() {
		return ostock;
	}
	public void setOstock(int ostock) {
		this.ostock = ostock;
	}


	private int ostock;
	
	public String getGname() {
		return gName;
	}
	public void setGname(String gName) {
		this.gName = gName;
	}
	public int getGprice() {
		return gPrice;
	}
	public void setGprice(int gPrice) {
		this.gPrice = gPrice;
	}
	public String getSellerID() {
		return sellerID;
	}
	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public int getcAmount() {
		return cAmount;
	}
	public void setcAmount(int cAmount) {
		this.cAmount = cAmount;
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
	public int getgPrice() {
		return gPrice;
	}
	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}
	public String getGimg1() {
		return gimg1;
	}
	public void setGimg1(String gimg1) {
		this.gimg1 = gimg1;
	}
	@Override
	public String toString() {
		return "CartVO [cId=" + cId + ", cAmount=" + cAmount + ", member_mId=" + member_mId + ", goods_gNum="
				+ goods_gNum + ", gName=" + gName + ", gPrice=" + gPrice + ", sellerID=" + sellerID + ", gimg1=" + gimg1
				+ ", dstate=" + dstate + ", gstock=" + gstock + ", ddate=" + ddate + ", dpk=" + dpk + ", ostock="
				+ ostock + "]";
	}
	

	
	
}

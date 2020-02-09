package vo;

public class CartVO {
	private int cId;
	private int cAmount;
	private String member_mId;
	private int goods_gNum;
	private String gName;
	private int gPrice;
	private String sellerID; 
	private String gImg1;
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
	public String getSellerID() {
		return sellerID;
	}
	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
	}
	public String getgImg1() {
		return gImg1;
	}
	public void setgImg1(String gImg1) {
		this.gImg1 = gImg1;
	}
	@Override
	public String toString() {
		return "CartVO [cId=" + cId + ", cAmount=" + cAmount + ", member_mId=" + member_mId + ", goods_gNum="
				+ goods_gNum + ", gName=" + gName + ", gPrice=" + gPrice + ", sellerID=" + sellerID + ", gImg1=" + gImg1
				+ "]";
	}
	
	
	
	
	
	
}

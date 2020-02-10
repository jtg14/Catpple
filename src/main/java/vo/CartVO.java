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
	public String getGimg1() {
		return gimg1;
	}
	public void setGimg1(String gimg1) {
		this.gimg1 = gimg1;
	}


	@Override
	public String toString() {
		return "CartVO [cId=" + cId + ", cAmount=" + cAmount + ", member_mId=" + member_mId + ", goods_gNum="
				+ goods_gNum + ", gname=" + gName + ", gprice=" + gPrice + ", sellerID=" + sellerID + ", gimg1=" + gimg1
				+ ", dstate=" + dstate + ", ostock=" + ostock + "]";

	}
	
}

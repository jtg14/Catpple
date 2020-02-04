package vo;

public class CartVO {
	private int cId;
	private int cAmount;
	private String Member_mId;
	private int Goods_gNum;
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
		return Member_mId;
	}
	public void setMember_mId(String member_mId) {
		Member_mId = member_mId;
	}
	public int getGoods_gNum() {
		return Goods_gNum;
	}
	public void setGoods_gNum(int goods_gNum) {
		Goods_gNum = goods_gNum;
	}
	@Override
	public String toString() {
		return "CartVO [cId=" + cId + ", cAmount=" + cAmount + ", Member_mId=" + Member_mId + ", Goods_gNum="
				+ Goods_gNum + "]";
	}
	
}

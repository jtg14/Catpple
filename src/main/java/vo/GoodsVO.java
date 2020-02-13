package vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class GoodsVO extends PageVO {
	private int gNum;
	private int gStock;
	private int gPrice;
	private String gName;
	private Date gDate;
	private String gImg1;
	private String gImg2;
	private MultipartFile gimgf1;
	private MultipartFile gimgf2;
	private int gPoint;
	private String gCategory;
	private String gCategory2;
	private String member_mId;
	private String company;
	public int getgNum() {
		return gNum;
	}
	public void setgNum(int gNum) {
		this.gNum = gNum;
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
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public Date getgDate() {
		return gDate;
	}
	public void setgDate(Date gDate) {
		this.gDate = gDate;
	}
	public String getgImg1() {
		return gImg1;
	}
	public void setgImg1(String gImg1) {
		this.gImg1 = gImg1;
	}
	public String getgImg2() {
		return gImg2;
	}
	public void setgImg2(String gImg2) {
		this.gImg2 = gImg2;
	}
	
	public MultipartFile getGimgf1() {
		return gimgf1;
	}
	public void setGimgf1(MultipartFile gimgf1) {
		this.gimgf1 = gimgf1;
	}
	public MultipartFile getGimgf2() {
		return gimgf2;
	}
	public void setGimgf2(MultipartFile gimgf2) {
		this.gimgf2 = gimgf2;
	}
	public int getgPoint() {
		return gPoint;
	}
	public void setgPoint(int gPoint) {
		this.gPoint = gPoint;
	}
	public String getgCategory() {
		return gCategory;
	}
	public void setgCategory(String gCategory) {
		this.gCategory = gCategory;
	}
	public String getgCategory2() {
		return gCategory2;
	}
	public void setgCategory2(String gCategory2) {
		this.gCategory2 = gCategory2;
	}
	public String getMember_mId() {
		return member_mId;
	}
	public void setMember_mId(String member_mId) {
		this.member_mId = member_mId;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	@Override
	public String toString() {
		return "GoodsVO [gNum=" + gNum + ", gStock=" + gStock + ", gPrice=" + gPrice + ", gName=" + gName + ", gDate="
				+ gDate + ", gImg1=" + gImg1 + ", gImg2=" + gImg2 + ", gImgf1=" + gimgf1 + ", gImgf2=" + gimgf2
				+ ", gPoint=" + gPoint + ", gCategory=" + gCategory + ", gCategory2=" + gCategory2 + ", member_mId="
				+ member_mId + ", company=" + company + "]";
	}
	
	
	
}

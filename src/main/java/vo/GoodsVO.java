package vo;

import org.springframework.web.multipart.MultipartFile;

public class GoodsVO {
	private int gnum;
	private int gstock;
	private int gprice;
	private String gname;
	private String gdate;
	private String gimg1;
	private String gimg2;
	private MultipartFile gimgf1;
	private MultipartFile gimgf2;
	private int gpoint;
	private String gcategory;
	private String gcategory2;
	private String Member_mid;
	
	
	
	public String getMember_mid() {
		return Member_mid;
	}

	public void setMember_mid(String member_mid) {
		Member_mid = member_mid;
	}

	public String getGcategory2() {
		return gcategory2;
	}
	
	public void setGcategory2(String gcategory2) {
		this.gcategory2 = gcategory2;
	}

	public int getGnum() {
		return gnum;
	}

	public void setGnum(int gnum) {
		this.gnum = gnum;
	}

	public int getGstock() {
		return gstock;
	}

	public void setGstock(int gstock) {
		this.gstock = gstock;
	}

	public int getGprice() {
		return gprice;
	}

	public void setGprice(int gprice) {
		this.gprice = gprice;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGdate() {
		return gdate;
	}

	public void setGdate(String gdate) {
		this.gdate = gdate;
	}

	public String getGimg1() {
		return gimg1;
	}

	public void setGimg1(String gimg1) {
		this.gimg1 = gimg1;
	}

	public String getGimg2() {
		return gimg2;
	}

	public void setGimg2(String gimg2) {
		this.gimg2 = gimg2;
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

	public int getGpoint() {
		return gpoint;
	}

	public void setGpoint(int gpoint) {
		this.gpoint = gpoint;
	}

	public String getGcategory() {
		return gcategory;
	}

	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}

	@Override
	public String toString() {
		return "GoodsVO [gnum=" + gnum + ", gstock=" + gstock + ", gprice=" + gprice + ", gname=" + gname + ", gdate="
				+ gdate + ", gimg1=" + gimg1 + ", gimg2=" + gimg2 + ", gimgf1=" + gimgf1 + ", gimgf2=" + gimgf2
				+ ", gpoint=" + gpoint + ", gcategory=" + gcategory + ", gcategory2=" + gcategory2 + ", Member_mid=" + Member_mid + "]";
	}
	
	
}

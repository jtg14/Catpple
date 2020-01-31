package vo;

public class BoardVO {
	
	private int bNum;
	private String mName;
	private String bTitle;
	private String bContent;
	private String bDate;
	private String bReply;
	private String member_mId;
	public int getbNum() {
		return bNum;
	}
	public void setBnum(int bnum) {
		this.bNum = bnum;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public String getbReply() {
		return bReply;
	}
	public void setbReply(String bReply) {
		this.bReply = bReply;
	}
	public String getMember_mId() {
		return member_mId;
	}
	public void setMember_mId(String member_mId) {
		this.member_mId = member_mId;
	}
	@Override
	public String toString() {
		return "BoardVO [bNum=" + bNum + ", mName=" + mName + ", bTitle=" + bTitle + ", bContent=" + bContent
				+ ", bDate=" + bDate + ", bReply=" + bReply + ", member_mId=" + member_mId + "]";
	}
	
	
	
	
	
	
}//class

package vo;

public class MemberVO {
	private String mId;
	private String mPw;
	private String mEmail;
	private String mPhone;
	private String mName;
	private int mAddr1;
	private String mAddr2;
	private String mAddr3;
	private String mAddr4;
	private int mPoint;
	private String mGrade;
	private String mStatus;

	public MemberVO() {
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public int getmAddr1() {
		return mAddr1;
	}

	public void setmAddr1(int mAddr1) {
		this.mAddr1 = mAddr1;
	}

	public String getmAddr2() {
		return mAddr2;
	}

	public void setmAddr2(String mAddr2) {
		this.mAddr2 = mAddr2;
	}

	public String getmAddr3() {
		return mAddr3;
	}

	public void setmAddr3(String mAddr3) {
		this.mAddr3 = mAddr3;
	}

	public int getmPoint() {
		return mPoint;
	}
	
	public String getmAddr4() {
		return mAddr4;
	}

	public void setmAddr4(String mAddr4) {
		this.mAddr4 = mAddr4;
	}

	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}

	public String getmGrade() {
		return mGrade;
	}

	public void setmGrade(String mGrade) {
		this.mGrade = mGrade;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public MemberVO(String mId, String mPw, String mEmail, String mPhone, String mName, int mAddr1, String mAddr2,
			String mAdr3, int mPoint, String mGrade, String mStatus) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.mName = mName;
		this.mAddr1 = mAddr1;
		this.mAddr2 = mAddr2;
		this.mAddr3 = mAdr3;
		this.mPoint = mPoint;
		this.mGrade = mGrade;
		this.mStatus = mStatus;
	}

	public MemberVO(String mId, String mPw, String mEmail, String mPhone, String mName, String mGrade) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.mName = mName;
		this.mGrade = mGrade;
	}

	@Override
	public String toString() {
		return "MemberVO [mId=" + mId + ", mPw=" + mPw + ", mEmail=" + mEmail + ", mPhone=" + mPhone + ", mName="
				+ mName + ", mAddr1=" + mAddr1 + ", mAddr2=" + mAddr2 + ", mAddr3=" + mAddr3 + ", mAddr4=" + mAddr4
				+ ", mPoint=" + mPoint + ", mGrade=" + mGrade + ", mStatus=" + mStatus + "]";
	}
	

}

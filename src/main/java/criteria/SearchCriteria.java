package criteria;

public class SearchCriteria extends Criteria{

	private String searchType;
	private String keyword;
	private String member_mId;
	
	public void setMember_mId(String member_mId) {
		this.member_mId = member_mId;
	}
	public String getMember_mId() {
		return member_mId;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return super.toString() + " SearchCriteria [searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}
}



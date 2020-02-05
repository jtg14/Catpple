package vo;

import java.util.ArrayList;

public class PageVO {
	
	private ArrayList<BoardVO> list ;  
	private int currPage ; //현재 페이지 번호  
	private int perPage = 5;//페이지당 보여줄 row갯수
	private int totalCount;  //전체 row갯수
	private int sno; // startRno
	private int eno; // endRno
	private int perPageNo = 3;//한 화면에 출력되는pageNo갯수 
	private String member_mId;			
	
	public ArrayList<BoardVO> getList() {
		return list;
	}
	public void setList(ArrayList<BoardVO> list) {
		this.list = list;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getMember_mId() {
		return member_mId;
	}
	public void setMember_mId(String member_mId) {
		this.member_mId = member_mId;
	}
	public int getPerPageNo() {
		return perPageNo;
	}
	public void setPerPageNo(int perPageNo) {
		this.perPageNo = perPageNo;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	@Override
	public String toString() {
		return "PageVO [list=" + list + ", currPage=" + currPage + ", perPage=" + perPage + ", totalCount=" + totalCount
				+ ", sno=" + sno + ", eno=" + eno + ", perPageNo=" + perPageNo + "]";
	}
} // class

package vo;

import java.util.ArrayList;

public class PageVO {
	
	private ArrayList<BoardVO> list ;  // ��ϸ���Ʈ ����
	private int currPage ;   // ���� ��û ������ ��ȣ
	private int perPage = 5; // �������� ������ row ����
	private int totalCount;  // ��ü row ����
	private int sno; // startRno
	private int eno; // endRno
	private int perPageNo = 3; 
						// �� ȭ�鿡 ��µǴ� PageNo ����
						// => paging2 ���� ���
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

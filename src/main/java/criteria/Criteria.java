package criteria;

public class Criteria {

	private int page;	// 현재 출력 PageNo
	private int perPageNum; // page 당 출력 row 갯수
	private int sno; // start rownum
	private int eno; // end rownum
	private String member_mId;
	
	public String getMember_mId() {
		return member_mId;
	}
	
	public void setMember_mId(String member_mId) {
		this.member_mId = member_mId;
	}
	
// 생성자로 초기화
	public Criteria(){
		this.page = 1;  
		this.perPageNum =10; 
	}
	
	public void setSnoEno(){
		if (sno<1) sno=0 ;
		this.sno=((page-1)*perPageNum) ; // - startRowNum 계산
		this.eno=(sno+perPageNum) ; // - endRowNum 계산 
	}
	
	public int getSno() {  
		return this.sno;
	}
	public int getEno() {  
		return this.eno ;
	}

	public void setPage(int page){
		if(page<1) page=1;
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum){
		
		if(perPageNum < 1 || perPageNum > 100){
			  this.perPageNum = 10;
		}else this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}	
	
	//method for MySQL Mapper - startRowNum
	public int getPageStart() {
		return (this.page -1)* perPageNum;
	}
	
	//method for MyBatis SQL Mapper 
	public int getPerPageNum(){
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page="+page+", perPageNum="+perPageNum+", sno="+sno+", eno="+eno+"]";
	}
} // class

package criteria;

public class Criteria {
    
    private int page; //현재 페이지 번호
    private int perPageNum;//한페이지당 보여줄 페이지갯수
    
    public int getPageStart() {//페이지의 게시글 시작번호
        return (this.page-1)*perPageNum;
    }
    
    public Criteria() {
        this.page = 1;
        this.perPageNum = 10;
    }
    
    public int getPage() {
        return page;
    }
    public void setPage(int page) {//페이지 음수값 되지 않게 설정
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
    public int getPerPageNum() {
        return perPageNum;
    }
    public void setPerPageNum(int pageCount) {//페이지당 보여줄글수 고정
        int cnt = this.perPageNum;
        if(pageCount != cnt) {
            this.perPageNum = cnt;
        } else {
            this.perPageNum = pageCount;
        }
    }
    
}

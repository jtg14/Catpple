package criteria;

// 패키지 org.springframework.web.util
// => 웹개발에 필요한 많은 유틸리티 클래스 제공
// => UriComponents , UriComponentsBuilder
//		Uri를 동적으로 생성해주는 클래스,
//		파라미터가 조합된 uri를 손쉽게 만들어줌
// => ?page=8&perPageNum=10 이것을 만들어줌

// Paging의 기본원칙-> 코드로...242p

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount;// Table전체 row 갯수
	private int startPage; // View에 표시할 첫 PageNo
	private int endPage;   // View에 표시할 끝 PageNo
	private int lastPage;  // 전체 row의 마지막 PageNo
	private boolean prev;  // 이전 Page블럭 으로
	private boolean next;  // 다음 Page블럭 으로
	
	private int displayPageNum = 5; // View에 표시할 PageNo 갯수
	
	private SearchCriteria cri;
	//private SearchCriteria cri;
	

	public void setCri(SearchCriteria cri) {
		this.cri = cri;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();  
		// totalCount 값을 이용해서 
		// endPage, startPage, lastPage, prev, next 모두 계산
	}

	private void calcData() {
		
		endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum ) * displayPageNum);
		// Math.ceil(c) : 매개변수 c 보다 크면서 같은 가장 작은 정수를 double 형태로 반환
		// ceil : 천장   ,  예) 11/3=3.666..  lastPage=4
		startPage = (endPage - displayPageNum) + 1;
		
		// 마지막 pageNO 계산 
		lastPage = (int)(Math.ceil(totalCount / (double)cri.getPerPageNum()));
		// 예) total_row=11, perPage=3  => 11/3=3.666..  lastPage=4
		
		if(endPage > lastPage){
			endPage = lastPage;
		}
		
		prev = startPage ==1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
		
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
	
	public int getLastPage() {
		return lastPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public SearchCriteria getCri() {
		return cri;
	}
	
	public String makeQuery(int page){
		UriComponents uriComponents =
	            UriComponentsBuilder.newInstance()
	            .queryParam("page", page)
	            .queryParam("perPageNum", cri.getPerPageNum())
	            .build();	            
		
		return uriComponents.toUriString();
	}
	
//	** UriComponents , UriComponentsBuilder
//	=> Uri 를 동적으로 생성해주는 클래스이다. 
//	=> 파라미터가 조합된 uri를 손쉽게 만들어준다 
//	    (코드를 수동으로 조합해 만들어서 나오는 실수방지)
//		
//	     -  ?page=8&perPageNum=10  이것을 만들어줌
//	     -  ? 부터 만들어지므로 jsp Code에서 ? 포함하지 않도록 주의 

	public String makeSearch(int page){
		UriComponents uriComponents =
	            UriComponentsBuilder.newInstance()
	            .queryParam("page", page)
	            .queryParam("perPageNum", cri.getPerPageNum())
 	            .queryParam("searchType", cri.getSearchType())
 	            .queryParam("keyword", cri.getKeyword())
	            .build();	
		
		//.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
        //.queryParam("keyword", ((SearchCriteria)cri).getKeyword())
		// (SearchCriteria)cri).getSearchType() 
		// => cri 를 후손(SearchCriteria) 을 형변환하여 후손의 맴버에 접근하는 경우
		// => 위에서  private SearchCriteria cri 로 정의 했으므로 필요없음
		return uriComponents.toUriString();
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", lastPage=" + lastPage + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum
				+ ", cri=" + cri + "]";
	}	
	
} // class

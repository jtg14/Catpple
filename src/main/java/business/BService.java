package business;

import java.util.ArrayList;

import criteria.SearchCriteria;
import vo.BoardVO;
import vo.PageVO;

public interface BService {
	int inquiryInsert(BoardVO vo);
	
    int suggestionInsert(BoardVO vo);
    
    public BoardVO selectOne(BoardVO vo);
    
    public int bReplyUpdate(BoardVO vo);
    
	public PageVO inquirySelectPageList(PageVO pvo);
	
	public PageVO inquirySelectPageListForManager(PageVO pvo);
	
	public PageVO suggestionSelectPageList(PageVO pvo);
	
	public PageVO suggestionSelectPageListForManager(PageVO pvo);
	
	public int boardDelete(BoardVO vo);
	
	public int boardUpdate(BoardVO vo);
	
	public ArrayList<BoardVO> searchCriList(SearchCriteria cri);
	
	public int searchCriCount(SearchCriteria cri);
	
	public ArrayList<BoardVO> searchCriListForManager(SearchCriteria cri);
	
	public int searchCriCountForManager(SearchCriteria cri);
	
	public ArrayList<BoardVO> suggestionSearchCriListForManager(SearchCriteria cri);
	
	public int suggestionSearchCriCountForManager(SearchCriteria cri);
	
	public ArrayList<BoardVO> suggestionSearchCriList(SearchCriteria cri);
	
	public int suggestionSearchCriCount(SearchCriteria cri);
}

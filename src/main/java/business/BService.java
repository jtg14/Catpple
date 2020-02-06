package business;

import java.util.ArrayList;

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
	

	
}

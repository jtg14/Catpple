package business;

import java.util.ArrayList;

import vo.BoardVO;
import vo.PageVO;

public interface BService {
	int inquiryInsert(BoardVO vo);
	
    int suggestionInsert(BoardVO vo);
    
    ArrayList<BoardVO> inquirySelectList(BoardVO vo);
    
    public ArrayList<BoardVO> suggestionSelectList(BoardVO vo);
    
    public BoardVO selectOne(BoardVO vo);
    
    public ArrayList<BoardVO> inquirySelectListForManager();
    
    public ArrayList<BoardVO> suggestionSelectListForManager();
    
    public int bReplyUpdate(BoardVO vo);
    
	public PageVO inquirySelectPageList(PageVO pvo);
	
}

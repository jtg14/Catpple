package business;

import java.util.ArrayList;

import vo.BoardVO;

public interface BService {
	int inquiryInsert(BoardVO vo);
	
    int suggestionInsert(BoardVO vo);
    
    ArrayList<BoardVO> inquirySelectList(BoardVO vo);
    
    public ArrayList<BoardVO> suggestionSelectList(BoardVO vo);
    
    public BoardVO selectOne(BoardVO vo);
	
}

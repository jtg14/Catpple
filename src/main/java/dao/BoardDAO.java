package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criteria.SearchCriteria;
import vo.BoardVO;
import vo.PageVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession dao;
	private final static String NS ="portfolio.mapper.BoardMapper.";
	
	
	public int inquiryInsert(BoardVO vo) {
		return dao.insert(NS+"bInquiryInsert",vo);
	}
	
	public int suggestionInsert(BoardVO vo) {
		return dao.insert(NS+"bSuggestionInsert",vo);
	}
	
	
	public BoardVO selectOne(BoardVO vo) {
		return dao.selectOne(NS+"selectOne",vo);
	}
	
	
	public int bReplyUpdate(BoardVO vo) {
		return dao.insert(NS+"bReplyUpdate",vo);
	}
	
	public PageVO inquirySelectPageList(PageVO pvo) {
		pvo.setTotalCount(dao.selectOne(NS+"inquiryTotalRowCount",pvo));
		pvo.setList((ArrayList)dao.selectList(NS+"inquirySelectPageList",pvo));
		return pvo;
	}
	
	public PageVO suggestionSelectPageList(PageVO pvo) {
		pvo.setTotalCount(dao.selectOne(NS+"suggestionTotalRowCount",pvo));
		pvo.setList((ArrayList)dao.selectList(NS+"suggestionSelectPageList",pvo));
		return pvo;
	}
	
	public PageVO inquirySelectPageListForManager(PageVO pvo) {
		pvo.setTotalCount(dao.selectOne(NS+"inquiryTotalRowCountForManager",pvo));
		pvo.setList((ArrayList)dao.selectList(NS+"inquirySelectPageListForManager",pvo));
		return pvo;
	}
	
	public PageVO suggestionSelectPageListForManager(PageVO pvo) {
		pvo.setTotalCount(dao.selectOne(NS+"suggestionTotalRowCountForManager",pvo));
		pvo.setList((ArrayList)dao.selectList(NS+"suggestionSelectPageListForManager",pvo));
		return pvo;
	}
	
	public int boardDelete(BoardVO vo) {
		return dao.delete(NS+"boardDelete",vo);
	}
	
	public int suggestionDelete(BoardVO vo) {
		return dao.delete(NS+"suggestionDelete",vo);
	}
	
	public int boardUpdate(BoardVO vo) {
		return dao.update(NS+"boardUpdate",vo);
	}
	
	public ArrayList<BoardVO> searchCriList(SearchCriteria cri) {
		return (ArrayList)dao.selectList(NS+"searchCriList", cri);
	}
	
	public int searchCriCount(SearchCriteria cri) {
		return dao.selectOne(NS+"searchCriCount",cri);
	}
	
	public ArrayList<BoardVO> searchCriListForManager(SearchCriteria cri){
		return (ArrayList)dao.selectList(NS+"searchCriListForManager", cri);
	}
	
	public int searchCriCountForManager(SearchCriteria cri) {
		return dao.selectOne(NS+"searchCriCountForManager", cri);
	}
	
	public ArrayList<BoardVO> suggestionSearchCriListForManager(SearchCriteria cri){
		return (ArrayList)dao.selectList(NS+"suggestionSearchCriListForManager",cri);
	}
	
	public int suggestionSearchCriCountForManager(SearchCriteria cri) {
		return dao.selectOne(NS+"suggestionSearchCriCountForManager",cri);
	}
	
	
	
}//class

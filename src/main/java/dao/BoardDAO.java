package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardVO;
import vo.PageVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession dao;
	private final static String NS ="portfolio.mapper.BoardMapper.";
	
	
	public int inquiryInsert(BoardVO vo) {
		return dao.insert(NS+"bInquiryInsert",vo);
	};
	
	public int suggestionInsert(BoardVO vo) {
		return dao.insert(NS+"bSuggestionInsert",vo);
	}
	
	public ArrayList<BoardVO> inquirySelectList(BoardVO vo) {
		return (ArrayList)dao.selectList(NS+"inquirySelectList",vo);
	};
	
	public ArrayList<BoardVO> suggestionSelectList(BoardVO vo){
		return (ArrayList)dao.selectList(NS+"suggestionSelectList",vo);
	}
	
	public BoardVO selectOne(BoardVO vo) {
		return dao.selectOne(NS+"selectOne",vo);
	}
	
	public ArrayList<BoardVO> inquirySelectListForManager(){
		return (ArrayList)dao.selectList(NS+"inquirySelectListForManager");
	}
	
	public ArrayList<BoardVO> suggestionSelectListForManager(){
		return (ArrayList)dao.selectList(NS+"suggestionSelectListForManager");
	}
	
	public int bReplyUpdate(BoardVO vo) {
		return dao.insert(NS+"bReplyUpdate",vo);
	}
	
	public PageVO inquirySelectPageList(PageVO pvo) {
		pvo.setTotalCount(dao.selectOne(NS+"inquiryTotalRowCount",pvo));
//		System.out.println("totalRowCount=>"+pvo.getTotalCount());
//		System.out.println("sno in DAO =>"+pvo.getSno());
		pvo.setList((ArrayList)dao.selectList(NS+"inquirySelectPageList",pvo));
		return pvo;
	}
	
	public PageVO suggestionSelectPageList(PageVO pvo) {
		pvo.setTotalCount(dao.selectOne(NS+"suggestionTotalRowCount"));
		pvo.setList((ArrayList)dao.selectList(NS+"suggestionSelectPageList",pvo));
		return pvo;
	}
	
	public PageVO inquirySelectPageListForManager(PageVO pvo) {
		pvo.setTotalCount(dao.selectOne(NS+"inquiryTotalRowCountForManager",pvo));
//		System.out.println("sno in DAO for Manager=>"+pvo.getSno());
		pvo.setList((ArrayList)dao.selectList(NS+"inquirySelectPageListForManager",pvo));
		return pvo;
	}
	
	public PageVO suggestionSelectPageListForManager(PageVO pvo) {
		pvo.setTotalCount(dao.selectOne(NS+"suggestionTotalRowCountForManager"));
		pvo.setList((ArrayList)dao.selectList(NS+"suggestionSelectPageListForManager",pvo));
		return pvo;
	}
}//class

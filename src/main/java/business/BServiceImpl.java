package business;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.SearchCriteria;
import dao.BoardDAO;
import vo.BoardVO;
import vo.PageVO;
@Service
public class BServiceImpl implements BService {
	@Autowired
	BoardDAO dao;

	@Override
	public int inquiryInsert(BoardVO vo) {
		return dao.inquiryInsert(vo);
	}

	@Override
	public int suggestionInsert(BoardVO vo) {
		return dao.suggestionInsert(vo);
	}

	@Override
	public BoardVO selectOne(BoardVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int bReplyUpdate(BoardVO vo) {
		return dao.bReplyUpdate(vo);
	}

	@Override
	public PageVO inquirySelectPageList(PageVO pvo) {
		return dao.inquirySelectPageList(pvo);
	}

	@Override
	public PageVO inquirySelectPageListForManager(PageVO pvo) {
		return dao.inquirySelectPageListForManager(pvo);
	}

	@Override
	public PageVO suggestionSelectPageList(PageVO pvo) {
		return dao.suggestionSelectPageList(pvo);
	}

	@Override
	public PageVO suggestionSelectPageListForManager(PageVO pvo) {
		return dao.suggestionSelectPageListForManager(pvo);
	}

	@Override
	public int boardDelete(BoardVO vo) {
		return dao.boardDelete(vo);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return dao.boardUpdate(vo);
	}

	@Override
	public ArrayList<BoardVO> searchCriList(SearchCriteria cri) {
		return dao.searchCriList(cri);
	}

	@Override
	public int searchCriCount(SearchCriteria cri) {
		return dao.searchCriCount(cri);
	}

	@Override
	public ArrayList<BoardVO> searchCriListForManager(SearchCriteria cri) {
		return dao.searchCriListForManager(cri);
	}

	@Override
	public int searchCriCountForManager(SearchCriteria cri) {
		return dao.searchCriCountForManager(cri);
	}
	
	
	
	
	
	
}

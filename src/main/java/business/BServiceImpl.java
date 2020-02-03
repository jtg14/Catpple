package business;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDAO;
import vo.BoardVO;
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
	public ArrayList<BoardVO> inquirySelectList(BoardVO vo) {
		return dao.inquirySelectList(vo);
	}

	@Override
	public ArrayList<BoardVO> suggestionSelectList(BoardVO vo) {
		return dao.suggestionSelectList(vo);
	}

	@Override
	public BoardVO selectOne(BoardVO vo) {
		return dao.selectOne(vo);
	}

	@Override
	public ArrayList<BoardVO> inquirySelectListForManager() {
		return dao.inquirySelectListForManager();
	}

	@Override
	public ArrayList<BoardVO> suggestionSelectListForManager() {
		return dao.suggestionSelectListForManager();
	}

	@Override
	public int bReplyUpdate(BoardVO vo) {
		return dao.bReplyUpdate(vo);
	}

	
	
}

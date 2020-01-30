package business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.GoodsDAO;
import vo.GoodsVO;

@Service
public class GServiceImpl implements GService {
	
	@Autowired
	GoodsDAO dao;
	
	@Override
	public int goodsInsert(GoodsVO vo) {
		return dao.goodsInsert(vo);
	}
}

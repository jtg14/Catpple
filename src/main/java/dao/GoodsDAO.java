package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.GoodsVO;

@Repository
public class GoodsDAO {
	
	@Autowired
	private SqlSession dao;
	private final static String NS ="portfolio.mapper.GoodsMapper.";
	
	public int goodsInsert(GoodsVO vo) {
		return dao.insert(NS+"goodsInsert", vo);
	}
}

package dao;

import java.util.ArrayList;

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
	public ArrayList<GoodsVO> goodsSearch(String keyword){
		return (ArrayList)dao.selectList(NS+"goodsSearch",keyword);
	}
	public GoodsVO goodsDetail(GoodsVO vo) {
		return dao.selectOne("goodsDetail",vo);
	}
}

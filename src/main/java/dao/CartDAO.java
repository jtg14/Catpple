package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVO;


@Repository
public class CartDAO {
	
	@Autowired
	private SqlSession dao;
	private final static String NS ="portfolio.mapper.CartMapper.";
	
	public int infoToCart(CartVO vo) {
		return dao.insert(NS+"infoToCart",vo);
	}
	public CartVO findDupGoods(CartVO vo) {
		return dao.selectOne(NS+"findDupGoods",vo);
	}
}

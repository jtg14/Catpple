package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVO;
import vo.MemberVO;


@Repository
public class CartDAO {
	
	@Autowired
	private SqlSession dao;
	private final static String NS ="portfolio.mapper.CartMapper.";
	
	public int infoToCart(CartVO vo) {
		System.out.println("여기는 CartDAO vo = "+vo);
		return dao.insert(NS+"infoToCart",vo);
	}
	public CartVO findDupGoods(CartVO vo) {
		return dao.selectOne(NS+"findDupGoods",vo);
	}
	public ArrayList<CartVO> cartList(MemberVO vo){
		return (ArrayList)dao.selectList(NS+"cartList",vo);
	}
	public int deleteCart(CartVO vo) {
		return dao.delete(NS+"deleteCart",vo);
	}
	
}

package business;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CartDAO;
import vo.CartVO;
import vo.MemberVO;

@Service
public class CServiceImpl implements CService {
	@Autowired
	CartDAO dao;	
	
	@Override
	public int infoToCart(CartVO vo) {
		return dao.infoToCart(vo);
	}
	@Override
	public CartVO findDupGoods(CartVO vo) {
		return dao.findDupGoods(vo);
	}
	@Override
	public ArrayList<CartVO> cartList(MemberVO vo) {
		return dao.cartList(vo);
	}
	@Override
	public int deleteCart(CartVO vo) {
		return dao.deleteCart(vo);
	}
}

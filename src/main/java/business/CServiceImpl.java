package business;

import java.util.ArrayList;
import java.util.Map;

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
	public ArrayList<CartVO> cartList(Map<String,Object> map) {
		return dao.cartList(map);
	}
	@Override
	public int cartListCount(MemberVO vo) {
		return dao.cartListCount(vo);
	}
	@Override
	public int deleteCart(CartVO vo) {
		return dao.deleteCart(vo);
	}
	@Override
	public int getCartRow(MemberVO vo) {
		return dao.getCartRow(vo);
	}
	@Override
	public ArrayList<CartVO> purchaseList(int[] arr,String memberid) {
		return dao.purchaseList(arr,memberid);
	}
	

}

package business;

import java.util.ArrayList;

import vo.CartVO;
import vo.GoodsVO;
import vo.MemberVO;

public interface CService {
	int infoToCart(CartVO vo);
	
	CartVO findDupGoods(CartVO vo);
	
	ArrayList<CartVO> cartList(MemberVO vo);
	
	int deleteCart(CartVO vo);
	
	int getCartRow(MemberVO vo);
	
	ArrayList<CartVO> purchaseList(int [] arr,String memberid);
	
	ArrayList<CartVO> selectReceivedOrderList(GoodsVO vo);
}

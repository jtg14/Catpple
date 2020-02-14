package business;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import vo.CartVO;
import vo.GoodsVO;
import vo.MemberVO;

public interface CService {
	int infoToCart(CartVO vo);
	
	CartVO findDupGoods(CartVO vo);
	
	ArrayList<CartVO> cartList(Map<String,Object> map);
	
	int deleteCart(CartVO vo);
	
	int getCartRow(MemberVO vo);
	
	int cartListCount(MemberVO vo);
	
	ArrayList<CartVO> purchaseList(int [] arr,String memberid);
	
	
}

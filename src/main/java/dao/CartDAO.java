package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CartVO;
import vo.GoodsVO;
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
	public ArrayList<CartVO> cartList(Map<String,Object> map){
		return (ArrayList)dao.selectList(NS+"cartList",map);
	}
	public int cartListCount(MemberVO vo) {
		return dao.selectOne(NS+"cartListCount",vo);
	}
	public int deleteCart(CartVO vo) {
		return dao.delete(NS+"deleteCart",vo);
	}
	public int getCartRow(MemberVO vo) {
		return dao.selectOne(NS+"getCartRow",vo);
	}
	public ArrayList<CartVO> purchaseList(int [] arr,String memberid){
		Map<String,Object> map = new HashMap<String,Object>();
		ArrayList<Integer> checkedCId = new ArrayList<Integer>();
		for(int i = 0;i < arr.length;i++) {
			checkedCId.add(arr[i]);
		}
		map.put("member_mId",memberid);
		map.put("cIdList",checkedCId);
		return(ArrayList) dao.selectList(NS+"purchaseList",map);
	}
	
	
	
	
	
	
	
}

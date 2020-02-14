package dao;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criteria.Criteria;
import criteria.SearchCriteria;
import vo.GoodsVO;
import vo.MemberVO;
import vo.OrderVO;
import vo.PaymentVO;

	@Repository
	public class OrderDAO {
	@Autowired
	SqlSession dao;
	private final static String NS ="portfolio.mapper.OrderMapper.";
	
	public int insertPayment(PaymentVO vo) {
		dao.insert(NS+"insertPayment",vo);
		int pNum = vo.getpNum();
		return pNum;
	}
	public int insertOandD(ArrayList olist) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("olist",olist);
		return dao.insert(NS+"insertOandD",map);
	}

	public PaymentVO findPayment(PaymentVO vo) {
		return dao.selectOne(NS+"findPayment",vo);
	}

	
	public ArrayList<OrderVO> oListInPnum(PaymentVO vo){
		return (ArrayList)dao.selectList(NS+"oListInPnum", vo);
	}
	
	public ArrayList<OrderVO> getOrderList(PaymentVO vo) {
		return (ArrayList)dao.selectList(NS+"getOrderList",vo);
	}

	
	public ArrayList<OrderVO> selectReceivedOrderList(GoodsVO vo) {
		//vo.setTotalCount(dao.selectOne(NS+""),vo);
		return (ArrayList)dao.selectList(NS+"selectReceivedOrderList",vo);
	}
	
	public ArrayList<OrderVO> selectDeliveryCompletionList(GoodsVO gvo){
		return (ArrayList)dao.selectList(NS+"selectDeliveryCompletionList",gvo);
	}
	public int changeDstate(List<Integer> list) {
		return dao.update(NS+"changeDstate", list);
	}

	public int changeStatus(OrderVO vo) {
		return dao.update(NS+"changeStatus",vo);
	}

	public int changeDstateToD() {
		return dao.update(NS+"changeDstateToD");
	}
	public ArrayList<OrderVO> canceledList(Map<String,Object> map) {
		return (ArrayList)dao.selectList(NS+"canceledList",map);
	}
	public int canceledListCount(MemberVO vo) {
		return dao.selectOne(NS+"canceledListCount",vo);
	}
	public ArrayList<OrderVO> returnedList(MemberVO vo){
		return (ArrayList)dao.selectList(NS+"returnedList",vo);
	}
	
	public ArrayList<OrderVO> criDeliveryCompletionList(SearchCriteria cri){
		return (ArrayList)dao.selectList(NS+"criDeliveryCompletionList", cri);
	}
	
	public ArrayList<OrderVO> criSelectReceivedOrderList(SearchCriteria cri){
		return (ArrayList)dao.selectList(NS+"criSelectReceivedOrderList", cri);
	}
	
	public int criSelectReceivedOrderCount(SearchCriteria cri) {
		return dao.selectOne(NS+"criSelectReceivedOrderCount", cri);
	}
	
	public int criDeliveryCompletionCount(SearchCriteria cri) {
		return dao.selectOne(NS+"criDeliveryCompletionCount", cri);
	}
	
	
	
}

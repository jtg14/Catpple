package dao;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int changeStatus(OrderVO vo) {
		return dao.update(NS+"changeStatus",vo);
	}
}

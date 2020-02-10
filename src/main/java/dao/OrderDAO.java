package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.DeliveryVO;
import vo.OrderVO;
import vo.PaymentVO;

	@Repository
	public class OrderDAO {
	@Autowired
	SqlSession dao;
	private final static String NS ="portfolio.mapper.OrderMapper.";
	
	public int  insertOrder(OrderVO vo) {
		int oNum = dao.insert(NS+"insertOrder",vo);
		System.out.println("결과 처리후 return 된 oNum : " +oNum);
		return oNum;
	}
	public OrderVO findOrder(int oNum) {
		return dao.selectOne(NS+"findOrder",oNum);
	}

}

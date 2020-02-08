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
		return dao.insert(NS+"insertOrder",vo);
	}
	public int insertPayment(PaymentVO vo) {
		return dao.insert(NS+"insertPayment",vo);
	}
	public int insertDelivery(DeliveryVO vo) {
		return dao.insert(NS+"insertDelivery",vo);
	}
}

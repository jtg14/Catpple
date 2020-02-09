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
	
	public OrderVO  insertOrder(OrderVO vo) {
		return dao.selectOne(NS+"insertOrder",vo);
	}

}

package business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OrderDAO;
import vo.DeliveryVO;
import vo.OrderVO;
import vo.PaymentVO;
@Service
public class OServiceImpl implements OService {
	@Autowired
	OrderDAO dao;

	@Override
	public int insertOrder(OrderVO vo) {
		return dao.insertOrder(vo);
	}
	@Override
	public OrderVO findOrder(int oNum) {
		return dao.findOrder(oNum);
	}
}

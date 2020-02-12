package business;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.OrderDAO;
import vo.GoodsVO;
import vo.OrderVO;
import vo.PaymentVO;
@Service
public class OServiceImpl implements OService {
	@Autowired
	OrderDAO dao;

	@Override
	public int insertOandD(ArrayList olist) {
		return dao.insertOandD(olist);
	}
	@Override
	public int insertPayment(PaymentVO vo) {
		return dao.insertPayment(vo);
	}
	@Override
	public PaymentVO findPayment(PaymentVO vo) {
		return dao.findPayment(vo);
	}
	@Override

	public ArrayList<OrderVO> oListInPnum(PaymentVO vo) {
		return dao.oListInPnum(vo);
	}
	
	public ArrayList<OrderVO> getOrderList(PaymentVO vo) {
		return dao.getOrderList(vo);
	}
	@Override
	public ArrayList<OrderVO> selectReceivedOrderList(GoodsVO vo) {
		return dao.selectReceivedOrderList(vo);
	}
	@Override
	public int changeDstate(List<Integer> list) {
		return dao.changeDstate(list);
	}

}

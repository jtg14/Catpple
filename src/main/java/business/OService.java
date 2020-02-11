package business;

import java.util.ArrayList;

import vo.OrderVO;
import vo.PaymentVO;

public interface OService {

	int insertOandD(ArrayList olist);
	
	int insertPayment(PaymentVO vo);
	
	PaymentVO findPayment(PaymentVO vo);
	
	ArrayList<OrderVO> getOrderList(PaymentVO vo);
}

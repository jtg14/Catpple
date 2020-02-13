package business;

import java.util.ArrayList;
import java.util.List;

import criteria.Criteria;
import criteria.SearchCriteria;
import vo.GoodsVO;
import vo.MemberVO;
import vo.OrderVO;
import vo.PaymentVO;

public interface OService {

	int insertOandD(ArrayList olist);
	
	int insertPayment(PaymentVO vo);
	
	PaymentVO findPayment(PaymentVO vo);

	ArrayList<OrderVO> oListInPnum(PaymentVO vo);

	ArrayList<OrderVO> getOrderList(PaymentVO vo);

	ArrayList<OrderVO> selectReceivedOrderList(GoodsVO vo);

	int changeDstate(List<Integer> list);

	int changeStatus(OrderVO vo);
	
	int changeDstateToD();
	
	ArrayList<OrderVO> canceledList(MemberVO vo);
	
	ArrayList<OrderVO> returnedList(MemberVO vo);
	
	ArrayList<OrderVO> selectDeliveryCompletionList(GoodsVO gvo);
	
	
}

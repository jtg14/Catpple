package business;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	
	int canceledListCount(MemberVO vo);
	
	int returnedListCount(MemberVO vo);
	
	ArrayList<OrderVO> canceledList(Map<String,Object> map);
	
	ArrayList<OrderVO> returnedList(Map<String,Object> map);
	
	ArrayList<OrderVO> selectDeliveryCompletionList(GoodsVO gvo);
	
	ArrayList<OrderVO> criDeliveryCompletionList(SearchCriteria cri);
	
	ArrayList<OrderVO> criSelectReceivedOrderList(SearchCriteria cri);
	
	int criSelectReceivedOrderCount(SearchCriteria cri);
	
	int criDeliveryCompletionCount(SearchCriteria cri);
}

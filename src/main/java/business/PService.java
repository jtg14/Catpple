package business;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import vo.MemberVO;
import vo.PaymentVO;

public interface PService {
	
	ArrayList<PaymentVO> paymentList(Map<String,Object> map);
	 
	int paymentListCount(MemberVO vo);
}

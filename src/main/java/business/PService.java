package business;

import java.util.ArrayList;

import vo.MemberVO;
import vo.PaymentVO;

public interface PService {
	
	ArrayList<PaymentVO> paymentList(MemberVO vo);
	
	
}

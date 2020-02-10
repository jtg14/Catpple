package business;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PaymentDAO;
import vo.MemberVO;
import vo.PaymentVO;

@Service
public class PServiceImpl implements PService {
	@Autowired
	PaymentDAO dao;

	@Override
	public ArrayList<PaymentVO> paymentList(MemberVO vo) {
		return dao.paymentList(vo);
	}
	
	
	
}

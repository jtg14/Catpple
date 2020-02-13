package business;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.SearchCriteria;
import dao.PaymentDAO;
import vo.MemberVO;
import vo.PaymentVO;

@Service
public class PServiceImpl implements PService {
	@Autowired
	PaymentDAO dao;
	
	@Override
	public ArrayList<PaymentVO> paymentList(Map<String,Object> map){
		return dao.paymentList(map);
	}
	public int paymentListCount(MemberVO vo) {
		return dao.paymentListCount(vo);
	}
}

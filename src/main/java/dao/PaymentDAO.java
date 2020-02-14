package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criteria.SearchCriteria;
import vo.MemberVO;
import vo.PaymentVO;

@Repository
public class PaymentDAO {
	@Autowired
	SqlSession dao;
	private final static String NS ="portfolio.mapper.PaymentMapper.";
	
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<PaymentVO> paymentList(Map<String,Object> map){
		return (ArrayList)dao.selectList(NS+"paymentList",map);
	}
	public int paymentListCount(MemberVO vo) {
		return (Integer) dao.selectOne(NS+"paymentListCount",vo);
	}
	
}

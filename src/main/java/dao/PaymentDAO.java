package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;
import vo.PaymentVO;

@Repository
public class PaymentDAO {
	@Autowired
	SqlSession dao;
	private final static String NS ="portfolio.mapper.PaymentMapper.";
	
	
	public ArrayList<PaymentVO> paymentList(MemberVO vo){
		
		return (ArrayList)dao.selectList(NS+"paymentList",vo);
		
	}
	
	
}

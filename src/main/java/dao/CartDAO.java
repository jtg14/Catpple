package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSession dao;
	private final static String NS ="portfolio.mapper.CartMapper.";
	
}

package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession dao;
	private final static String NS ="portfolio.mapper.MemberMapper.";
	
	public int join(MemberVO vo) {
			return dao.insert(NS+"join",vo);
		}
		
	
	public MemberVO idCheck(MemberVO vo) {
		return dao.selectOne(NS+"idcheck",vo);
	}
	public MemberVO phoneCheck(MemberVO vo) {
		return dao.selectOne(NS+"phoneCheck",vo);
	}
	public MemberVO login(MemberVO vo) {
		vo = dao.selectOne(NS+"logIn",vo);
		return vo; 
		
	}
	public int mChange(MemberVO vo) {
		return dao.update(NS+"mChange", vo);
	}
	public int mdelete(MemberVO vo) {
		return dao.update(NS+"mdelete", vo);
	}
	public MemberVO findCompany(MemberVO vo) {
		return dao.selectOne(NS+"findCompany",vo);
	}
	public int ChangePassword(MemberVO vo) {
		return dao.update(NS+"ChangePassword",vo);
	}
	
}

package business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDAO;
import vo.MemberVO;
@Service
public class MServiceImpl implements MService {
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public int join(MemberVO vo) {
		return dao.join(vo);
	}
	@Override
	public MemberVO idCheck(MemberVO vo) {
		return (MemberVO)dao.idCheck(vo);
	}
	@Override
	public MemberVO phoneCheck(MemberVO vo) {
		return(MemberVO)dao.phoneCheck(vo);
	}
	@Override
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}
	@Override
	public int mChange(MemberVO vo) {
		return dao.mChange(vo);
	}
}

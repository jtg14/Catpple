package business;

import vo.MemberVO;

public interface MService {

	int join(MemberVO vo);
	
	int mChange(MemberVO vo);
	
	MemberVO idCheck(MemberVO vo);
	
	MemberVO phoneCheck(MemberVO vo);
	
	MemberVO login(MemberVO vo);
}
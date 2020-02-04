package business;

import vo.MemberVO;

public interface MService {

	int join(MemberVO vo);
	
	int mChange(MemberVO vo);
	
	int mdelete(MemberVO vo);
	
	MemberVO idCheck(MemberVO vo);
	
	MemberVO phoneCheck(MemberVO vo);
	
	MemberVO login(MemberVO vo);
	
	MemberVO findCompany(MemberVO vo);
	
	int ChangePassword(MemberVO vo);
}
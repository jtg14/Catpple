package com.portfolio.project;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import business.MService;
import vo.MemberVO;

@Controller
public class UserController {
	@Autowired
	MService service;

	
	
	@RequestMapping(value ="/signupf")//회원가입
	public ModelAndView SignUpForm(ModelAndView model,HttpServletRequest request) {
		model.setViewName("logIn/signUpForm");
		return model;
	}
	@RequestMapping(value ="/mroom")//마이룸 메인
	public ModelAndView myRoom(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myroom");
		return model;
	}
	@RequestMapping(value ="/mpoint")//포인트
	public ModelAndView myInfoPoint(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myInfoPoint");
		return model;
	}
	@RequestMapping(value ="/mEPoint")//적립 예정 포인트
	public ModelAndView myInfoExpectedPoints(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myInfoExpectedPoints");
		return model;
	}
	@RequestMapping(value ="/mODelivery")//주문/배송 조회
	public ModelAndView myInfoOrderDelivery(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myInfoOrderDelivery");
		return model;
	}
	@RequestMapping(value ="/mOCancel")//주문 취소
	public ModelAndView myInfoOrderCancel(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myInfoOrderCancel");
		return model;
	}
	@RequestMapping(value ="/mRExchange")//반품/교환
	public ModelAndView myInfoReturnExchange(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myInfoReturnExchange");
		return model;
	}
	@RequestMapping(value ="/mCart")//장바구니
	public ModelAndView myInfoCart(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myInfoCart");
		return model;
	}
	@RequestMapping(value ="/mFAQ")//FAQ
	public ModelAndView myInfoFAQ(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myInfoFAQ");
		return model;
	}
	@RequestMapping(value ="/mSuggestions")//건의 사항
	public ModelAndView myInfoSuggestions(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myInfoSuggestions");
		return model;
	}
	@RequestMapping(value ="/mChangef")//내정보변경
	public ModelAndView myInfoChange(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myInfoChange");
		return model;
	}
	@RequestMapping(value ="/mWdrawal")//회원탈퇴
	public ModelAndView myInfoWithdrawal(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myInfoWithdrawal");
		return model;
	}
	
	
	@RequestMapping(value ="/sIAP")//아이디 비밀번호 찾기
	public ModelAndView searchIDAndPW(ModelAndView model,HttpServletRequest request) {
		model.setViewName("logIn/searchIDAndPW");
		return model;
	}
	@RequestMapping(value ="/logInf")//로그인폼
	public ModelAndView logInForm(ModelAndView model,HttpServletRequest request) {
		model.setViewName("logIn/logInForm");
		return model;
	}
	@RequestMapping(value ="/changePw")//비밀번호변경
	public ModelAndView changePw(ModelAndView model,HttpServletRequest request) {
		model.setViewName("logIn/changePw");
		return model;
	}
	@RequestMapping(value ="/idCheck")//아이디 중복검사
	public ModelAndView idCheck(ModelAndView model,MemberVO vo ) {
		if(service.idCheck(vo) == null) {
			model.addObject("code",200);
		}else {
			model.addObject("code",201);
		}
		model.setViewName("jsonView");
		return model;
	}
	@RequestMapping(value ="/signup")//회원가입진행
	public ModelAndView signupGo(ModelAndView model,MemberVO vo,HttpServletRequest request) {
		vo = new MemberVO(
		request.getParameter("id"),
		request.getParameter("password"),
		request.getParameter("email"),
		request.getParameter("phone"),
		request.getParameter("name"),
		request.getParameter("options")
		);
		if(service.join(vo)>0) {//회원가입성공
			File sellerPersonalFolder = new File("C:\\Jason\\Catpple\\src\\main\\webapp\\resources\\sellerInfo\\"+vo.getmId());
			if (!sellerPersonalFolder.exists()) {  // ff의 존재여부 확인
				sellerPersonalFolder.mkdir();		// 없으면 생성	
				System.out.println("판매자로 회원가입이 완료되어 디렉토리 생성");
			}
			model.setViewName("logIn/logInForm");
		}else {//회원가입실패
			model.setViewName("logIn/signUpForm");
		}
		return model;
	}

	@RequestMapping(value ="/phoneCheck")//아이디 중복검사
	public ModelAndView phoneCheck(ModelAndView model,MemberVO vo ) {
		if(service.phoneCheck(vo) == null) {
			model.addObject("code",200);
		}else {
			model.addObject("code",201);
		}
		model.setViewName("jsonView");
		return model;
	}
	@RequestMapping(value ="/logIn")//로그인진행
	public ModelAndView logIn(ModelAndView model,MemberVO vo,HttpServletRequest request) {
		vo = service.login(vo);
		if(vo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("logInUser",vo);
			session.setMaxInactiveInterval(60 * 60 * 2); //두시간
			model.addObject("logIn","success");
		}else if(vo == null){
			model.addObject("logIn","failed");
		}
		model.setViewName("jsonView");
		return model;
	}
	@RequestMapping(value="/logOut")
	public ModelAndView logOut(ModelAndView model,HttpServletRequest request) {
		request.getSession().invalidate();
		model.setViewName("index");
		return model;
	}
	@RequestMapping(value="/mchange")
	public ModelAndView myInfoChange(ModelAndView model,HttpServletRequest request, MemberVO vo) {
		int cnt = service.mChange(vo);
		if(cnt>0) {
			System.out.println("정보 변경 성공");
			request.getSession().invalidate();
		} else {
			System.out.println("정보 변경 실패");
		}
		model.setViewName("index");
		return model;
	}
	@RequestMapping(value = "mdelete")
	public ModelAndView mdelete(ModelAndView model, HttpServletRequest request, MemberVO vo) {
		vo = (MemberVO) request.getSession().getAttribute("logInUser");
		int cnt = service.mdelete(vo);
		if(cnt>0) {
			System.out.println("회원탈퇴 완료");
			request.getSession().invalidate();
		} else {
			System.out.println("회원 탈퇴 오류");
		}
		
		model.setViewName("index");
		return model;
	}
}

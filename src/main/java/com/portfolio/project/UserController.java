package com.portfolio.project;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import business.CService;
import business.GService;
import business.MService;
import vo.CartVO;
import vo.GoodsVO;
import vo.MemberVO;

@Controller
public class UserController {
	@Autowired
	MService service;
	@Autowired
	CService cartService;
	@Autowired
	GService gservice;
	@Autowired
	BCryptPasswordEncoder passwordEncorder;
	
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
		MemberVO vo =(MemberVO) request.getSession().getAttribute("logInUser");
		ArrayList<CartVO> list = cartService.cartList(vo);
		
		model.addObject("list",list);
		
		model.setViewName("myInfo/myInfoCart");
		return model;
	}
	@RequestMapping(value ="/mFAQ")//FAQ
	public ModelAndView myInfoFAQ(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myInfoFAQ");
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
	@RequestMapping(value ="/changePwf")//비밀번호변경
	public ModelAndView changePwf(ModelAndView model,HttpServletRequest request) {
		model.setViewName("logIn/changePw");
		return model;
	}

	@RequestMapping(value ="/changePw")//비밀번호변경
	public ModelAndView changePw(ModelAndView model,HttpServletRequest request) {
		MemberVO vo = new MemberVO();
		vo.setmId(request.getParameter("id"));
		vo.setmPw(passwordEncorder.encode( request.getParameter("password")));
		if(service.ChangePassword(vo)>0) {
			model.addObject("code","100");
			request.getSession().invalidate();
		}else {
			model.addObject("code","101");
		}
		model.setViewName("jsonView");
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
		vo.setmPw(passwordEncorder.encode(vo.getmPw()));
		if(vo.getmGrade().equals("S")) {
			File sellerPersonalFolder = new File("C:\\Catpple\\src\\main\\webapp\\resources\\sellerInfo\\"+vo.getmId());
			if (!sellerPersonalFolder.exists()) {  // ff의 존재여부 확인
				sellerPersonalFolder.mkdir();		// 없으면 생성	
				System.out.println("판매자로 회원가입이 완료되어 디렉토리 생성");
			}
		}
		if(service.join(vo)>0) {//회원가입성공
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
		String password = vo.getmPw();
		vo = service.login(vo);
		if(vo == null) {//없는 아이디일때
			model.addObject("logIn","failed");
		}else if(passwordEncorder.matches(password,vo.getmPw())) {
			HttpSession session = request.getSession();
			session.setAttribute("logInUser",vo);
			session.setAttribute("cartRow",cartService.getCartRow(vo));
			session.setMaxInactiveInterval(60 * 60 * 2); //두시간
			model.addObject("logIn","success");
		}else if(!passwordEncorder.matches(password,vo.getmPw())) {//비밀번호 틀렸을때
			model.addObject("logIn","failed");
		}
		model.setViewName("jsonView");
		return model;
	}
	@RequestMapping(value="/logOut")
	public ModelAndView logOut(ModelAndView model,HttpServletRequest request) {
		request.getSession().invalidate();
		model.setViewName("redirect:home");
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
	@RequestMapping(value="/infoToCart")//상품 상세정보 -> 장바구니
	public ModelAndView infoToCart(ModelAndView model,HttpServletRequest request,CartVO vo) {
		System.out.println(vo);
		if(cartService.findDupGoods(vo) == null) {//장바구니에 들어있는지 확인
			System.out.println("같은 상품 존재 하지않음 ");
			if(cartService.infoToCart(vo) > 0) {  //없으면 장바구니로 넣기
				System.out.println("장바구니 추가성공 ");
				System.out.println(vo);
				model.addObject("code","100");
			}else {
				System.out.println("장바구니에 추가실패");
			}
		}else {
			System.out.println("이미 같은 물품이 장바구니에 존재");
			model.addObject("code","101");
		}
		model.setViewName("jsonView");
		return model;
		
	}
	@RequestMapping(value="/deleteCart")
	public ModelAndView deleteCart(ModelAndView model,CartVO vo) {
		if(cartService.deleteCart(vo)>0) {
			model.addObject("code","300");
		}else {
			model.addObject("code","301");
		}
		model.setViewName("jsonView");
		return model;
	}
}

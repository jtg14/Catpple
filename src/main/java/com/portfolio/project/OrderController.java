package com.portfolio.project;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import business.CService;
import business.MService;
import business.OService;
import business.PService;
import vo.CartVO;
import vo.GoodsVO;
import vo.MemberVO;
import vo.OrderVO;
import vo.PaymentVO;

@Controller
public class OrderController {//주문성공 페이지
	
	@Autowired
	CService cartService;
	@Autowired
	OService service;
	@Autowired
	MService mservice;
	@Autowired
	PService pservice;
	
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping(value ="/osuccess")
	public ModelAndView orderSuccess(ModelAndView model) {
		model.setViewName("order/orderSuccess");
		return model;
	}
	
	@RequestMapping(value ="/oinfo")//주문정보
	public ModelAndView orderInfo(ModelAndView model,HttpServletRequest request) {
		model.setViewName("order/orderInfo");
		return model;
	}

	@RequestMapping(value ="/sGForm")//상품등록
	public ModelAndView sellerGoodsForm(ModelAndView model) {
		model.setViewName("order/sellerGoodsForm");
		return model;
	}
	
	@RequestMapping(value ="/sOList")//주문 요청 목록
	public ModelAndView sellerOrderList(ModelAndView model, HttpServletRequest request, MemberVO mvo) {
		
		mvo = (MemberVO)request.getSession().getAttribute("logInUser");
		GoodsVO gvo = new GoodsVO();
		gvo.setMember_mId(mvo.getmId());
		ArrayList<CartVO> list = cartService.selectReceivedOrderList(gvo);
		
		for(int i=0; i<list.size(); i++) {
			String subDate = list.get(i).getdDate().substring(0,19);
			list.get(i).setdDate(subDate);
		}
		
		
		model.addObject("list",list);
		model.setViewName("order/sellerOrderList");
		return model;
	}
	@RequestMapping(value ="/ginfo")//상품정보
	public ModelAndView goodsInfo(ModelAndView model) {
		model.setViewName("goods/goodsInfo");
		return model;
	}
	@RequestMapping(value ="/gsearch")//상품검색
	public ModelAndView goodsSearch(ModelAndView model) {
		model.setViewName("goods/goodsSearch");
		return model;
	}
	@RequestMapping(value = "/cInsert")//장바구니에 넣기 
	public ModelAndView mCartInsert(ModelAndView model) {
		
		model.setViewName("jsonView");
		return model;
	}
	@RequestMapping(value="/order")
	public ModelAndView order(ModelAndView model,OrderVO vo,HttpServletRequest request) {
		int expectedPoint = 0;
		log.info("-------------------주문 접수시작-------------------");
		ArrayList<CartVO> list = (ArrayList)request.getSession().getAttribute("list");//받아올 장바구니리스트
		log.info("주문할 장바구니 받아오기 성공 !");
		ArrayList<OrderVO> olist = new ArrayList<OrderVO>();
		log.info("장바구니 에서 주문목록으로 옮길 List생성");
		MemberVO logInUser = (MemberVO)request.getSession().getAttribute("logInUser");
		log.info("세션 유저 불러오기성공");
		if(mservice.login(logInUser).getmAddr1() == 0) {
			log.info("현재 유저 첫주문 여부 확인!");
			vo.setMember_mId(logInUser.getmId());
			mservice.updateAddr(vo); //기본주소지 추가
			log.info("기본주소지 등록 완료!");
		}
		for(CartVO cvo : list) {
			OrderVO ov  = new OrderVO();
			ov.setoPrice(cvo.getgPrice());
			ov.setoStock(cvo.getcAmount());
			ov.setMember_mId(logInUser.getmId());
			ov.setGoods_gNum(cvo.getGoods_gNum());
			ov.setdInfo(request.getParameter("dInfo"));
			ov.setoAddr1(vo.getoAddr1());
			ov.setoAddr2(vo.getoAddr2());
			ov.setoAddr3(vo.getoAddr3());
			ov.setoAddr4(vo.getoAddr4());
			ov.setoName(vo.getoName());
			ov.setoPhone(vo.getoPhone());
			olist.add(ov);
			System.out.println(ov);
			cartService.deleteCart(cvo);
		}
		log.info("장바구니에서 불러온 목록 처리할 list로 옮기기 성공 !");
		log.info("장바구니 모든항목 삭제 완료 !");
		PaymentVO pvo = new PaymentVO();
		int allPrice = 0;
		log.info("결체 정보 총가격 초기화");
		for(OrderVO ovo : olist) {
			allPrice += (ovo.getoPrice() * ovo.getoStock());
		}
		log.info("총가격 계산 성공  : "+allPrice);
		pvo.setpPrice(allPrice);
		int pnum = service.insertPayment(pvo);
		for(int i = 0;i < olist.size();i++) {
			olist.get(i).setPayment_pNum(pnum);
		}
		pvo.setpNum(pnum);
		log.info("들어간 걸럼 : "+service.findPayment(pvo).toString());
		log.info("모든 list에  pNum 부여성공");
		service.insertOandD(olist);
		log.info("모든 주문 각테이블로 전송 성공!");
		pvo.setpNum(pnum);
		pvo = service.findPayment(pvo);
		model.addObject("paymentInfo",pvo);
		log.info("결재정보 불러오기 성공");
		olist = service.getOrderList(pvo);
		log.info("주문리스트 정보 불러오기 성공!");
		model.addObject("olist",olist);
		model.addObject("dupInfo",olist.get(0));
		log.info("주문테이블  Session에 추가성공");
		expectedPoint = pvo.getpPrice() / 10;
		logInUser.setmPoint(expectedPoint);
		mservice.addPoint(logInUser);
		log.info("포인트적립 성공 !");
		request.getSession().setAttribute("cartRow",cartService.getCartRow(logInUser));
		log.info("장바구니 갱신성공!");
		log.info("-------------------주문 모든과정 성공-------------------");
		model.setViewName("order/orderSuccess");
		return model;
	}
	@RequestMapping(value ="/pMYAddr")
	public ModelAndView passMeYourAddr(ModelAndView model,HttpServletRequest request,HttpServletResponse response) {
		model.addObject("user",request.getSession().getAttribute("logInUser"));
		response.setCharacterEncoding("UTF-8");
		model.setViewName("jsonView");
		return model;
	}
	
	@RequestMapping(value = "/cancelOrder")
	public ModelAndView cancelOrder(HttpServletRequest request,ModelAndView mv) {
		
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(value = "/changeDstate")
	public ModelAndView changeDstate(@RequestParam(value="dpkList") List<Integer> dpkList, ModelAndView model, HttpServletRequest request) {
		
		System.out.println("list=>"+dpkList);
		

		if(cartService.changeDstate(dpkList)>0) {
			System.out.println("changeDstate처리후");
			model.addObject("code", "100");
		}else {
			model.addObject("code", "101");
		}
		
		model.setViewName("jsonView");
		return model;
	}
	
	
	@RequestMapping(value ="/mODelivery")//주문/배송 조회
	public ModelAndView myInfoOrderDelivery(ModelAndView model,HttpServletRequest request) {
		MemberVO mvo =(MemberVO)request.getSession().getAttribute("logInUser");
		ArrayList<PaymentVO> plist = pservice.paymentList(mvo);
		model.addObject("plist", plist);
		
		model.setViewName("myInfo/myInfoOrderDelivery");
		return model;
	}
	
	
	
	@RequestMapping(value = "/oListInPnum")
	public ModelAndView oListInPnum(ModelAndView model, HttpServletRequest request, PaymentVO pvo) {
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("logInUser");
		pvo.setMember_mId(mvo.getmId());
		
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		pvo.setpNum(pNum);
		
		ArrayList<OrderVO> oplist = service.oListInPnum(pvo);
		
		model.setViewName("myInfo/myInfoOrderDelivery");
		return model;
	}
	
	
}//class

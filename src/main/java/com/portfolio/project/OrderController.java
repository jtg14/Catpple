package com.portfolio.project;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import business.CService;
import business.MService;
import business.OService;
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
		ArrayList<OrderVO> vertualList = new ArrayList<OrderVO>();
		log.info("처리후 반환될 주문목록 받아올 가상List생성");
		MemberVO logInUser = (MemberVO)request.getSession().getAttribute("logInUser");
		log.info("세션 유저 불러오기성공");
		if(mservice.login(logInUser).getmAddr1() == 0) {
			log.info("현재 유저 첫주문 여부 확인!");
			mservice.updateAddr(vo); //기본주소지 추가
			log.info("기본주소지 등록 완료!");
		}
		for(CartVO cvo : list) {
			vo.setoPrice(cvo.getgPrice());
			vo.setoStock(cvo.getcAmount());
			vo.setMember_mId(logInUser.getmId());
			vo.setGoods_gNum(cvo.getGoods_gNum());
			vo.setdInfo(request.getParameter("dInfo"));
			olist.add(vo);
			cartService.deleteCart(cvo);
		}
		log.info("장바구니에서 불러온 목록 처리할 list로 옮기기 성공 !");
		log.info("장바구니 모든항목 삭제 완료 !");
		PaymentVO pvo = new PaymentVO();
		pvo.setpPrice(0);
		log.info("결체 정보 총가격 초기화");
		for(OrderVO ovo : olist) {
			pvo.setpPrice(pvo.getpPrice()+ovo.getoPrice());
		}
		
		int pnum = service.insertPayment(pvo);
		for(OrderVO ovo : olist) {
			ovo.setPayment_pNum(pnum);
		}
		log.info("불러온 List 처리후 반환된객체 가상List 에 추가 성공");
		request.getSession().setAttribute("vtList",vertualList);
		request.getSession().setAttribute("listSize",vertualList.size());
		request.getSession().setAttribute("orderInfo",vertualList.get(0));
		log.info("가상 List Session에 추가성공");
		log.info("가상리스트 출력");
		logInUser.setmPoint(expectedPoint);
		mservice.addPoint(logInUser);
		request.getSession().setAttribute("Point", expectedPoint);
		log.info("포인트적립 성공 !");
		log.info("-------------------주문 모든과정 성공-------------------");
		model.setViewName("redirect:osuccess");
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
}

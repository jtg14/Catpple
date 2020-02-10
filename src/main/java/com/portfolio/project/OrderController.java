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
import vo.CartVO;
import vo.GoodsVO;
import vo.MemberVO;
import vo.OrderVO;

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
			String subDate = list.get(i).getDdate().substring(0,19);
			list.get(i).setDdate(subDate);
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
		log.info("-------------------주문 접수시작-------------------");
		ArrayList<CartVO> list = (ArrayList)request.getSession().getAttribute("list");//받아올 장바구니리스트
		ArrayList<OrderVO> olist = new ArrayList<OrderVO>();
		ArrayList<OrderVO> vertualList = new ArrayList<OrderVO>();
		MemberVO logInUser = (MemberVO)request.getSession().getAttribute("logInUser");
		if(mservice.login(logInUser).getmAddr1() == 0) {
			mservice.updateAddr(vo); //기본주소지 추가
		}
		for(CartVO cvo : list) {
			vo.setoPrice(cvo.getGprice());
			vo.setoStock(cvo.getcAmount());
			vo.setMember_mId(logInUser.getmId());
			vo.setGoods_gNum(cvo.getGoods_gNum());
			vo.setdInfo(request.getParameter("dInfo"));
			olist.add(vo);
			cartService.deleteCart(cvo);
		}
		for(OrderVO ovo : olist) {
			vertualList.add(service.insertOrder(ovo));
			log.info(ovo.toString());
		}
		request.getSession().setAttribute("vtList",vertualList);
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
}

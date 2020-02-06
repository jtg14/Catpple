package com.portfolio.project;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import business.GService;
import vo.GoodsVO;
import vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	GService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv,HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		HttpSession session = request.getSession();
		String user; //컨트롤러로 들어온 유저
		MemberVO vo = (MemberVO) session.getAttribute("logInUser");
		if(vo == null) {
			user = "손님";
		}else {
			user = vo.getmId();
		}
		logger.info("접속 IP : [ "+ip+" ] 접속 ID : [ "+user+" ] index 로 접속");
		
		ArrayList<GoodsVO> list = service.homeGoodsList();
		ArrayList<GoodsVO> list2 = service.homeRecomList();
		mv.addObject("goodsHomeList", list);
		mv.addObject("RecomList", list2);
		mv.setViewName("index");
		return mv;
	}
	
	
}

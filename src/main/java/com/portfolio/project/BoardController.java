package com.portfolio.project;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import business.BService;
import vo.BoardVO;
import vo.MemberVO;

@Controller
public class BoardController {
	@Autowired
	BService service;
	
	@RequestMapping(value ="/mWriting")//글쓰기(모든글)
	public ModelAndView myInfoWriting(ModelAndView model,HttpServletRequest request) {
		model.setViewName("myInfo/myInfoWriting");
		return model;
	}
	
	@RequestMapping(value ="/mBDetail")//글상세
	public ModelAndView myInfoBoardDetail(ModelAndView model,BoardVO vo,HttpServletRequest request) {
		
		vo = service.selectOne(vo);
		model.addObject("one",vo);
		model.setViewName("myInfo/myInfoBoardDetail");
		return model;
	}
	
	@RequestMapping(value = "/mCustomerInquiry")//1대1문의
	public ModelAndView mCustomerInquiry(ModelAndView model, HttpServletRequest request, BoardVO vo1, MemberVO vo2) {
		HttpSession session = request.getSession();
		vo2 = (MemberVO)session.getAttribute("logInUser");
		if("C".equals(vo2.getmGrade())) {//member가 customer인 경우
			vo1.setMember_mId(vo2.getmId());
			ArrayList<BoardVO> list = service.inquirySelectList(vo1);
			System.out.println(list);
			model.addObject("list", list);
			model.setViewName("myInfo/myInfoCustomerInquiry");
			return model;
		}else if("a".equals(vo2.getmGrade())) {//member가 관리자인 경우
			ArrayList<BoardVO> listForManager = service.inquirySelectListForManager();
			model.addObject("listForManager", listForManager);
			model.setViewName("myInfo/myInfoCustomerInquiry");
			return model;
		}else {//예외처리
			
		}
		
		vo1.setMember_mId(vo2.getmId());
		ArrayList<BoardVO> list = service.inquirySelectList(vo1);
		model.addObject("list", list);
		model.setViewName("myInfo/myInfoCustomerInquiry");
		return model;
	}
	
	
	
	@RequestMapping(value = "/binsert")
	public ModelAndView binsert(ModelAndView model, BoardVO vo1, MemberVO vo2, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo2 = (MemberVO)session.getAttribute("logInUser");
		vo1.setmName(vo2.getmName());
		vo1.setMember_mId(vo2.getmId());
		
		if(service.inquiryInsert(vo1)>0) {
	
			model.setViewName("redirect:mCustomerInquiry");
			return model;
		}else {

			model.setViewName("redirect:mCustomerInquiry");
			return model;
		}	
		
	}//binsert
	
	
}

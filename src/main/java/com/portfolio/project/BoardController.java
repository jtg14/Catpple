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
	
	
	
	@RequestMapping(value = "/blist")
	public ModelAndView blist(ModelAndView model, HttpServletRequest request, BoardVO vo1, MemberVO vo2) {
		HttpSession session = request.getSession();
		vo2 = (MemberVO)session.getAttribute("logInUser");
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
			ArrayList<BoardVO> list = service.inquirySelectList(vo1);
			model.addObject("list",list);
			System.out.println(list);
			model.setViewName("blist");
		}else {
			ArrayList<BoardVO> list = service.inquirySelectList(vo1);
			model.addObject("list",list);
			model.setViewName("blist");
		}	
		return model;
	}//binsert
	
	
}

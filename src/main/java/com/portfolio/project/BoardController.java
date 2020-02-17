package com.portfolio.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import business.BService;
import criteria.PageMaker;
import criteria.SearchCriteria;
import vo.BoardVO;
import vo.MemberVO;
import vo.PageVO;

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
		String pageCode = request.getParameter("pageCode");
		vo = service.selectOne(vo);
		model.addObject("one",vo);
		
		if("I".equals(pageCode)) {
			model.addObject("pageCode", pageCode);
			model.setViewName("myInfo/myInfoBoardDetail");	
		}else if("S".equals(pageCode)) {
			model.addObject("pageCode", pageCode);
			model.setViewName("myInfo/myInfoBoardDetail");
		
		}
		return model;
	}//mBDetail
	
	@RequestMapping(value = "/mCustomerInquiry")//1대1문의
	public ModelAndView mCustomerInquiry(SearchCriteria cri, ModelAndView model, HttpServletRequest request, BoardVO bvo, MemberVO mvo, PageVO pvo) {
		HttpSession session = request.getSession();
		mvo = (MemberVO)session.getAttribute("logInUser");
		cri.setMember_mId(mvo.getmId());
		
		if("C".equals(mvo.getmGrade())) {//member가 customer인 경우
			cri.setSnoEno();
			model.addObject("list", service.searchCriList(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.searchCriCount(cri));
			model.addObject("pageMaker", pageMaker);
			
			model.setViewName("myInfo/myInfoCustomerInquiry");

			return model;
		}else if("A".equals(mvo.getmGrade())) {//member가 관리자인 경우
			System.out.println("관리자쪽 들어옴");
			cri.setSnoEno();
			model.addObject("listForManager", service.searchCriListForManager(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.searchCriCountForManager(cri));
			model.addObject("pageMaker", pageMaker);
			
			model.setViewName("myInfo/myInfoCustomerInquiry");
			return model;
		}else {//예외처리
			
		}
		
		return model;
	}
	
	
	@RequestMapping(value = "/mSuggestions")//건의사항
	public ModelAndView mSuggestions(SearchCriteria cri, ModelAndView model, HttpServletRequest request, BoardVO bvo, MemberVO mvo, PageVO pvo) {
		HttpSession session = request.getSession();
		mvo = (MemberVO)session.getAttribute("logInUser");
		cri.setMember_mId(mvo.getmId());
		
		if("C".equals(mvo.getmGrade())) {//member가 customer인 경우
			cri.setSnoEno();
			model.addObject("list", service.suggestionSearchCriList(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.suggestionSearchCriCount(cri));
			model.addObject("pageMaker", pageMaker);
			
			model.setViewName("myInfo/myInfoSuggestions");
		}else if("A".equals(mvo.getmGrade())) {//member가 관리자인 경우
			cri.setSnoEno();
			model.addObject("listForManager", service.suggestionSearchCriListForManager(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.suggestionSearchCriCountForManager(cri));
			System.out.println("StargPage=>"+pageMaker.getStartPage());
			System.out.println("EndPage=>"+pageMaker.getEndPage());
			model.addObject("pageMaker", pageMaker);
			
			model.setViewName("myInfo/myInfoSuggestions");
		}
			return model;
	}//mSuggestions
	
	
	
	
	@RequestMapping(value = "/inquiryInsert")
	public ModelAndView inquiryInsert(ModelAndView model, BoardVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("logInUser");
		vo.setMember_mId(mvo.getmId());
		
		if(service.inquiryInsert(vo)>0) {
			model.addObject("code","100");
		}else {
			model.addObject("code","101");
		}	
		model.setViewName("jsonView");
		return model;
		
	}//inquiryInsert
	
	
	@RequestMapping(value = "/suggestionInsert")
	public ModelAndView suggestionInsert(ModelAndView model, BoardVO vo, HttpServletRequest request) {
		System.out.println("서제스션 인설트 들어옴");
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("logInUser");
		vo.setMember_mId(mvo.getmId());
		System.out.println(vo);
		if(service.suggestionInsert(vo)>0) {
			model.addObject("code","100");
		}else {
			model.addObject("code","101");
		}	
		model.setViewName("jsonView");
		return model;
		
	}//suggestionInsert
	
	
	@RequestMapping(value = "/bReplyUpdate")
	public ModelAndView bReplyUpdate(ModelAndView model, BoardVO vo) {
	
		if(service.bReplyUpdate(vo)>0) {
			model.addObject("code", "100");
		}else {
			model.addObject("code", "101");
		}

		model.setViewName("jsonView");
		return model;
	}//bReplyUpdate
	
	@RequestMapping(value = "/boardDelete")
	public ModelAndView boardDelete(ModelAndView model, BoardVO vo, HttpServletRequest request) {
		String pageCode = request.getParameter("pageCode");
		service.boardDelete(vo);
		if("I".equals(pageCode)) {
			model.addObject("page", "I");
			model.setViewName("jsonView");
			
		}else if("S".equals(pageCode)) {
			model.addObject("page", "S");
			model.setViewName("jsonView");
		
		}
		
		return model;
	}//inquiryDelete
	
	@RequestMapping(value = "/boardUpdate")
	public ModelAndView boardUpdate(ModelAndView model, BoardVO vo, HttpServletRequest request) {
		
		if(service.boardUpdate(vo)>0) {
			model.addObject("code","100");
		}else {
			model.addObject("code","101");
		}
		model.setViewName("jsonView");
			
		return model;
	}
	
	
}//classs


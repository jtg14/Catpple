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
	public ModelAndView mCustomerInquiry(ModelAndView model, HttpServletRequest request, BoardVO bvo, MemberVO mvo, PageVO pvo) {
		HttpSession session = request.getSession();
		mvo = (MemberVO)session.getAttribute("logInUser");
		
		if("C".equals(mvo.getmGrade())) {//member가 customer인 경우
			//paging
			//currPage설정
			int currPage=1;
			if(pvo.getCurrPage()>1){ 
				currPage=pvo.getCurrPage();	
			}else{ 
				pvo.setCurrPage(currPage);
			}
			
			//페이지 첫row와 마지막row설정
			int startRno=((currPage-1)*pvo.getPerPage());
				
			pvo.setSno(startRno);
			
			
			pvo.setMember_mId(mvo.getmId());//mid를 pageVO member_mid에 저장
			pvo = service.inquirySelectPageList(pvo);
			
			
			int totalPageNo = pvo.getTotalCount()/pvo.getPerPage();
			if (pvo.getTotalCount()%pvo.getPerPage()>0) {
				totalPageNo +=1;
				}
			int sPage=((currPage-1)/pvo.getPerPageNo())*pvo.getPerPageNo() + 1 ;
			int ePage=sPage+pvo.getPerPageNo()-1; 
			
			if (ePage>totalPageNo) {
				ePage=totalPageNo;
			}
			
			model.addObject("sPage",sPage);
			model.addObject("ePage",ePage);
			model.addObject("perPageNo",pvo.getPerPageNo());
			// Paging1
			model.addObject("totalPageNo",totalPageNo);
			model.addObject("currPage",currPage);
			model.addObject("list", pvo.getList());
			model.setViewName("myInfo/myInfoCustomerInquiry");

			return model;
		}else if("A".equals(mvo.getmGrade())) {//member가 관리자인 경우
			//paging
			//currPage설정
			int currPage=1;
			if(pvo.getCurrPage()>1){ 
				currPage=pvo.getCurrPage();	
			}else{ 
				pvo.setCurrPage(currPage);
			}
			
			//페이지 첫row와 마지막row설정
			int startRno=((currPage-1)*pvo.getPerPage());	
			pvo.setSno(startRno);
			
			
			pvo = service.inquirySelectPageListForManager(pvo);
			
			int totalPageNo = pvo.getTotalCount()/pvo.getPerPage();
			if (pvo.getTotalCount()%pvo.getPerPage()>0)
				totalPageNo +=1;
			
			int sPage=((currPage-1)/pvo.getPerPageNo())*pvo.getPerPageNo() + 1 ;
			int ePage=sPage+pvo.getPerPageNo()-1; 
			
			if (ePage>totalPageNo) ePage=totalPageNo;
			
			
			model.addObject("sPage",sPage);
			model.addObject("ePage",ePage);
			model.addObject("perPageNo",pvo.getPerPageNo());
			// Paging1
			model.addObject("totalPageNo",totalPageNo);
			model.addObject("currPage",currPage);
			model.addObject("listForManager", pvo.getList());
			model.setViewName("myInfo/myInfoCustomerInquiry");
			return model;
		}else {//예외처리
			
		}
		
		return model;
	}
	
	
	@RequestMapping(value = "/mSuggestions")//건의사항
	public ModelAndView mSuggestions(ModelAndView model, HttpServletRequest request, BoardVO bvo, MemberVO mvo, PageVO pvo) {
		HttpSession session = request.getSession();
		mvo = (MemberVO)session.getAttribute("logInUser");
		
		if("C".equals(mvo.getmGrade())) {//member가 customer인 경우
			//paging
			//currPage설정
			int currPage=1;
			if(pvo.getCurrPage()>1){ 
				currPage=pvo.getCurrPage();	
			}else{ 
				pvo.setCurrPage(currPage);
			}
			
			//페이지 첫row와 마지막row설정
			int startRno=((currPage-1)*pvo.getPerPage());	
			pvo.setSno(startRno);
		
			
			pvo.setMember_mId(mvo.getmId());//mid를 pageVO member_mid에 저장
			pvo = service.suggestionSelectPageList(pvo);
			
			int totalPageNo = pvo.getTotalCount()/pvo.getPerPage();

			if (pvo.getTotalCount()%pvo.getPerPage()>0) {
				totalPageNo +=1;
				}
			int sPage=((currPage-1)/pvo.getPerPageNo())*pvo.getPerPageNo() + 1 ;
			int ePage=sPage+pvo.getPerPageNo()-1; 
			
			if (ePage>totalPageNo) {
				ePage=totalPageNo;
			}
			
			model.addObject("sPage",sPage);
			model.addObject("ePage",ePage);
			model.addObject("perPageNo",pvo.getPerPageNo());
			// Paging1
			model.addObject("totalPageNo",totalPageNo);
			model.addObject("currPage",currPage);
			model.addObject("list", pvo.getList());
			model.setViewName("myInfo/myInfoSuggestions");

			return model;
		}else if("A".equals(mvo.getmGrade())) {//member가 관리자인 경우
			//paging
			//currPage설정
			int currPage=1;
			if(pvo.getCurrPage()>1){ 
				currPage=pvo.getCurrPage();	
			}else{ 
				pvo.setCurrPage(currPage);
			}
			
			//페이지 첫row 설정
			int startRno=((currPage-1)*pvo.getPerPage());	
			pvo.setSno(startRno);
		
			
			pvo = service.suggestionSelectPageListForManager(pvo);
			
			int totalPageNo = pvo.getTotalCount()/pvo.getPerPage();
			if (pvo.getTotalCount()%pvo.getPerPage()>0)
				totalPageNo +=1;
			
			int sPage=((currPage-1)/pvo.getPerPageNo())*pvo.getPerPageNo() + 1 ;
			int ePage=sPage+pvo.getPerPageNo()-1; 
			
			if (ePage>totalPageNo) ePage=totalPageNo;
		
			
			model.addObject("sPage",sPage);
			model.addObject("ePage",ePage);
			model.addObject("perPageNo",pvo.getPerPageNo());
			// Paging1
			model.addObject("totalPageNo",totalPageNo);
			model.addObject("currPage",currPage);
			model.addObject("listForManager", pvo.getList());
			model.setViewName("myInfo/myInfoSuggestions");
			
			return model;
		}else {//예외처리
			
		}
		
		return model;
	}//mSuggestions
	
	
	
	
	@RequestMapping(value = "/inquiryInsert")
	public ModelAndView inquiryInsert(ModelAndView model, BoardVO vo1, MemberVO vo2, HttpServletRequest request) {
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
		
	}//inquiryInsert
	
	
	@RequestMapping(value = "/suggestionInsert")
	public ModelAndView suggestionInsert(ModelAndView model, BoardVO vo1, MemberVO vo2, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo2 = (MemberVO)session.getAttribute("logInUser");
		vo1.setmName(vo2.getmName());
		vo1.setMember_mId(vo2.getmId());
		
		if(service.suggestionInsert(vo1)>0) {
			model.setViewName("redirect:mSuggestions");
			return model;
		}else {
			model.setViewName("redirect:mSuggestions");
			return model;
		}	
		
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
		System.out.println(service.boardUpdate(vo));
		if(service.boardUpdate(vo)>0) {
			model.addObject("code","100");
		}else {
			model.addObject("code","101");
		}
		model.setViewName("jsonView");
			
		return model;
	}
	
	
}//classs


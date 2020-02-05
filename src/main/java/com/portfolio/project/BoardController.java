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
		vo = service.selectOne(vo);
		model.addObject("one",vo);
		model.setViewName("myInfo/myInfoBoardDetail");
		return model;
	}
	
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
			int endRno=(startRno+pvo.getPerPage());		
			pvo.setSno(startRno);
			pvo.setEno(endRno);
			
			pvo.setMember_mId(mvo.getmId());//mid를 pageVO member_mid에 저장
			System.out.println("member_mId=>"+pvo.getMember_mId());
			System.out.println("sno=>"+pvo.getSno());
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
//			bvo.setMember_mId(mvo.getmId());
//			ArrayList<BoardVO> list = service.inquirySelectList(bvo);
//			model.addObject("list", list);
//			model.setViewName("myInfo/myInfoCustomerInquiry");
			return model;
		}else if("a".equals(mvo.getmGrade())) {//member가 관리자인 경우
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
			int endRno=(startRno+pvo.getPerPage());		
			pvo.setSno(startRno);
			pvo.setEno(endRno);
			
			pvo = service.inquirySelectPageListForManager(pvo);
			
			int totalPageNo = pvo.getTotalCount()/pvo.getPerPage();
			if (pvo.getTotalCount()%pvo.getPerPage()>0)
				totalPageNo +=1;
			
			int sPage=((currPage-1)/pvo.getPerPageNo())*pvo.getPerPageNo() + 1 ;
			int ePage=sPage+pvo.getPerPageNo()-1; 
			
			if (ePage>totalPageNo) ePage=totalPageNo;
			
//			System.out.println("sPage=>"+sPage);
//			System.out.println("ePage=>"+ePage);
//			System.out.println("PerPageNo=>"+pvo.getPerPageNo());
//			System.out.println("totalPageNo =>"+totalPageNo);
//			System.out.println("currPage=>"+pvo.getCurrPage());
			
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
		
		bvo.setMember_mId(mvo.getmId());
		ArrayList<BoardVO> list = service.inquirySelectList(bvo);
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
	
	
	@RequestMapping(value = "/bReplyUpdate")
	public ModelAndView bReplyUpdate(ModelAndView model, BoardVO vo) {
		System.out.println("들어옴");
		System.out.println(vo);
		if(service.bReplyUpdate(vo)>0) {
			model.addObject("code", "100");
		}else {
			model.addObject("code", "101");
		}

		model.setViewName("jsonView");
		
		return model;
	}//bReplyUpdate
	
	
	
	@RequestMapping(value = "/plist")
	public ModelAndView plist(ModelAndView mv, PageVO pvo) {
		// Paging 준비
		// => currPage : pvo.getCurrPage() 아니면  1 
		int currPage=1;
		if(pvo.getCurrPage()>1){ 
			currPage=pvo.getCurrPage();	
		}else{ 
			pvo.setCurrPage(currPage);
		}
		// => perPage = 5
		// => startRno , endRno 계산
		int startRno=((currPage-1)*pvo.getPerPage())+1;
		int endRno=(startRno+pvo.getPerPage())-1;		
		pvo.setSno(startRno);
		pvo.setEno(endRno);
		// DAO 처리
		// => totalCount
		//		: dao 처리 (pageList 처리시에 같이 )
		// => 출력할 row select ( sno ~ eno )
		pvo = service.inquirySelectPageList(pvo);

		// => totalPageNo 계산
		int totalPageNo = pvo.getTotalCount()/pvo.getPerPage();
		if (pvo.getTotalCount()%pvo.getPerPage()>0)
			totalPageNo +=1;
		
		// Paging2 : Page Block 처리
		// => currPage, perPageNo 를 이용해서 sPage, ePage 계산
		// => ex) currPage=3,  perPageNo= 3 
		//         
		//    보기 1) sPage :  currPage  -  perPageNo/2  
		//          epage :  currPage  +  perPageNo/2   
		//			-> 항상 현재 Page가 중앙에 위치할때
		//    보기 2) Naver 카페 글 Type
		//        sPage : (((currPage-1)/perPageNo)*perPageNo) +1  
		
		// 예를들어 currPage=3 이고 perPageNo 가 3 이면 1,2,3 page까지 출력 되어야 하므로
		// 아래 처럼 currPage-1 을 perPageNo 으로 나눈다.
		// currPage=11 -> 10,11,12, => (11-1)/3 * 3 +1 = 10
		int sPage=((currPage-1)/pvo.getPerPageNo())*pvo.getPerPageNo() + 1 ;
		int ePage=sPage+pvo.getPerPageNo()-1; 
		
		// 계산된 ePage 가 totalPageNo 보다 큰 경우에는 
		// totalPageNo 를  ePage 로 함.
		// => 예를 들면 totalPageNo=8 인데, ePage=9 인 경우 등등...
		if (ePage>totalPageNo) ePage=totalPageNo;
		
		// 결과 출력
		// Paging2 추가
		mv.addObject("sPage",sPage);
		mv.addObject("ePage",ePage);
		mv.addObject("perPageNo",pvo.getPerPageNo());
		// Paging1
		mv.addObject("totalPageNo",totalPageNo);
		mv.addObject("currPage",currPage);
		mv.addObject("Banana", pvo.getList());
		mv.setViewName("board/pageList");
		return mv;
	}// plist
	
	
	
}

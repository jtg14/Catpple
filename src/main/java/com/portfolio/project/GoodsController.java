package com.portfolio.project;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import business.GService;
import business.MService;
import vo.GoodsVO;
import vo.MemberVO;

@Controller
public class GoodsController {
	private static final Logger log = LoggerFactory.getLogger(GoodsController.class);
	@Autowired
	GService service;
	@Autowired
	MService mservice;
	
	long time = System.currentTimeMillis(); 

	SimpleDateFormat dayTime = new SimpleDateFormat("yyy-MM-dd hh:mm:ss");

	String systemTime = dayTime.format(new Date(time));

	@RequestMapping(value = "goodsInsert", method = RequestMethod.POST)
	public ModelAndView goodsInsert(HttpServletRequest request, ModelAndView mv, GoodsVO vo) {
		MemberVO mvo = new MemberVO();
		mvo = (MemberVO)request.getSession().getAttribute("logInUser");
		String status="["+request.getRemoteAddr()+"]["+systemTime+"] GoodsInsert Status ("+mvo.getmName()+" 님): ";
		log.info("------------- 상품 등록 시작 -------------");
		vo.setMember_mid(mvo.getmId());

		log.info(status+"현재 상품 등록 유저("+vo.getMember_mid()+") 로 상품에 등록 완료");
		String uploadPath = "C:\\Catpple\\src\\main\\webapp\\resources\\sellerInfo\\"+vo.getMember_mid();
		log.info(status+"파일 설치위치("+uploadPath+") 경로 지정성공");
		MultipartFile multipartFile1 = vo.getGimgf1();
		MultipartFile multipartFile2 = vo.getGimgf2();
		log.info(status+"상품 메인  이미지 이름 ("+multipartFile1.getOriginalFilename()+")");
		log.info(status+"상품 상세 설명 이미지 이름 ("+multipartFile2.getOriginalFilename()+")");
		vo.setGimg1(multipartFile1.getOriginalFilename());
		vo.setGimg2(multipartFile2.getOriginalFilename());
		int cnt = service.goodsInsert(vo);
		if(cnt>0) {
			log.info(status+"DataBase 이미지 파일명 저장 성공");
			if(!multipartFile1.isEmpty() && !multipartFile2.isEmpty()) {
				try {
					multipartFile1.transferTo(new File(uploadPath, multipartFile1.getOriginalFilename()));
					log.info(status+"상품 메인 이미지 저장 성공");		
					multipartFile2.transferTo(new File(uploadPath, multipartFile2.getOriginalFilename()));
					log.info(status+"상품 상세 이미지 저장 성공");		
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		log.info("------------- 상품 등록 성공 -------------");
		
		mv.setViewName("redirect:sRGoods");
		return mv;
	}
	@RequestMapping(value="/gSResult")
	public ModelAndView goodsSearchResult(ModelAndView model,GoodsVO vo,HttpServletRequest request) {
		String searchWord = request.getParameter("search");
		ArrayList<GoodsVO> list = service.goodsSearch(searchWord);
			model.addObject("searchResult",list);
			model.addObject("searchWord",searchWord);
			model.setViewName("goods/goodsSearch");
		return model;
	}
	@RequestMapping(value="/gDetail")
	public ModelAndView goodsDetail(ModelAndView model,GoodsVO vo,HttpServletRequest request) {
		vo.setGnum(Integer.parseInt(request.getParameter("number")));
		vo =service.goodsDetail(vo);
		model.addObject("goods",vo);
		model.setViewName("goods/goodsInfo");
		return model;
	}
	@RequestMapping(value ="/sRGoods")//내가 등록한 상품
	public ModelAndView sellerRegisterdGoods(ModelAndView mv, HttpServletRequest request, GoodsVO vo) {
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("logInUser");
		vo.setMember_mid(mvo.getmId());;
		ArrayList<GoodsVO> list = service.myGoodsList(vo);
		mv.addObject("list", list);
		mv.setViewName("order/sellerRegisterdGoods");
		return mv;
	}
	@RequestMapping(value ="/sGUForm")//상품등록 수정
	public ModelAndView sellerGoodsUpdateForm(ModelAndView mv, HttpServletRequest request, GoodsVO vo) {
		vo = service.goodsDetail(vo);
		mv.addObject("goodsDetail", vo);
		mv.setViewName("order/sellerGoodsUpdateForm");
		return mv;
	}
	@RequestMapping(value = "gupdate")
	public ModelAndView gupdate(ModelAndView mv, HttpServletRequest request, GoodsVO vo) {
		MemberVO mvo = new MemberVO();
		mvo = (MemberVO)request.getSession().getAttribute("logInUser");
		String status="["+request.getRemoteAddr()+"]["+systemTime+"] GoodsInsert Status ("+mvo.getmName()+" 님): ";
		log.info("------------- 상품 업데이트 시작 -------------");
		vo.setMember_mid(mvo.getmId());
		String uploadPath = "C:\\Catpple\\src\\main\\webapp\\resources\\sellerInfo\\"+vo.getMember_mid();
		log.info(status+"저장 경로 설정 성공");
		File file1 = new File(uploadPath,vo.getGimgf1().getOriginalFilename());
		File file2 = new File(uploadPath,vo.getGimgf2().getOriginalFilename());
		vo.setGimg1(vo.getGimgf1().getOriginalFilename());
		vo.setGimg2(vo.getGimgf2().getOriginalFilename());
		log.info(status+"상품 메인 이미지 [ "+vo.getGimg1()+" ] 등록성공");
		log.info(status+"상품 상세 이미지 [ "+vo.getGimg2()+" ] 등록성공");
		GoodsVO vo2 = service.goodsDetail(vo);
		int cnt = service.goodsUpdate(vo);
		if(cnt>0) {
			log.info(status+"상품 업데이트 성공");
			if(!vo.getGimgf1().isEmpty() && !vo.getGimgf2().isEmpty()) {
				try {
					//기존파일삭제
					new File(uploadPath+"\\"+vo2.getGimg1()).delete();
					log.info(status+"기존 상품 메인 이미지 삭제성공");		
					new File(uploadPath+"\\"+vo2.getGimg2()).delete();
					log.info(status+"기존 상품 상세 이미지 삭제성공");		
					vo.getGimgf1().transferTo(file1);
					log.info(status+"업데이트한 상품 메인 이미지 지정경로 저장 성공");		
					vo.getGimgf2().transferTo(file2);
					log.info(status+"업데이트한 상품 상세 이미지 지정경로 저장 성공");		
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		log.info("------------- 상품 업데이트 모든 과정 성공 -------------");
		mv.setViewName("redirect:sRGoods");
		return mv;
	}

}

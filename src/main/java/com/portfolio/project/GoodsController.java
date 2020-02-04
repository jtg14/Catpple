package com.portfolio.project;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	
	@Autowired
	GService service;
	@Autowired
	MService mservice;
	@RequestMapping(value = "goodsInsert", method = RequestMethod.POST)
	public ModelAndView goodsInsert(HttpServletRequest request, ModelAndView mv, GoodsVO vo) {
		MemberVO mvo = new MemberVO();
		mvo = (MemberVO)request.getSession().getAttribute("logInUser");
		vo.setMember_mid(mvo.getmId());
		String uploadPath = "C:\\Catpple\\src\\main\\webapp\\resources\\sellerInfo\\"+vo.getMember_mid();
		MultipartFile multipartFile1 = vo.getGimgf1();
		MultipartFile multipartFile2 = vo.getGimgf2();
		File file1 = new File(uploadPath, multipartFile1.getOriginalFilename());
		File file2 = new File(uploadPath, multipartFile2.getOriginalFilename());
		String str1 = multipartFile1.getOriginalFilename();
		String str2 = multipartFile2.getOriginalFilename();
		vo.setGimg1(str1.substring(0,str1.lastIndexOf(".")));
		vo.setGimg2(str2.substring(0,str2.lastIndexOf(".")));
		int cnt = service.goodsInsert(vo);
		if(cnt>0) {
			if(!multipartFile1.isEmpty() && !multipartFile2.isEmpty()) {
				try {
					multipartFile1.transferTo(file1);
					multipartFile2.transferTo(file2);
					mv.addObject("goodsInsertInfo","상품이 등록되었습니다!");
				}catch(Exception e) {
					mv.addObject("goodsInsertInfo","파일업로드 실패!");
				}
			}
		}
		ArrayList<GoodsVO> list = service.myGoodsList(vo);
		mv.addObject("myGoodsList", list);
		mv.setViewName("order/sellerRegisterdGoods");
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
		MemberVO member = new MemberVO();
		member.setmId(vo.getMember_mid());
		member = mservice.findCompany(member);
		model.addObject("company",member);
		model.addObject("goods",vo);
		model.setViewName("goods/goodsInfo");
		return model;
	}
	@RequestMapping(value ="/sRGoods")//내가 등록한 상품
	public ModelAndView sellerRegisterdGoods(ModelAndView mv, HttpServletRequest request, GoodsVO vo) {
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("logInUser");
		vo.setMember_mid(mvo.getmId());;
		ArrayList<GoodsVO> list = service.myGoodsList(vo);
		mv.addObject("myGoodsList", list);
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
}

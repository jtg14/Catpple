package com.portfolio.project;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import business.GService;
import vo.GoodsVO;
import vo.MemberVO;

@Controller
public class GoodsController {
	
	@Autowired
	GService service;
	
	@RequestMapping(value = "goodsInsert", method = RequestMethod.POST)
	public ModelAndView goodsInsert(HttpServletRequest request, ModelAndView mv, GoodsVO vo) {
		MemberVO mvo = new MemberVO();
		mvo = (MemberVO)request.getSession().getAttribute("logInUser");
		vo.setMid(mvo.getmId());
		String uploadPath = "C:\\Catpple\\src\\main\\webapp\\resources\\sellerInfo\\"+vo.getMid();
		MultipartFile multipartFile1 = vo.getGimgf1();
		MultipartFile multipartFile2 = vo.getGimgf2();
		File file1 = new File(uploadPath, multipartFile1.getOriginalFilename());
		File file2 = new File(uploadPath, multipartFile2.getOriginalFilename());
		
		vo.setGimg1(multipartFile1.getOriginalFilename());
		vo.setGimg2(multipartFile2.getOriginalFilename());
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
		mv.setViewName("order/sellerOrderList");
		return mv;
	}
	@RequestMapping(value="/gSResult")
	public ModelAndView goodsSearchResult(ModelAndView model,GoodsVO vo,HttpServletRequest request) {
		String searchWord = request.getParameter("search");
			model.addObject("searchResult",service.goodsSearch(searchWord));
			model.addObject("searchWord",searchWord);
			model.setViewName("goods/goodsSearch");
		return model;
	}
}

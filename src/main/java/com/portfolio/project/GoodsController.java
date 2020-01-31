package com.portfolio.project;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import business.GService;
import vo.GoodsVO;

@Controller
public class GoodsController {
	
	@Autowired
	GService service;
	
	@RequestMapping(value = "goodsInsert", method = RequestMethod.POST)
	public ModelAndView goodsInsert(ModelAndView mv, GoodsVO vo) {
		String uploadPath = "C:\\Users\\arsyu\\eclipse-workspace\\Catpple\\src\\main\\webapp\\resources\\images\\sellerInfo";
		MultipartFile multipartFile1 = vo.getGimgf1();
		MultipartFile multipartFile2 = vo.getGimgf2();
		File file1 = new File(uploadPath, multipartFile1.getOriginalFilename());
		File file2 = new File(uploadPath, multipartFile2.getOriginalFilename());
		
		vo.setGimg1("resources/images/sellerInfo/"+multipartFile1.getOriginalFilename());
		vo.setGimg2("resources/images/sellerInfo/"+multipartFile2.getOriginalFilename());
		int cnt = service.goodsInsert(vo);
		if(cnt>0) {
			if(!multipartFile1.isEmpty() && !multipartFile2.isEmpty()) {
				try {
					multipartFile1.transferTo(file1);
					multipartFile2.transferTo(file2);
				}catch(Exception e) {
					System.out.println("파일업로드 실패 : "+e.toString());
				}
			}
		}
		mv.setViewName("index");
		return mv;
	}
}

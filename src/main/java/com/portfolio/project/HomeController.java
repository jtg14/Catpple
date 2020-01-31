package com.portfolio.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	
	
	@RequestMapping(value= "myInfoBoardDetail")
	public String myInfoBoardDetail() {
		return "myInfo/myInfoBoardDetail";
	}
	
	@RequestMapping(value= "myInfoCart")
	public String myInfoCart() {
		return "myInfo/myInfoCart";
	}
	
	@RequestMapping(value= "myInfoChange2")//UserController에 매핑중복
	public String myInfoChange2() {
		return "myInfo/myInfoChange";
	}
	
	@RequestMapping(value= "myInfoCustomerInquiry")
	public String myInfoCustomerInquiry() {
		return "myInfo/myInfoCustomerInquiry";
	}

	@RequestMapping(value= "myInfoExpectedPoints")
	public String myInfoExpectedPoints() {
		return "myInfo/myInfoExpectedPoints";
	}
	
	@RequestMapping(value= "myInfoFAQ")
	public String myInfoFAQ() {
		return "myInfo/myInfoFAQ";
	}
	
	@RequestMapping(value= "myInfoMain")
	public String myInfoMain() {
		return "myInfo/myInfoMain";
	}
	
	@RequestMapping(value= "myInfoOrderCancel")
	public String myInfoOrderCancel() {
		return "myInfo/myInfoOrderCancel";
	}

	@RequestMapping(value= "myInfoOrderDelivery")
	public String myInfoOrderDelivery() {
		return "myInfo/myInfoOrderDelivery";
	}

	@RequestMapping(value= "myInfoPoint")
	public String myInfoPoint() {
		return "myInfo/myInfoPoint";
	}

	@RequestMapping(value= "myInfoReturnExchange")
	public String myInfoReturnExchange() {
		return "myInfo/myInfoReturnExchange";
	}
	
	@RequestMapping(value= "myInfoSuggestions")
	public String myInfoSuggestions() {
		return "myInfo/myInfoSuggestions";
	}
	
	@RequestMapping(value= "myInfoWithdrawal")
	public String myInfoWithdrawal() {
		return "myInfo/myInfoWithdrawal";
	}
	
	@RequestMapping(value= "myInfoWriting")
	public String myInfoWriting() {
		return "myInfo/myInfoWriting";
	}
	
}

package com.inhatc.mojuk.useful.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.inhatc.mojuk.useful.service.UsService;
import com.inhatc.mojuk.useful.vo.UsVO;

@Controller
public class UsController {

	private static final Logger logger = LoggerFactory.getLogger(UsController.class);
	
	@Autowired
	private UsService service;
	
	@RequestMapping(value="/useful_link.do")
	public ModelAndView usful_link(UsVO usvo) throws Exception{
		logger.info("Welcome!! The useful_link board");
		
		ModelAndView mv = new ModelAndView("useful_link/us_list");
		mv.addObject("useful_board", service.listAll());
		
		return mv;
	}
	
	@RequestMapping(value = "/us_write.do")
	public String us_write(Locale locale, Model model) {
		
		return "/useful_link/us_write";
	}
	
	@RequestMapping(value = "/us_register.do", method = RequestMethod.POST)
	public String us_register(UsVO usvo) throws Exception {
		logger.info("Ok to register useful source..");
		logger.info(usvo.toString());
		service.insert(usvo);
		return "redirect:/useful_link.do";
	}
	
}

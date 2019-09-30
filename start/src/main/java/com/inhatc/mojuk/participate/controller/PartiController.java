package com.inhatc.mojuk.participate.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.inhatc.mojuk.main.vo.JoinVO;
import com.inhatc.mojuk.participate.service.PartiService;
import com.inhatc.mojuk.participate.vo.PartiVO;


@Controller
public class PartiController {
	
	private static final Logger logger = LoggerFactory.getLogger(PartiController.class);

	
	@Autowired
	private PartiService service;
	
	@RequestMapping(value = "/participate.do", method = RequestMethod.GET)
	public ModelAndView participate(Model model) throws Exception {
		
		logger.info("Welcome participate!");
		
		ModelAndView mv = new ModelAndView("/participate/participate");
		mv.addObject("parti_all", service.readAll());
		
		return mv;
	}

	@RequestMapping(value = "/parti_check.do")
	public ModelAndView parti_check(Model model,HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/participate/parti_check");
		
		JoinVO user = (JoinVO)session.getAttribute("userLoginInfo");
		
		PartiVO parti_one = service.readone(user.getStu_no());
		mv.addObject("parti_one", parti_one);
		
		return mv;
	}
	
	@RequestMapping(value = "/parti_update.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String parti_update(@ModelAttribute PartiVO vo) throws Exception {
		logger.info("Your participate save..");
		logger.info(vo.getOne_in_two_name());
		service.update(vo);
		return "redirect:/participate.do";
	}
}

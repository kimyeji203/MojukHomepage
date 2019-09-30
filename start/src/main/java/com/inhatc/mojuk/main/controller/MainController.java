package com.inhatc.mojuk.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inhatc.mojuk.board.controller.BoardController;
import com.inhatc.mojuk.main.service.MainService;
import com.inhatc.mojuk.main.vo.JoinVO;


@Controller
public class MainController {
	@Autowired
	MainService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET) 
	public String home(Locale locale, Model model,HttpSession ses) {
	
		return "main/index"; 
	}
	
	
	
	
	/* >>>>>>>>>>>>>>>>>>>>>>    login Page    <<<<<<<<<<<<<<<<<<<<<<<<*/
	@RequestMapping(value="/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/loginUp.do", method = RequestMethod.POST)
	public String loginUp(String stu_no, String password, HttpSession session, HttpServletResponse response) throws Exception{
		String jsp = "";
		try {
			JoinVO login = service.loginup(stu_no, password);
			
			if(login != null) {
				//로그인 세션 부여
				session.setAttribute("userLoginInfo", login);
				jsp = "main/index";
			}else {
				jsp = "redirect:/login.do";
			}
			logger.info(login.getStu_name() + login.getStu_no());
		}catch(NullPointerException e){
			/*
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('학번 혹은 비밀번호가 일치 하지 않습니다.');</script>");
	        out.flush();
	        */
	        jsp = "redirect:/login.do";
		}
		
		
		return jsp;
	}
	
	@RequestMapping("/logout.do")
	public void logout(HttpSession session,HttpServletResponse response) throws IOException {
		session.setAttribute("userLoginInfo", null);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그아웃 되었습니다.');location.href='/mainpage.do'</script>");
        out.flush();
        logger.info("LOGOUT!!...");
	}
	
	/* >>>>>>>>>>>>>>>>>>>>>>    Join Page     <<<<<<<<<<<<<<<<<<<<<<<<*/
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join(Locale locale, Model model,HttpSession ses) {
		return "join"; 
	}
	
	@RequestMapping(value = "/joinUp.do", method = RequestMethod.POST)
	public String joinUp(JoinVO vo) throws Exception{
		service.joinup(vo);
		return "redirect:/login.do"; 
	}
	/* >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
	
	
	@RequestMapping(value = "/mainpage.do", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		
		return "main/index";
	}

	@RequestMapping(value = "/no_list.do", method = RequestMethod.GET)
	public String no_list(Locale locale, Model model) {
		
		return "/notice/no_list";
	}
	
	@RequestMapping(value = "/no_write.do", method = RequestMethod.GET)
	public String no_write(Locale locale, Model model) {
		
		return "/notice/no_write";
	}
	

	
	@RequestMapping(value = "/pro_write.do", method = RequestMethod.GET)
	public String pro_write(Locale locale, Model model) {
		
		return "/project/pro_write";
	}
	
	@RequestMapping(value = "/profile.do")
	public String profile(Locale locale, Model model) {
		
		return "/profile/profile";
	}
	
	@RequestMapping(value = "/ganda.do", method = RequestMethod.GET)
	public String ganda(Locale locale, Model model) {
		
		return "/ganda/ga_list";
	}
	
	
}

package com.inhatc.mojuk.error.controller;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ErrorController {
	private static final Logger logger = LoggerFactory.getLogger(ErrorController.class);
	
	
	@RequestMapping(value="/throwable")
	public String throwable(HttpServletRequest request, Model model) {
		
		pageErrorLog(request);
		model.addAttribute("msg","예외가 발생하였습니다.");
		return "serverError";
	}
	@RequestMapping(value="/exception")
	public String exception(HttpServletRequest request, Model model) {
		
		pageErrorLog(request);
		model.addAttribute("msg","예외가 발생하였습니다.");
		return "serverError";
	}
	@RequestMapping(value="/400")
	public String pageError400(HttpServletRequest request, Model model) {
		
		pageErrorLog(request);
		model.addAttribute("msg","잘못 된 요청입니다.");
		return "serverError";
	}
	@RequestMapping(value="/403")
	public String pageError403(HttpServletRequest request, Model model) {
		
		pageErrorLog(request);
		model.addAttribute("msg","접근이 금지 되었습니다.");
		return "serverError";
	}
	@RequestMapping(value="/404.do")
	public String pageError404(HttpServletRequest request, Model model) {
		
		pageErrorLog(request);
		model.addAttribute("msg","요청하신 페이지는 존재하지 않습니다.");
		return "serverError";
	}
	@RequestMapping(value="/405")
	public String pageError405(HttpServletRequest request, Model model) {
		
		pageErrorLog(request);
		model.addAttribute("msg","요청된 메소드가 허용되지 않습니다.");
		return "serverError";
	}
	@RequestMapping(value="/500")
	public String pageError500(HttpServletRequest request, Model model) {
		
		pageErrorLog(request);
		model.addAttribute("msg","서버에 오류가 발생하였습니다.");
		return "serverError";
	}
	@RequestMapping(value="/503")
	public String pageError503(HttpServletRequest request, Model model) {
		
		pageErrorLog(request);
		model.addAttribute("msg","해당 서비스를 사용할 수 없습니다.");
		return "serverError";
	}


	private void pageErrorLog(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		logger.info("status_code:" + request.getAttribute("javax.servlet.error.status_code"));;
		logger.info("exception_type:" + request.getAttribute("javax.servlet.error.exception_type"));
		logger.info("message:" + request.getAttribute("javax.servlet.error.message"));
		logger.info("request_uri:" + request.getAttribute("javax.servlet.error.request_uri"));
		logger.info("exception:" + request.getAttribute("javax.servlet.error.exception"));
		logger.info("servlet_name:" + request.getAttribute("javax.servlet.error.servlet_name"));
	}
}

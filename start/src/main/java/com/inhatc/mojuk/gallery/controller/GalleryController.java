package com.inhatc.mojuk.gallery.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.inhatc.mojuk.gallery.service.GalleryService;
import com.inhatc.mojuk.gallery.vo.GalleryVO;

@Controller
public class GalleryController {
	
	private static final Logger logger = LoggerFactory.getLogger(GalleryController.class);

	@Autowired
	GalleryService service;
	
	@RequestMapping(value="/gallery.do")
	public ModelAndView gallery(GalleryVO vo) throws Exception{
		ModelAndView mv = new ModelAndView("gallery/gallery");
		mv.addObject("galleryList", service.getAll());
		
		return mv;
	}
	
	@RequestMapping(value="/gallery_read.do", method = RequestMethod.GET)
	public ModelAndView gallery_read(@RequestParam String bno ) throws Exception{
		logger.info("You can garllery write.");
		ModelAndView mv = new ModelAndView("gallery/gallery_read");
		mv.addObject("readOne", service.readOne(bno));
		
		return mv;
	}
	
	@RequestMapping(value = "/gallery_write.do", method = RequestMethod.GET)
	public String galleryWrite(Model model) throws Exception {
		logger.info("You can garllery write.");
		
		return "gallery/gallery_write";
	}
	
	@RequestMapping(value="/gallery_register.do")
	public void galleryRegister(GalleryVO vo, HttpServletResponse response) throws Exception{
		logger.info("regist to picture....");
		
		service.regist(vo);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('등록되었습니다.');location.href='/gallery.do'</script>");
        out.flush();
        logger.info("FNISH REGISTER!!...");
        
	}
	
	@RequestMapping(value="/gallery_delete.do")
	public void galleryDelete(int bno,HttpServletResponse response) throws Exception{
		logger.info("DELETE...");
		
		service.delete(bno);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('삭제되었습니다.');location.href='/gallery.do'</script>");
        out.flush();
        logger.info("FNISH DELETE!!...");
	}
	
	@RequestMapping(value="/gallery_modify.do")
	public ModelAndView gallery_modify(GalleryVO vo) throws Exception{
		logger.info("MODIFY...");
		ModelAndView mv = new ModelAndView("gallery/gallery_write");
		mv.addObject("modifyInfo", vo);
		
		return mv;
	}
	

}
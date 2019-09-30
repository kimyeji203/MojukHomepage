package com.inhatc.mojuk.board.controller;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inhatc.mojuk.board.service.BoardService;
import com.inhatc.mojuk.board.vo.BoardVO;
import com.inhatc.mojuk.board.vo.Criteria;
import com.inhatc.mojuk.board.vo.EduVO;
import com.inhatc.mojuk.board.vo.ThesisVO;
import com.inhatc.mojuk.main.vo.JoinVO;
import com.inhatc.mojuk.board.vo.PageMaker;
import com.inhatc.mojuk.board.vo.ProfileVO;
import com.inhatc.mojuk.board.vo.TestVO;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService service;
	
	/* ======================================================================================= */
	/* ======================         Profile Member Controller        ========================*/
	/* ======================================================================================= */
	@RequestMapping(value="/pf_member.do")
	public ModelAndView pf_member(ProfileVO vo) throws Exception{
		ModelAndView mv = new ModelAndView("profile/pf_member");
		mv.addObject("memberList", service.pf_allMember());
		return mv;
	}
	
	@RequestMapping(value="/pf_write.do")
	public ModelAndView pf_write(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("profile/pf_write");
		JoinVO user = (JoinVO)session.getAttribute("userLoginInfo");
		if(user != null) {
			String stu_no = user.getStu_no();
			
			if(service.profileYesNo(stu_no).equals("Y")) {
				Map<String, Object> profile = service.pf_myInfo(stu_no);
				
				mv.addObject("myProfile",profile);
				mv.addObject("cntEdu",profile.get("myEdu"));
				mv.addObject("cntAc",profile.get("myAc"));
			}else {
				Map<String, Object> cnt = new HashMap<String, Object>();
				cnt.put("0", 0);
				
				mv.addObject("myProfile","null");
				mv.addObject("cntEdu",cnt);
				mv.addObject("cntAc",cnt);
			}
		}
		return mv;
	}
	
	@RequestMapping(value="/pf_register.do")
	public void pf_register(ProfileVO vo, HttpServletResponse response,HttpSession session) throws Exception{
		JoinVO user = (JoinVO)session.getAttribute("userLoginInfo");
		if(user != null) {
			String stu_no = user.getStu_no();
			if(service.profileYesNo(stu_no).equals("N")) {
				logger.info("START REGISTER... your Information");
				
				Map<String, Object> hmap = new HashMap<String, Object>();
				hmap.put("img", vo.getPf_img().getBytes());

				service.registerMember(vo,hmap);

				
				response.setContentType("text/html; charset=UTF-8");
		        PrintWriter out = response.getWriter();
		        out.println("<script>alert('등록되었습니다.');location.href='/pf_write.do'</script>");
		        out.flush();
		        logger.info("FNISH REGISTER!!...");
			}else if(service.profileYesNo(stu_no).equals("Y")) {
				logger.info("START UPDATE.... your Information");
				
				Map<String, Object> hmap = new HashMap<String, Object>();
				
				try {
					logger.info("############################################################");
					logger.info("Image size is.. " + Integer.toString(vo.getPf_img().getBytes().length) + " Bytes");
					logger.info("############################################################");
					
					if(vo.getPf_img().getBytes().length == 0) {
						throw new NullPointerException();
					}
					hmap.put("img", vo.getPf_img().getBytes());
				}catch(NullPointerException e){
					hmap.put("img", null);
				}
				
				service.updateMember(vo,hmap);
				
				response.setContentType("text/html; charset=UTF-8");
		        PrintWriter out = response.getWriter();
		        out.println("<script>alert('수정 되었습니다.');window.close();</script>");
		        out.flush();
		        logger.info("FNISH UPDATE!!...");
			}
		}
		
	}
	
	
	//test
	@RequestMapping(value="/formFile.do")
	public String formFile() throws Exception{
		return "profile/formFile";
	}
	
	//test
	@RequestMapping(value="/view.do")
	public String view() throws Exception{
		return "profile/view";
	}
	
	//test
	@RequestMapping(value="/saveImage.do")
	public String saveImage(TestVO vo) throws Exception{
		try {

			Map<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("img", vo.getImgFile().getBytes());
			service.saveImage("300",hmap);
				
		}catch (Exception e){
			e.printStackTrace();
		}
		return "redirect:/formFile.do";
	}
	
	//test
	@RequestMapping(value="/getByteImage.do")
	public ResponseEntity<byte[]> getByteImage() throws Exception{
		Map<String, Object> map = service.getByteImageTest();
		byte[] imageContent = (byte[]) map.get("imgs");
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
		
	}
	/* ======================================================================================= */
	/* =========================     Jurnal Page Board Controller   ===========================*/
	/* ======================================================================================= */
	
	
	/* Thesis page main */
	@RequestMapping(value = "/th_list.do", method = RequestMethod.GET)
	public ModelAndView th_list(@ModelAttribute("cri") Criteria cri, ThesisVO thvo, HttpSession ses)
		throws Exception {

			logger.info("Welcome thesis_board!");
			//logger.info(cri.toString());
	
			ModelAndView mv = new ModelAndView("thesis/th_list");
			mv.addObject("th_boardList", service.th_listAll(thvo, cri, ses));
			
			List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
			List<ThesisVO> list = service.th_listAll(thvo, cri, ses);
			Map<String,Object> map = null;
			for(int i=0;i<list.size();i++) {
				map = new HashMap<String, Object>();

				map.put("th", list.get(i));
				map.put("writers", service.th_read_writer(list.get(i).getTh_bno()));
				
				result.add(map);
			}
			
			//mv.addObject("th_boardList", result);
			
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(service.countList());
			//pageMaker.setTotalCount(service.listCountCriteria(cri, ses));
			mv.addObject("pageMaker", pageMaker);
	
	
			return mv;
	}
	
	@RequestMapping(value = "/th_detail.do", method = RequestMethod.GET)
	public ModelAndView th_detail(@RequestParam("th_bno") int th_bno) throws Exception {
		ModelAndView mv = new ModelAndView("/thesis/th_detail");
	    mv.addObject("map", service.th_read(th_bno)); /*정보*/
	    mv.addObject("writers",service.th_read_writer(th_bno));
		return mv;
	}
	
	@RequestMapping(value="/th_update.do", method=RequestMethod.POST)
	public void th_update(ThesisVO thvo, HttpServletResponse response) throws Exception{
		
		service.th_update(thvo);
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('수정되었습니다.');self.close();</script>");
        out.flush();
	}
	
	@RequestMapping(value="/th_delete.do", method = RequestMethod.GET)
	public void th_delete(@RequestParam("th_bno") int th_bno, HttpServletResponse response) throws Exception {
		service.th_delete(th_bno);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('삭제되었습니다.');self.close();</script>");
        out.flush();
		
	}
	
	@RequestMapping(value = "/th_write.do", method = RequestMethod.GET)
	public String th_write(ThesisVO thvo, RedirectAttributes rttr) throws Exception {
		logger.info("th_write ...");
		logger.info(thvo.toString());
		return "thesis/th_write";
	}
	
	@RequestMapping(value = "th_register.do", method = RequestMethod.POST)
	public void th_register(ThesisVO thvo,RedirectAttributes rttr,HttpServletRequest request,HttpServletResponse response) throws Exception {
		logger.info("th_register ...");
		logger.info(thvo.toString());
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
		if(thvo.getTh_name().equals("") || thvo.getTh_name() == null
				|| thvo.getTh_institution().equals("") || thvo.getTh_institution() == null
				|| thvo.getTh_insti_name().equals("") || thvo.getTh_insti_name() == null
				|| thvo.getTh_group().equals("") || thvo.getTh_group() == null
				|| thvo.getTh_page().equals("") || thvo.getTh_page() == null
				|| thvo.getTh_public_date().equals("") || thvo.getTh_public_date() == null) {
			out.println("<script>alert('모든 정보를 입력 하세요');location.href='/th_write.do'</script>"); 
		}else {
			
				service.th_register(thvo, request);
			    out.println("<script>alert('등록 되었습니다.');location.href='/th_list.do'</script>");
			
		}
		out.flush();
	}
	
	
	/* ======================================================================================= */
	/* ======================     Toc&Project Page Board Controller    ========================*/
	/* ======================================================================================= */
	
	/* board main */
	@RequestMapping(value = "/toc_board.do", method = RequestMethod.GET)
	public String toc_boardMain(@ModelAttribute("cri") Criteria cri, BoardVO vo, Model model, HttpSession ses)
		throws Exception {

			logger.info("Welcome toc_board!");
			logger.info(cri.toString());
	
			model.addAttribute("toc_boardList", service.listAll(vo, cri, ses));
	
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
	
			pageMaker.setTotalCount(service.listCountCriteria(cri, ses));
	
			model.addAttribute("pageMaker", pageMaker);
	
	
			return "toc_board/toc_board";
	}

	@RequestMapping(value = "/pro_list.do", method = RequestMethod.GET)
	public String pro_listMain(@ModelAttribute("cri") Criteria cri, BoardVO vo, Model model, HttpSession ses)
			throws Exception {
		logger.info("Welcome Project_board!");
		logger.info(cri.toString());
		
		model.addAttribute("pro_imges",service.pro_fileImg());
		//model.addAttribute("pro_fileImges", service.fileImg(vo));
		model.addAttribute("pro_boardList", service.listAll(vo, cri, ses));


		return "/project/pro_list";
	}
	
	/* project board register*/
	@RequestMapping(value = "/pro_register.do", method = RequestMethod.POST)
	public void pro_registerPOST(BoardVO board,RedirectAttributes rttr,HttpServletRequest request,HttpServletResponse response) throws Exception {
		logger.info("toc_register ...");
		logger.info(board.toString());
		
		service.pro_regist(board, request);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('등록 되었습니다.'); window.close();</script>");
        out.flush();
	}
	
	
	/* board write */
	@RequestMapping(value = "/toc_write.do", method = RequestMethod.GET)
	public String toc_write(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("toc_write ...");
		logger.info(board.toString());
		return "toc_board/toc_write";
	}

	/* board register */
	@RequestMapping(value = "/toc_register.do", method = RequestMethod.POST)
	public void toc_registerPOST(BoardVO board,RedirectAttributes rttr,HttpServletRequest request,HttpServletResponse response) throws Exception {
		logger.info("toc_register ...");
		logger.info(board.toString());
		service.regist(board, request);
		
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('등록 되었습니다.'); window.close();</script>");
        out.flush();
	}

	
	
	/* board read */
	@RequestMapping(value = "/toc_board/toc_read.do", method = RequestMethod.GET)
	public ModelAndView toc_read(@RequestParam("toc_bno") int bno, Model model) throws Exception {
		ModelAndView mv = new ModelAndView("/toc_board/toc_read");
		Map<String,Object> map = service.read(bno);
	    mv.addObject("map", map.get("map")); /*정보*/
	    mv.addObject("list", map.get("list")); /*파일*/
	    
		return mv;
	}
	
	
}

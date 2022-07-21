package edu.kh.allWeAdopt.board.controller;


import java.util.List;
import java.util.Map;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.allWeAdopt.board.model.service.BoardService;

import edu.kh.allWeAdopt.board.model.vo.BoardDetail;
import edu.kh.allWeAdopt.board.model.vo.Template;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginMember"})
public class AdminNoticeController {
	
	@Autowired
	private BoardService service;
	
	private Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);

	// 관리자 - 공지사항 리스트 조회화면
	@GetMapping("/notice/list")
	public String adminNoticeList( @RequestParam(value="cp", required=false, defaultValue="1") int cp,
								   Model model) {
		
		logger.info("공지사항 리스트 조회 수행됨");
		
		// nList를 조회하는 서비스 호출 ~
		Map<String, Object> map = service.selectNoticeList(cp);
		
		// request범위에 nList 세팅
		model.addAttribute("map", map);
		
		return "notice/noticeList";
	}
	
	// 관리자 - 공지사항 상세조회화면
	@GetMapping("/notice/detail/{boardNo}")
	public String adminNoticeDetail( @PathVariable("boardNo") int boardNo,
								 	 @RequestParam(value="cp", required=false, defaultValue="1") int cp,
								 	 Model model ) {
		
		BoardDetail detail = service.selectNoticeDetail(boardNo); 
		
		model.addAttribute("detail",detail);
		
		return "notice/noticeDetail";
	}
	
	// 관리자 - 공지사항 작성화면
	@GetMapping("/notice/write")
	public String adminNoticeWrite( String mode,
									@RequestParam(value="no", required=false, defaultValue="0") int boardNo, 
									Model model) {
		
		List<Template> tList = service.selectTemplate();
		
		model.addAttribute("tList", tList);
		
		if(mode.equals("update")) {
			
			BoardDetail detail = service.selectNoticeDetail(boardNo); 
			
			model.addAttribute("detail",detail);
		}
		
		return "notice/noticeWrite";
	}
	
	// 관리자 - 공지사항 작성 / 수정
	@PostMapping("/notice/write")
	public String adminNoticeWrite( BoardDetail detail,
									String mode,
									int cp,
									Model model,
									RedirectAttributes ra) {
		
		int result = 0;
		String message = null;
		String path = null;
		
		// 게시글 등록
		if(mode.equals("insert")) {
			
			logger.info("게시글 등록 수행됨");
			
			result = service.insertBoard(detail);
			
			if(result>0) {
				message = "게시글 등록 성공"; 
				path = "redirect:detail/"+detail.getBoardNo();
			}else {
				message = "게시글 등록 실패"; 
				path = "redirect:write";
			}
			
		}
		
		// 게시글 수정
		if(mode.equals("update")) {
			
			logger.info("게시글 수정 수행됨");
			
			result = service.updateBoard(detail);
			
			if(result>0) {
				message = "게시글 수정 성공"; 
				path = "redirect:detail/"+detail.getBoardNo()+"?cp="+cp;
			}else {
				message = "게시글 수정 실패"; 
				path = "redirect:write";
			}
			
		}
		
		ra.addFlashAttribute( "message", message );
		model.addAttribute("detail",detail);
		
		return path;

	}
	
	@GetMapping("/notice/delete/{boardNo}")
	public String deleteBoard( @PathVariable("boardNo") int boardNo,
			      RedirectAttributes ra,
			      @RequestHeader("referer") String referer) {
		
		int result = service.deleteBoard( boardNo );
		
		String message = null;
		String path = null;
		
		if(result>0) {
			message = "게시글 삭제 완료";
			path = "redirect:../list/";
		}else {
			message = "게시글 삭제 실패";
			path = referer;
		}
		
		ra.addFlashAttribute("message", message);
		return path;
	}
	
	@PostMapping("/template/write")
	@ResponseBody
	public String insertTemplate(Template template) {
		
		int result = service.insertTemplate(template);
		
		List<Template> tList = null;
		if(result>0) {
			tList = service.selectTemplate();
		}
		
		return new Gson().toJson(tList);
		
	}
	
	@PostMapping("/template/delete")
	@ResponseBody
	public String deleteTemplate(String tempNo) {
		
		int result = service.deleteTemplate(tempNo);
		
		List<Template> tList = null;
		if(result>0) {
			tList = service.selectTemplate();
		}
		
		return new Gson().toJson(tList);
		
	}
	
	
	

}

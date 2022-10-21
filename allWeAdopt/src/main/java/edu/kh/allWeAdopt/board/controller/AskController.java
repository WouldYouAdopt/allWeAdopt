package edu.kh.allWeAdopt.board.controller;

import edu.kh.allWeAdopt.board.model.service.BoardService;
import edu.kh.allWeAdopt.board.model.service.ReplyService;
import edu.kh.allWeAdopt.board.model.vo.BoardDetail;
import edu.kh.allWeAdopt.board.model.vo.Reply;
import edu.kh.allWeAdopt.member.model.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/member/myPage")
@SessionAttributes({"loginMember"})
public class AskController {


	@Autowired
	private BoardService service;
	
	@Autowired
	private ReplyService ReplyService;
	
	private final Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	
	
	// 문의사항 리스트 조회
	@GetMapping("/ask/list")
	public String askList(@RequestParam(value="cp", required=false, defaultValue="1") int cp,
						  Model model,
						  @ModelAttribute("loginMember") Member loginMember ) {
		
		
		
		// aList를 조회하는 서비스 호출 
		Map<String, Object> map = service.selectaskList(cp,loginMember);
		
		// request범위에 aList 세팅
		model.addAttribute("map", map);
		
		return "ask/askList";
	}
	
	
	// 문의사항 상세 조회
	@GetMapping("/ask/detail/{boardNo}")
	public String askDetail( @PathVariable("boardNo") int boardNo,
						 	 @RequestParam(value="cp", required=false, defaultValue="1") int cp,
						 	 Model model ) {
		
		BoardDetail detail = service.selectAskDetail(boardNo); 
		
		List<Reply> rList = ReplyService.selectReplyList(boardNo);
		
		
		model.addAttribute("detail",detail);
		model.addAttribute("rList",rList);
		
		
		
		return "ask/askDetail";
	}
	
	
	// 관리자 - 공지사항 작성화면
	@GetMapping("/ask/write")
	public String askWrite( String mode,
									@RequestParam(value="no", required=false, defaultValue="0") int boardNo, 
									Model model) {
		
			
		BoardDetail detail = service.selectAskDetail(boardNo); 
		
		model.addAttribute("detail",detail);
		
		return "ask/askWrite";
	}
	
	
	
	// 문의사항 글작성
	@PostMapping("/ask/write")
	public String askWrite( BoardDetail detail, // 멤버 넘버 / 카테고리 밸류랑 / 제목 / 내용
							String mode,
							int cp,
							Model model,
							RedirectAttributes ra) {
		
		int result = 0;
		String message = null;
		String path = null;
		
		// 게시글 등록
		if(mode.equals("insert")) {
								
			System.out.println("내용 : " +detail.getBoardContent());
			
			logger.info("게시글 등록 수행됨");
			
			result = service.insertAskWrite(detail);
			
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
	
	
	
	
	
	
}

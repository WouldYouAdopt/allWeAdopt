package edu.kh.allWeAdopt.userBoard.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.google.gson.JsonObject;

import edu.kh.allWeAdopt.board.model.vo.Board;
import edu.kh.allWeAdopt.member.model.vo.Member;
import edu.kh.allWeAdopt.userBoard.model.service.UserBoardService;
import edu.kh.allWeAdopt.userBoard.model.vo.Animal;
import edu.kh.allWeAdopt.userBoard.model.vo.Area;

@Controller
@RequestMapping("/board")
@SessionAttributes({"loginMember"})
public class UserBoardController {

	@Autowired
	private UserBoardService service;
	
	// 사용자 게시판 리스트 출력
	@GetMapping("/user")
	public String boardList(Model model) {
		
		List<Board> list = service.boardList();
		model.addAttribute("boardList",list);
		return "board/userBoardList";
	}
	
	// 상세 게시판 출력
	@GetMapping("/detail/2/{boardNo}")
	public String boardDetail(@PathVariable("boardNo") int boardNo, Model model) {
		
		Board board = service.boardDetail(boardNo);
		
		model.addAttribute("board",board);
		
		return "board/userBoardDetail";
	}
	
//	사용자 게시판 등록
	@GetMapping("/user/boardRegist")
	public String boardRegist(Model model) {
		List<Area> areaList = service.areaList();
		
		// 지역 리스트 출력
		model.addAttribute("areaList",areaList);
		
		return "board/userBoardRegist";
	}
	
//	썸머노트 이미지 미리보기
	@RequestMapping(value="/user/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		String webPath = "/resources/images/board/";
		
		// 컴퓨터 상에서 webPath까지의 실제 경로를 불러옴
		String fileRoot = request.getSession().getServletContext().getRealPath(webPath);
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/images/board/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
//	사용자 게시글 등록
	@PostMapping("/user/boardRegist")
	public String userBoardRegist(Board board, Animal animal, Area area,
			HttpSession session, @RequestParam("neuterings") String neuterings,
			@RequestParam("genders") String genders,
			@ModelAttribute("loginMember") Member loginMember) {
		int boardNo = 0;
		board.setMemberNo(loginMember.getMemberNo());
		int result = service.userBoardRegist(board);
		
		if(result > 0) {
			boardNo = service.getBoardNo();
			area.setBoardNo(boardNo);
			result = service.userBoardArea(area);
		}
		
		if(result> 0) {
			animal.setBoardNo(boardNo);
			
			if(genders.equals("수컷")) animal.setGender('M');
			else if(genders.equals("암컷"))animal.setGender('W');
			
			if(neuterings.equals("완료")) animal.setNeutering('Y');
			else if(neuterings.equals("미완료")) animal.setNeutering('N');
			
			result = service.userBoardAnimal(animal);
		}
		return "redirect:/board/user";
	}
	
	// 상세 지역 호출
	@RequestMapping("/user/loadAreaList")
	@ResponseBody
	public List<Area> loadAreaList(@RequestParam("area") String area) {
		List<Area> list = service.loadAreaList(area);
		
		return list;
	}
	
	// 품종 호출
	@RequestMapping("/user/loadAnimalList")
	@ResponseBody
	public List<Animal> loadAnimalList(@RequestParam("animalType") String animalType) {
		List<Animal> list = service.loadAnimalList(animalType);
		
		return list;
	}
}

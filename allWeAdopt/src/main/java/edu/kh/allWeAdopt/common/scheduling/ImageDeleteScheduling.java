package edu.kh.allWeAdopt.common.scheduling;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import edu.kh.allWeAdopt.board.model.service.BoardService;

@Component
public class ImageDeleteScheduling {

	private Logger logger = LoggerFactory.getLogger(ImageDeleteScheduling.class);

	// SUMMERNOTE 사용시 이미지 업로드 후 글작성을 취소하여
	// BAORD_CONTENT에는 없지만, 서버 /resources/images/summernote 폴더에는 존재하는
	// 이미지 파일을 정시 마다 삭제

	// 코딩 순서
	// 1) BOARD_CONTENT 에 존재하는 모든 이미지 목록 조회
	// 2) resources/imgaes/summernote 폴더에 존재하는 모든 이미지 파일 목록 조회
	// 3) 두 목록을 비교해서 일치하지 않는 이미지 파일을 삭제
	// (DB에는 없는데 서버 폴더에 있으면 삭제)

	@Autowired
	private BoardService service;

	@Autowired
	private ServletContext application; // application scope객체 > 서버 폴더 경로 얻어오기에 사용

	@Scheduled(cron="0 0 0 * * *") // 매일 0시에
	public void serverImageDelete( ) {

		// [1] boardContent의 img태그의 src속성값을 모두 불러오기
		
		// 1. BOARD_IMG에 존재하는 모든 boardContent 조회
		List<String> dbList = service.selectDBList();
		
		// 2. img 태그 src 추출 정규표현식
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); 
		
		String fileName = null; // 파일명 변환 후 저장할 임시 참조 변수
		String src = null; // src 속성값을 저장할 임시 참조 변수
		List<String> imgList = new ArrayList<String>(); // img 태그의 src속성의 값을 담을 List
		
		for(int i = 0; i < dbList.size(); i++) {
			
			// 3. SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
			Matcher matcher = pattern.matcher(dbList.get(i));

//			// matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매칭된 src 속성 값)에 반복 접근하여 값이 있을 경우 true			
			while(matcher.find()){
				
				src =  matcher.group(1); // 매칭된 src 속성값을  Matcher 객체에서 꺼내서 src에 저장
				
				System.out.println( src );

				String filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")) + "/"; 
				// 파일명을 제외한 경로만 별도로 저장. (/resources/images/summernote)

				fileName = src.substring(src.lastIndexOf("/")+ 1); // 업로드된 파일명만 잘라서 별도로 저장.

				String deleteImage = filePath + fileName;
				
				imgList.add(deleteImage);

			}
			
		}
		
		// [2] resources/imgaes/board 폴더에 존재하는 모든 이미지 파일 목록 조회
		String folderPath = application.getRealPath("/resources/images/summernote");

		File path = new File(folderPath); // /resources/images/board 폴더를 참조하는 객체

		File[] arr = path.listFiles(); // path가 참조하는 폴더에 있는 모든 파일을 얻어와 File배열로 반환

		List<File> serverList = Arrays.asList(arr);		

		// [3]두 목록을 비교해서 일치하지 않는 이미지 파일 삭제 (DB에는 없는데 서버폴더에 있으면 삭제)
		if( !serverList.isEmpty() ) { // 서버에 이미지 파일이 있을 때 비교,삭제 진행

			for( File serverImage : serverList ) {

				// 서버에 저장된 이미지명만 불러와서 폴더 경로를 더한다음 비교!!!!
				String name = "/resources/images/summernote/" + serverImage.getName(); // sample.jpg

				// List.indexOf(value) : List에 value와 같은 값이 있으면 인덱스 반환 없으면 -1반환 (imgList에는 없고, serverList에만 있는 경우)
				if(imgList.indexOf(name)==-1) {
					
					logger.info(serverImage.getName() + " 삭제");
					logger.info("----이미지 삭제 완료----");

					// 파일 삭제
					serverImage.delete();

				}

			}

		}

	}
}

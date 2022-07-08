package edu.kh.allWeAdopt.member.model.service;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.allWeAdopt.common.Util;
import edu.kh.allWeAdopt.member.model.dao.MyPageDAO;
import edu.kh.allWeAdopt.member.model.vo.Member;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bCrypt;

	// 내정보 수정 전 - 비밀번호 확인 기능 구현
	@Override
	public int pwConfirm(Member loginMember) {
		
		return dao.pwConfirm( loginMember );
	}

	// 내정보 수정 기능 구현
	@Override
	public int updateInfo(Map<String, Object> map, MultipartFile uploadImage) throws IOException{
		
		String deleteImage = (String)map.get("deleteImage");
		// 0번 + 업로드 X : 기존프로필 (loginMember.getProfileImage())
		// 0번 + 업로드 O : rename한 프로필 업데이트
		// 1번 : 삭제 == null로 프로필 업데이트
		
		// 업로드 상태에서 취소 클릭한 경우 => 기존 프로필
		
		String rename = null;
		
		// 업로드된 이미지가 있는 경우
		if(!uploadImage.isEmpty()) {
			
			rename = Util.fileRename( uploadImage.getOriginalFilename() );
			map.put("profileImage", map.get("webPath") + rename);
		
		}else {
			
			// 업로드된 이미지가 없음 + 삭제버튼 클릭된 경우
			if(deleteImage.equals("1")) {
				map.put("profileImage", null);
			}
			
		}
		
		int result = dao.updateInfo( map );
		
		// 정보수정 성공 및 uploadImage가 empty가 아닌 경우 서버에 사진 저장
		if(result > 0 && !uploadImage.isEmpty() ) {
			uploadImage.transferTo( new File ( map.get("folderPath")+rename) );
		}
			
		return result;
	}

	// 비밀번호 변경 기능 구현
	@Override
	public int updatePw(Map<String, Object> map) {
		
		// 1. DB에서 암호화된 현재 비밀번호 조회
		String memberPw = dao.selectMemberPw( map );
		
		// 2. map에서 입력한 비밀번호, 새 비밀번호 꺼내기
		String inputPw = (String)map.get("inputPw");
		String newPw = (String)map.get("newPw");
		

		// 3. 입력한 비밀번호와 현재 비밀번호 비교 bCrypt.matches(평문, 암호화된 비번)
		if(bCrypt.matches(inputPw,memberPw)) {
			
			// 4. 일치하는 경우 새 비밀번호를 암호화해 update 실행
			newPw = bCrypt.encode(newPw);
			map.put("newPw", newPw);
			
			return dao.updatePw(map);
			
		}
		
		return 0;
	}
	
	

}

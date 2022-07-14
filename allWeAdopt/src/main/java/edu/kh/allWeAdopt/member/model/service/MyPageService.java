package edu.kh.allWeAdopt.member.model.service;

import java.io.IOException;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.allWeAdopt.member.model.vo.Member;

public interface MyPageService {

	/** 내정보 수정 전 - 비밀번호 확인 Service
	 * @param loginMember
	 * @return result
	 */
	int pwConfirm(Member loginMember);

	/** 내 정보 수정 Service
	 * @param map
	 * @param uploadImage
	 * @return result
	 * @throws IOException
	 */
	int updateInfo(Map<String, Object> map, MultipartFile uploadImage) throws IOException;

	/** 비밀번호 수정 Service
	 * @param map
	 * @return result
	 */
	int updatePw(Map<String, Object> map);

	
	/** 회원탈퇴 Service
	 * @param loginMember
	 * @return
	 */
	int secession(Member loginMember);

	
	
	/** 인증번호를 받은 이메일, 인증번호, 인증번호 발급 시간  -> DB 삽입
	 * @param inputEmail 
	 * @param inputEmail
	 * @param cNumber
	 * @return
	 */
	int insertCertification(Map<String, Object> map);


}

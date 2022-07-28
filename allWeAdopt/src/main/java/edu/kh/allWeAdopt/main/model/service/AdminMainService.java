package edu.kh.allWeAdopt.main.model.service;

import java.util.Map;

import edu.kh.allWeAdopt.main.model.vo.AdminMain;

public interface AdminMainService {

	//	관리자 메인 조회

	//오늘날짜 '문의 글 수 조회' / 오늘날자 어답터 게시글 수 / 오늘날짜 펀딩 결제 건수
	AdminMain adminMainCount();

}

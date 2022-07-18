package edu.kh.allWeAdopt.board.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.allWeAdopt.board.model.vo.BoardDetail;
import edu.kh.allWeAdopt.member.model.vo.Member;

public interface BoardService {

	/** DB에 저장된 boardContent 조회 Service
	 * @return dbList
	 */
	List<String> selectDBList();
	
	// ------------------------- 공지사항 ---------------------------
	
	/** 공지사항 목록 조회 Service
	 * @param cp
	 * @return nList
	 */
	Map<String, Object> selectNoticeList(int cp);

	/** 공지사항 상세 조회 Service
	 * @param boardNo
	 * @return detail
	 */
	BoardDetail selectNoticeDetail(int boardNo);

	/** 게시글 작성 (썸머노트 이용) Service
	 * @param detail
	 * @return result
	 */
	int insertBoard(BoardDetail detail);

	/** 게시글 수정 Service
	 * @param detail
	 * @return result
	 */
	int updateBoard(BoardDetail detail);

	/** 게시글 삭제 Service
	 * @param boardNo
	 * @return result
	 */
	int deleteBoard(int boardNo);

	/** 문의글 조회하는 서비스 호출
	 * @param cp
	 * @param loginMember 
	 * @return aList
	 */
	Map<String, Object> selectaskList(int cp, Member loginMember);

}

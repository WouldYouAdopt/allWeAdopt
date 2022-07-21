package edu.kh.allWeAdopt.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.allWeAdopt.board.model.vo.Board;
import edu.kh.allWeAdopt.board.model.vo.BoardDetail;
import edu.kh.allWeAdopt.board.model.vo.Pagination;
import edu.kh.allWeAdopt.member.model.vo.Member;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** DB에 저장된 boardContent 조회 DAO
	 * @return
	 */
	public List<String> selectDBList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectDBList");
	}
	
	// ------------------------- 공지사항 ---------------------------

	
	/** 공지사항 게시글 수 조회 DAO
	 * @return listCount
	 */
	public int getListCount() {
		
		return sqlSession.selectOne("noticeMapper.getListCount");
	}

	/** 공지사항 목록 조회 DAO
	 * @param pagination
	 * @return nList
	 */
	public List<Board> selectNoticeList(Pagination pagination) {
		
		int offset = ( pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
		
	}

	/** 공지사항 상세 조회 DAO
	 * @param boardNo
	 * @return detail
	 */
	public BoardDetail selectNoticeDetail(int boardNo) {
		
		return sqlSession.selectOne("noticeMapper.selectNoticeDetail", boardNo);
	}

	/** 게시글 작성 DAO
	 * @param detail
	 * @return result
	 */
	public int insertBoard(BoardDetail detail) {
		
		return sqlSession.insert("noticeMapper.insertBoard", detail);
	}

	/** 게시글 수정 DAO
	 * @param detail
	 * @return result
	 */
	public int updateBoard(BoardDetail detail) {
		
		return sqlSession.update("noticeMapper.updateBoard", detail);
	}

	/** 게시글 삭제 DAO
	 * @param boardNo
	 * @return result
	 */
	public int deleteBoard(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.deleteBoard", boardNo);
	}

	/** 공지사항 게시글 수 조회 DAO
	 * @param memberNo 
	 * @return paginationCount
	 */
	public int paginationCount( Member loginMember) {
		
		return sqlSession.selectOne("noticeMapper.paginationCount", loginMember);
	}

	/** 문의사항 게시글 목록 조회 DAO
	 * @param pagination
	 * @return aList
	 */
	public List<Board> selectAskList(Pagination pagination, Member loginMember) {
		
		int offset = ( pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("noticeMapper.selectAskList", loginMember, rowBounds);
		
	}

	/** 문의사항 글 조회 DAO
	 * @param boardNo
	 * @return
	 */
	public BoardDetail selectAskDetail(int boardNo) {
		
		return sqlSession.selectOne("noticeMapper.selectAskDetail", boardNo);
	}

	/** 문의사항 글 작성 DAO
	 * @param detail
	 * @return
	 */
	public int insertAskWrite(BoardDetail detail) {
		
		return sqlSession.insert("noticeMapper.insertAskWrite", detail);
	}


	/**관리자 - 문의사항 게시글 수 조회 DAO
	 * @return
	 */
	public int paginationCount() {
		return sqlSession.selectOne("noticeMapper.paginationCount");
	}

	/** 관리자 - 문의사항 게시글 목록조회 
	 * @param pagination
	 * @return
	 */
	public List<Board> selectAskList(Pagination pagination) {
		
		int offset = ( pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("noticeMapper.selectAskList", null, rowBounds);
		
	}
	

	
	
	
}

package edu.kh.allWeAdopt.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.allWeAdopt.board.model.vo.Board;
import edu.kh.allWeAdopt.board.model.vo.BoardDetail;
import edu.kh.allWeAdopt.board.model.vo.Pagination;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
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



}

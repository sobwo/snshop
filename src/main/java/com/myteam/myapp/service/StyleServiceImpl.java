package com.myteam.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.Board_hashtagVo;
import com.myteam.myapp.domain.FollowingVo;
import com.myteam.myapp.domain.HashTagVo;
import com.myteam.myapp.domain.LikeMemberDto;
import com.myteam.myapp.domain.LikesDto;
import com.myteam.myapp.domain.LikesVo;
import com.myteam.myapp.persistance.BoardService_Mapper;
import com.myteam.myapp.persistance.StyleService_Mapper;

@Service("StyleServiceImpl")
/* public class StyleServiceImpl implements StyleService { 원래 */
public class StyleServiceImpl implements StyleService {

	private StyleService_Mapper ssm1;
	private BoardService_Mapper bsm;

	@Autowired
	public StyleServiceImpl(SqlSession sqlSession) {

		this.ssm1 = sqlSession.getMapper(StyleService_Mapper.class);

	}

	/* 임시 */
	@Autowired
	public void BoardServiceInpl(SqlSession sqlSession) {
		this.bsm = sqlSession.getMapper(BoardService_Mapper.class);
	}

	@Override
	public ArrayList<BoardVo> boardSelectAll(int memberNo) {

		ArrayList<BoardVo> blist = ssm1.boardSelectAll(memberNo);

		return blist;
	}

	@Override
	public BoardVo boardSelectOne(int boardNo) {

		BoardVo bv = new BoardVo();

		bv = ssm1.boardSelectOne(boardNo);
		return bv;
	}

	@Override
	public int likesCnt(int memberNo, int boardNo) {

		int value = bsm.likesCnt(memberNo, boardNo);

		return value;
	}

	@Override
	public int likesTotalCnt(int boardNo) {
		
		int value = bsm.likesTotalCnt(boardNo);
		
		return value;
	}

	@Override
	public ArrayList<LikesDto> boardTotalList(int memberNo) {

		ArrayList<LikesDto> llist = ssm1.boardTotalList(memberNo);
		
		return llist;
	}

	@Override
	public ArrayList<LikesDto> boardTotalList_newest(int memberNo) {
		
		ArrayList<LikesDto> llist = ssm1.boardTotalList_newest(memberNo);
		
		return llist;
	}

	@Override
	public int followingList(FollowingVo fv) {
		
		int value = ssm1.followingList(fv);
		
		return value;
	}

	@Override
	public int insertfollowing(FollowingVo fv) {
		
		int value = ssm1.insertfollowing(fv);
		
		return value;
	}

	@Override
	public int updatefollowing(FollowingVo fv) {
		
		int value = ssm1.updatefollowing(fv);
		
		return value;
	}

	@Override
	public Integer nowfollowingState(int memberNo, int followingMemberNo) {
		return ssm1.nowfollowingState(memberNo,followingMemberNo);
	}

	@Override
	public ArrayList<LikeMemberDto> getlikeMemberList(int boardNo) {
		
		ArrayList<LikeMemberDto> value = ssm1.getlikeMemberList(boardNo);
		
		return value;
	}

	@Override
	public int boardDelete(LikesDto ld) {
		
		int value = ssm1.boardDelete(ld);
		
		return value;
	}
	
	@Override
	public int hashtagCntUpdate(int boardNo) {
		
		int value = ssm1.hashtagCntUpdate(boardNo);
		
		return value;
	}

	@Override
	public int board_hashtagDelete(int boardNo) {
		
		int value = ssm1.board_hashtagDelete(boardNo);
		
		return value;
	}



	@Override
	public ArrayList<HashTagVo> hashTagTotalList(int memberNo) {
		
		ArrayList<HashTagVo> value = ssm1.hashTagTotalList(memberNo);
				
		return value;
	}

	@Override
	public ArrayList<LikesDto> boardHashTagList(int memberNo, int hashTagNo) {
		
		ArrayList<LikesDto> llist = ssm1.boardHashTagList(memberNo,hashTagNo);
		
		return llist;
	}


	
	


}